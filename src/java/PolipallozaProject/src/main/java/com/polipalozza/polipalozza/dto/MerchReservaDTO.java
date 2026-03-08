package com.polipalozza.polipalozza.dto;

import com.polipalozza.polipalozza.model.Tarjeta;

public class MerchReservaDTO { // fecha de la reserva con LocalDateTime.now()
    private Integer idCliente;
    private Integer idMerch;
    private Integer cantCuotas;
    private Integer cantidad;
    private Integer diaRetiro;
    private Tarjeta tarjeta;

    public MerchReservaDTO(){

    }

    public MerchReservaDTO(Integer idCliente, Integer idMerch, Integer cantCuotas, Integer cantidad, Integer diaRetiro, Tarjeta tarjeta) {
        this.idCliente = idCliente;
        this.idMerch = idMerch;
        this.cantCuotas = cantCuotas;
        this.cantidad = cantidad;
        this.diaRetiro = diaRetiro;
        this.tarjeta = tarjeta;
    }

    public Integer getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(Integer idCliente) {
        this.idCliente = idCliente;
    }

    public Integer getIdMerch() {
        return idMerch;
    }

    public void setIdMerch(Integer idMerch) {
        this.idMerch = idMerch;
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

    public Integer getDiaRetiro() {
        return diaRetiro;
    }

    public void setDiaRetiro(Integer diaRetiro) {
        this.diaRetiro = diaRetiro;
    }

    public Tarjeta getTarjeta() {
        return tarjeta;
    }

    public void setTarjeta(Tarjeta tarjeta) {
        this.tarjeta = tarjeta;
    }
}
