package com.polipalozza.polipalozza.model;

import jakarta.persistence.*;

@Entity
@Table(name = "Compra_Ticket")
@IdClass(CompraTicketId.class)
public class CompraTicket {


    @Id
    @Column(name = "idCompra")
    private Integer idCompra;

    @Id
    @Column(name = "idTicket")
    private Integer idTicket;

    public CompraTicket() {
    }

    public CompraTicket(Integer idCompra, Integer idTicket) {
        this.idCompra = idCompra;
        this.idTicket = idTicket;
    }

    public Integer getIdCompra() {
        return idCompra;
    }

    public void setIdCompra(Integer idCompra) {
        this.idCompra = idCompra;
    }

    public Integer getIdTicket() {
        return idTicket;
    }

    public void setIdTicket(Integer idTicket) {
        this.idTicket = idTicket;
    }
}
