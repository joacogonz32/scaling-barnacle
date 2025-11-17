package com.example.demo.controller;

import com.example.demo.model.Evento;
import com.example.demo.model.Piso;
import com.example.demo.service.EventoService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/eventos")
public class EventoController {

    private final EventoService eventoService;

    public EventoController(EventoService eventoService) {
        this.eventoService = eventoService;
    }

    @GetMapping("/{id}")
    public ResponseEntity<Evento> obtener(@PathVariable Long id) {
        Evento e = eventoService.obtenerPorId(id);
        if (e == null) return ResponseEntity.notFound().build();
        return ResponseEntity.ok(e);
    }

    @GetMapping
    public List<Evento> listarEventos() {
        return eventoService.obtenerTodos();
    }
}
