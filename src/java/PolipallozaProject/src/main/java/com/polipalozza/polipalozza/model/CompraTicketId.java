package com.polipalozza.polipalozza.model;

import jakarta.persistence.Embeddable;
import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class CompraTicketId implements Serializable {
    private Integer idCompra;
    private Integer idTicket;

    public CompraTicketId() {}

    public CompraTicketId(Integer idCompra, Integer idTicket) {
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CompraTicketId that = (CompraTicketId) o;
        return Objects.equals(idCompra, that.idCompra) && Objects.equals(idTicket, that.idTicket);  // Cambio aquí: idMerch -> idTicket
    }

    @Override
    public int hashCode() {
        return Objects.hash(idCompra, idTicket);
    }
}
