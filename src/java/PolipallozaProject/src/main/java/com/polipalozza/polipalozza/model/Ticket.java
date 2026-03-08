package com.polipalozza.polipalozza.model;

import jakarta.persistence.*;
import java.util.List;

@Entity
@Table(name = "Ticket")
public class Ticket {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "idDia")
    private Integer idDia;

    public Ticket() {
    }

    public Ticket(Integer id, Integer idDia) {
        this.id = id;
        this.idDia = idDia;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getIdDia() {
        return idDia;
    }

    public void setIdDia(Integer idDia) {
        this.idDia = idDia;
    }
}
