package com.polipalozza.polipalozza.model;

import jakarta.persistence.*;

@Entity
@Table(name = "Compra_Merch")
@IdClass(CompraMerchId.class)
public class CompraMerch {

    @Id
    @Column(name = "idCompra")
    private Integer idCompra;

    @Id
    @Column(name = "idMerch")
    private Integer idMerch;

    private Integer cantidad;
    private Integer diaRetiro;

    public CompraMerch() {}

    public CompraMerch(Integer idCompra, Integer idMerch, Integer cantidad, Integer diaRetiro) {
        this.idCompra = idCompra;
        this.idMerch = idMerch;
        this.cantidad = cantidad;
        this.diaRetiro = diaRetiro;
    }

    public Integer getIdCompra() {
        return idCompra;
    }

    public void setIdCompra(Integer idCompra) {
        this.idCompra = idCompra;
    }

    public Integer getIdMerch() {
        return idMerch;
    }

    public void setIdMerch(Integer idMerch) {
        this.idMerch = idMerch;
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
}