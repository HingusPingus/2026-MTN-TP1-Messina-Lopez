package com.polipalozza.polipalozza.model;

import jakarta.persistence.Embeddable;
import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class CompraMerchId implements Serializable {

    private Integer idCompra;
    private Integer idMerch;

    public CompraMerchId() {}

    public CompraMerchId(Integer idCompra, Integer idMerch) {
        this.idCompra = idCompra;
        this.idMerch = idMerch;
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CompraMerchId that = (CompraMerchId) o;
        return Objects.equals(idCompra, that.idCompra) && Objects.equals(idMerch, that.idMerch);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idCompra, idMerch);
    }
}