package com.polipalozza.polipalozza.model;

import jakarta.persistence.*;

@Entity
@Table(name = "Favoritos")
public class Favorito {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "dniCliente", referencedColumnName = "dni")
    private Cliente cliente;

    @ManyToOne
    @JoinColumn(name = "idSetlist", referencedColumnName = "id")
    private Setlist setlist;

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

    public Setlist getSetlist() {
        return setlist;
    }

    public void setSetlist(Setlist setlist) {
        this.setlist = setlist;
    }
}