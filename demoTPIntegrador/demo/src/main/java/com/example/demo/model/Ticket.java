package com.example.demo.model;

import jakarta.persistence.*;
import java.time.LocalDate;
import java.time.LocalTime;

@Entity
@Table(name = "tickets")
public class Ticket {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idTicket;

    @ManyToOne
    @JoinColumn(name = "id_usuario", nullable = false)
    private Usuario usuario;

    @ManyToOne
    @JoinColumn(name = "id_info", nullable = false)
    private InformacionMuseo informacionMuseo;

    private LocalDate fechaReserva;
    private LocalTime horaReserva;
    private Integer cantidadPersonas;

    @Enumerated(EnumType.STRING)
    private EstadoTicket estado;

    public Ticket() {}

    public Ticket(Usuario usuario,
                  InformacionMuseo informacionMuseo,
                  LocalDate fechaReserva,
                  LocalTime horaReserva,
                  Integer cantidadPersonas) {

        this.usuario = usuario;
        this.informacionMuseo = informacionMuseo;
        this.fechaReserva = fechaReserva;
        this.horaReserva = horaReserva;
        this.cantidadPersonas = cantidadPersonas;
        this.estado = EstadoTicket.ACTIVA;
    }

    // ---------- GETTERS Y SETTERS ----------

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
