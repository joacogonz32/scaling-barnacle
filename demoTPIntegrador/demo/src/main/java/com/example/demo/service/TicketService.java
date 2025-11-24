package com.example.demo.service;

import com.example.demo.model.Ticket;
import com.example.demo.repository.TicketRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TicketService {

    private final TicketRepository ticketRepository;

    public TicketService(TicketRepository ticketRepository) {
        this.ticketRepository = ticketRepository;
    }

    public List<Ticket> listarTickets() {
        return ticketRepository.findAll();
    }

    public Ticket reservar(Ticket ticket) {
        // Simplemente guardar el ticket y marcarlo como ACTIVA
        ticket.setEstado(Ticket.EstadoTicket.ACTIVA);
        return ticketRepository.save(ticket);
    }
}
