package com.polipalozza.polipalozza.model;

import jakarta.persistence.*;

import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "Grilla")
public class Grilla {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "dniCliente", referencedColumnName = "dni")
    private Cliente cliente;

    @ManyToMany
    @JoinTable(
            name = "Grilla_Favoritos", // Nombre de la tabla intermedia
            joinColumns = @JoinColumn(name = "idGrilla"),
            inverseJoinColumns = @JoinColumn(name = "idFavorito")
    )
    private Set<Favorito> favoritos = new HashSet<>();

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Set<Favorito> getFavoritos() {
        return favoritos;
    }

    public void setFavoritos(Set<Favorito> favoritos) {
        this.favoritos = favoritos;
    }
}