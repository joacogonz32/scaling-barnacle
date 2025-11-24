package com.example.demo.model;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDate;
import java.time.LocalTime;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name="tickets")
public class Ticket {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idTicket;

    @ManyToOne
    @JoinColumn(name="id_usuario")
    private Usuario usuario;

    @ManyToOne
    @JoinColumn(name="id_info")
    private InformacionMuseo informacionMuseo;

    @ManyToOne
    @JoinColumn(name="id_evento", nullable = true)
    private Evento evento;

    private LocalDate fechaReserva;
    private LocalTime horaReserva;
    private Integer cantidadPersonas;

    @Enumerated(EnumType.STRING)
    private EstadoTicket estado;

    public Ticket() {}

    public Ticket(Usuario usuario, InformacionMuseo informacionMuseo, Evento evento,
                  LocalDate fechaReserva, LocalTime horaReserva,
                  Integer cantidadPersonas, EstadoTicket estado) {
        this.usuario = usuario;
        this.informacionMuseo = informacionMuseo;
        this.evento = evento;
        this.fechaReserva = fechaReserva;
        this.horaReserva = horaReserva;
        this.cantidadPersonas = cantidadPersonas;
        this.estado = estado;
    }

    public Long getIdTicket() {
        return idTicket;
    }

    public void setIdTicket(Long idTicket) {
        this.idTicket = idTicket;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public InformacionMuseo getInformacionMuseo() {
        return informacionMuseo;
    }

    public void setInformacionMuseo(InformacionMuseo informacionMuseo) {
        this.informacionMuseo = informacionMuseo;
    }

    public Evento getEvento() {
        return evento;
    }

    public void setEvento(Evento evento) {
        this.evento = evento;
    }

    public LocalDate getFechaReserva() {
        return fechaReserva;
    }

    public void setFechaReserva(LocalDate fechaReserva) {
        this.fechaReserva = fechaReserva;
    }

    public LocalTime getHoraReserva() {
        return horaReserva;
    }

    public void setHoraReserva(LocalTime horaReserva) {
        this.horaReserva = horaReserva;
    }

    public Integer getCantidadPersonas() {
        return cantidadPersonas;
    }

    public void setCantidadPersonas(Integer cantidadPersonas) {
        this.cantidadPersonas = cantidadPersonas;
    }

    public EstadoTicket getEstado() {
        return estado;
    }

    public void setEstado(EstadoTicket estado) {
        this.estado = estado;
    }

    public enum EstadoTicket {
        ACTIVA, CANCELADA, VENCIDO
    }
}
