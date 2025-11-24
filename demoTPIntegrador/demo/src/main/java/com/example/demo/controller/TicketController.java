package com.example.demo.controller;

import com.example.demo.dto.ReservaRequest;
import com.example.demo.model.Evento;
import com.example.demo.model.InformacionMuseo;
import com.example.demo.model.Ticket;
import com.example.demo.model.Usuario;
import com.example.demo.service.EventoService;
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
@CrossOrigin(origins = "*")
public class TicketController {

    private final TicketService ticketService;
    private final UsuarioService usuarioService;
    private final HomeService homeService;
    private final EventoService eventoService;

    public TicketController(TicketService ticketService, UsuarioService usuarioService,
                            HomeService homeService, EventoService eventoService) {
        this.ticketService = ticketService;
        this.usuarioService = usuarioService;
        this.homeService = homeService;
        this.eventoService = eventoService;
    }

    @GetMapping
    public ResponseEntity<List<Ticket>> listar() {
        return ResponseEntity.ok(ticketService.listarTickets());
    }

    @PostMapping("/reservar/{idInfoMuseo}/{idEvento}")
    public ResponseEntity<Ticket> reservar(@PathVariable Long idInfoMuseo,
                                           @PathVariable Long idEvento,
                                           @RequestBody ReservaRequest request) {
        try {
            Usuario usuario = usuarioService.obtenerPorId(request.getIdUsuario());
            InformacionMuseo infoMuseo = homeService.obtenerPorId(idInfoMuseo);
            Evento evento = eventoService.obtenerPorId(idEvento);

            if (usuario == null) {
                return ResponseEntity.badRequest().header("Error", "Usuario no encontrado").build();
            }
            if (infoMuseo == null) {
                return ResponseEntity.badRequest().header("Error", "Información de museo no encontrada").build();
            }
            if (evento == null) {
                return ResponseEntity.badRequest().header("Error", "Evento no encontrado").build();
            }

            LocalDate fechaReserva = LocalDate.parse(request.getFecha());
            LocalTime horaReserva = LocalTime.parse(request.getHora());
            Integer cantidadPersonas = request.getCantidadPersonas();

            Ticket ticket = new Ticket(
                    usuario,
                    infoMuseo,
                    evento,
                    fechaReserva,
                    horaReserva,
                    cantidadPersonas,
                    Ticket.EstadoTicket.ACTIVA
            );

            Ticket nuevoTicket = ticketService.reservar(ticket);
            return ResponseEntity.ok(nuevoTicket);

        } catch (Exception e) {
            return ResponseEntity.badRequest().header("Error",
                    "Error al procesar la reserva: " + e.getMessage()).build();
        }
    }
}
