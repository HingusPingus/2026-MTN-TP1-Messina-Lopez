package com.polipalozza.polipalozza.model;

import jakarta.persistence.*;
import java.util.List;

@Entity
@Table(name = "Artista")
public class Artista {
    @Id
    private Integer dni;

    private String generoMusical;
    private Boolean destacado;
    private String nombreArtistico;

    @Column(name = "dni", insertable = false, updatable = false)
    private Integer dniPersona;

    public Artista() {
    }

    public Artista(Integer dni, String generoMusical, Boolean destacado, String nombreArtistico) {
        this.dni = dni;
        this.generoMusical = generoMusical;
        this.destacado = destacado;
        this.nombreArtistico = nombreArtistico;
        this.dniPersona = dni;
    }

    public Integer getDni() {
        return dni;
    }

    public void setDni(Integer dni) {
        this.dni = dni;
    }

    public String getGeneroMusical() {
        return generoMusical;
    }

    public void setGeneroMusical(String generoMusical) {
        this.generoMusical = generoMusical;
    }

    public Boolean getDestacado() {
        return destacado;
    }

    public void setDestacado(Boolean destacado) {
        this.destacado = destacado;
    }

    public Integer getDniPersona() {
        return dniPersona;
    }

    public void setDniPersona(Integer dniPersona) {
        this.dniPersona = dniPersona;
    }

    public String getNombreArtistico() {
        return nombreArtistico;
    }

    public void setNombreArtistico(String nombreArtistico) {
        this.nombreArtistico = nombreArtistico;
    }
}
