package com.polipalozza.polipalozza.model;

import jakarta.persistence.Embeddable;
import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class GrillaFavoritoId implements Serializable {
    private Integer idGrilla;
    private Integer idFavorito;

    public GrillaFavoritoId() {}

    public GrillaFavoritoId(Integer idGrilla, Integer idFavorito) {
        this.idGrilla = idGrilla;
        this.idFavorito = idFavorito;
    }

    public Integer getidGrilla() {
        return idGrilla;
    }

    public void setidGrilla(Integer idGrilla) {
        this.idGrilla = idGrilla;
    }

    public Integer getIdFavorito() {
        return idFavorito;
    }

    public void setIdFavorito(Integer idFavorito) {
        this.idFavorito = idFavorito;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        GrillaFavoritoId that = (GrillaFavoritoId) o;
        return Objects.equals(idGrilla, that.idGrilla) && Objects.equals(idFavorito, that.idFavorito);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idGrilla, idFavorito);
    }
}
