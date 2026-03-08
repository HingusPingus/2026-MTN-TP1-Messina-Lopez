package com.polipalozza.polipalozza.dto;

import com.polipalozza.polipalozza.model.Tarjeta;

public class TicketReservaDTO {

    private Integer idCliente;
    private Integer cantDia;  // Día para el ticket (1, 2, 3)
    private Integer cantCuotas;
    private Integer cantidad;
    private Tarjeta tarjeta;

    public TicketReservaDTO(Integer idCliente, Integer cantDia, Integer cantCuotas, Integer cantidad, Tarjeta tarjeta) {
        this.idCliente = idCliente;
        this.cantDia = cantDia;
        this.cantCuotas = cantCuotas;
        this.cantidad = cantidad;
        this.tarjeta = tarjeta;
    }

    public Integer getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(Integer idCliente) {
        this.idCliente = idCliente;
    }

    public Integer getCantDia() {
        return cantDia;
    }

    public void setCantDia(Integer cantDia) {
        this.cantDia = cantDia;
    }

    public Integer getCantCuotas() {
        return cantCuotas;
    }

    public void setCantCuotas(Integer cantCuotas) {
        this.cantCuotas = cantCuotas;
    }

    public Integer getCantidad() {
        return cantidad;
    }

    public void setCantidad(Integer cantidad) {
        this.cantidad = cantidad;
    }

    public Tarjeta getTarjeta() {
        return tarjeta;
    }

    public void setTarjeta(Tarjeta tarjeta) {
        this.tarjeta = tarjeta;
    }
}