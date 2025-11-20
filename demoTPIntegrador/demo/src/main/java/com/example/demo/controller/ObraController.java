package com.example.demo.controller;

import com.example.demo.dto.VotoRequest;
import com.example.demo.model.Obra;
import com.example.demo.model.Valoracion;
import com.example.demo.service.ObraService;
import com.example.demo.service.ValoracionesService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/obras")
public class ObraController {

    private final ObraService obraService;
    private final ValoracionesService valoracionesService;


    public ObraController(ObraService obraService, ValoracionesService valoracionesService) {
        this.obraService = obraService;
        this.valoracionesService = valoracionesService;
    }

    @GetMapping
    public ResponseEntity<List<Obra>> filtrar(
            @RequestParam(required = false) String ubicacion,
            @RequestParam(required = false) String epoca,
            @RequestParam(required = false) String nombre,
            @RequestParam(required = false, defaultValue = "-1.0") Float popularidad
    ) {
        List<Obra> obras = obraService.filtrar(ubicacion, epoca, nombre, popularidad);
        return ResponseEntity.ok(obras);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Obra> obtener(@PathVariable Long id) {
        Obra o = obraService.obtenerPorId(id);
        if (o == null) return ResponseEntity.notFound().build();
        return ResponseEntity.ok(o);
    }

    @PostMapping("/{id}/votar")
    public ResponseEntity<Valoracion> votar(@PathVariable Long id, @RequestBody VotoRequest body) {
        try {
            Valoracion guardada = valoracionesService.votarObra(id, body.getIdUsuario(), body.getPuntaje(), body.getComentario());
            return ResponseEntity.ok(guardada);
        } catch (RuntimeException e) {
            return ResponseEntity.badRequest().header("Error", e.getMessage()).build();
        }
    }

}