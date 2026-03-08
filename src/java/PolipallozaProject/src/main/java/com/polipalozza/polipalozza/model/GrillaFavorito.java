package com.polipalozza.polipalozza.model;

import jakarta.persistence.*;

@Entity
@Table(name = "Grilla_Favoritos")
public class GrillaFavorito {

    @EmbeddedId
    private GrillaFavoritoId id;

    @ManyToOne
    @MapsId("idGrilla")
    @JoinColumn(name = "idGrilla")
    private Grilla grilla;

    @ManyToOne
    @MapsId("idFavorito")
    @JoinColumn(name = "idFavorito")
    private Favorito favorito;

    public GrillaFavorito() {}

    public GrillaFavorito(Grilla grilla, Favorito favorito) {
        this.grilla = grilla;
        this.favorito = favorito;
        this.id = new GrillaFavoritoId(grilla.getId(), favorito.getId());
    }

    public Grilla getGrilla() {
        return grilla;
    }

    public void setGrilla(Grilla grilla) {
        this.grilla = grilla;
    }

    public Favorito getFavorito() {
        return favorito;
    }

    public void setFavorito(Favorito favorito) {
        this.favorito = favorito;
    }

    public GrillaFavoritoId getId() {
        return id;
    }

    public void setId(GrillaFavoritoId id) {
        this.id = id;
    }
}