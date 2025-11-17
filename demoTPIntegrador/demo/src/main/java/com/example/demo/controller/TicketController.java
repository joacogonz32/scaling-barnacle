package com.example.demo.controller;

import com.example.demo.dto.ReservaRequest;
import com.example.demo.model.Obra;
import com.example.demo.model.Ticket;
import com.example.demo.model.Usuario;
import com.example.demo.service.ObraService;
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
    private final ObraService obraService;

    public TicketController(TicketService ticketService, UsuarioService usuarioService, ObraService obraService) {
        this.ticketService = ticketService;
        this.usuarioService = usuarioService;
        this.obraService = obraService;
    }

    @GetMapping
    public ResponseEntity<List<Ticket>> listar() {
        return ResponseEntity.ok(ticketService.listarTickets());
    }

    @PostMapping("/reservar/{idObra}")
    public ResponseEntity<Ticket> reservar(@PathVariable Long idObra, @RequestBody ReservaRequest request) {
        try {
            Usuario usuario = usuarioService.obtenerPorId(request.getIdUsuario());
            Obra obra = obraService.obtenerPorId(idObra);

            if (usuario == null) {
                return ResponseEntity.badRequest().header("Error", "Usuario no encontrado").build();
            }
            if (obra == null) {
                return ResponseEntity.badRequest().header("Error", "Obra no encontrada para la reserva").build();
            }

            LocalDate fechaReserva = LocalDate.parse(request.getFecha());
            LocalTime horaReserva = LocalTime.parse(request.getHora());
            Integer cantidadPersonas = request.getCantidadPersonas();

            // Usando el constructor de todos los argumentos (@AllArgsConstructor)
            Ticket ticket = new Ticket(null, usuario, obra, fechaReserva, horaReserva, cantidadPersonas, Ticket.EstadoTicket.ACTIVA);

            Ticket nuevoTicket = ticketService.reservar(ticket);
            return ResponseEntity.ok(nuevoTicket);
        } catch (Exception e) {
            return ResponseEntity.badRequest().header("Error", "Error al procesar la reserva: " + e.getMessage()).build();
        }
    }
}