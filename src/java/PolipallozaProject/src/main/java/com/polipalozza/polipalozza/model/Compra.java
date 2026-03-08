package com.polipalozza.polipalozza.model;

import jakarta.persistence.*;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "Compra")
public class Compra {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private LocalDateTime fecha;
    private Integer cantCuotas;

    @ManyToOne
    @JoinColumn(name = "dniCliente", referencedColumnName = "dni")
    private Cliente cliente;

    @ManyToOne
    @JoinColumn(name = "idTarjeta", referencedColumnName = "id")
    private Tarjeta tarjeta;

    public Compra() {
    }

    public Compra(Integer id, LocalDateTime fecha, Integer cantCuotas, Cliente cliente, Tarjeta tarjeta) {
        this.id = id;
        this.fecha = fecha;
        this.cantCuotas = cantCuotas;
        this.cliente = cliente;
        this.tarjeta = tarjeta;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public LocalDateTime getFecha() {
        return fecha;
    }

    public void setFecha(LocalDateTime fecha) {
        this.fecha = fecha;
    }

    public Integer getCantCuotas() {
        return cantCuotas;
    }

    public void setCantCuotas(Integer cantCuotas) {
        this.cantCuotas = cantCuotas;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Tarjeta getTarjeta() {
        return tarjeta;
    }

    public void setTarjeta(Tarjeta tarjeta) {
        this.tarjeta = tarjeta;
    }
}