package com.example.demo.controller;

import com.example.demo.model.Piso;
import com.example.demo.model.Usuario;
import com.example.demo.service.PisoService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/pisos")
@CrossOrigin(origins = "*")
public class PisoController {

    private final PisoService pisoService;

    public PisoController(PisoService pisoService) {
        this.pisoService = pisoService;
    }

    @GetMapping("/{id}")
    public ResponseEntity<Piso> obtener(@PathVariable Long id) {
        Piso p = pisoService.obtenerPorId(id);
        if (p == null) return ResponseEntity.notFound().build();
        return ResponseEntity.ok(p);
    }
    @GetMapping
    public List<Piso> listarPisos() {
        return pisoService.obtenerTodos();
    }
}
