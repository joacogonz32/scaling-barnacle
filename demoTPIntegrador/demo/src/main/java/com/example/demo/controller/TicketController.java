package com.example.demo.controller;

import com.example.demo.dto.ReservaRequest;
import com.example.demo.model.InformacionMuseo;
import com.example.demo.model.Ticket;
import com.example.demo.model.Usuario;
import com.example.demo.service.HomeService;
import com.example.demo.service.HomeService;
import com.example.demo.service.TicketService;
import com.example.demo.service.UsuarioService;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

@RestController
@RequestMapping("/api/tickets")
public class TicketController {

    private final TicketService ticketService;
    private final UsuarioService usuarioService;
    private final HomeService infoService;

    public TicketController(TicketService ticketService, UsuarioService usuarioService, HomeService infoService) {
        this.ticketService = ticketService;
        this.usuarioService = usuarioService;
        this.infoService = infoService;
    }

    @GetMapping
    public ResponseEntity<List<Ticket>> listar() {
        return ResponseEntity.ok(ticketService.listarTickets());
    }

    @PostMapping("/reservar/{idInfo}")
    public ResponseEntity<Ticket> reservar(@PathVariable Long idInfo,
                                           @RequestBody ReservaRequest request) {
        try {
            Usuario usuario = usuarioService.obtenerPorId(request.getIdUsuario());
            InformacionMuseo info = infoService.obtenerPorId(idInfo);

            if (usuario == null) {
                return ResponseEntity.badRequest()
                        .header("Error", "Usuario no encontrado").build();
            }
            if (info == null) {
                return ResponseEntity.badRequest()
                        .header("Error", "Información no encontrada").build();
            }

            LocalDate fechaReserva = LocalDate.parse(request.getFecha());
            LocalTime horaReserva = LocalTime.parse(request.getHora());
            Integer cantidadPersonas = request.getCantidadPersonas();

            Ticket ticket = new Ticket(usuario, info, fechaReserva, horaReserva, cantidadPersonas, Ticket.EstadoTicket.ACTIVA);

            return ResponseEntity.ok(ticketService.reservar(ticket));

        } catch (Exception e) {
            return ResponseEntity.badRequest()
                    .header("Error", "Error al procesar la reserva: " + e.getMessage())
                    .build();
        }
    }
}
