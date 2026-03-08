package com.polipalozza.polipalozza.model;

import jakarta.persistence.*;

@Entity
@Table(name = "Dia")
public class Dia {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private Integer cantDia;

    public Dia() {
    }

    public Dia(Integer id, Integer cantDia) {
        this.id = id;
        this.cantDia = cantDia;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCantDia() {
        return cantDia;
    }

    public void setCantDia(Integer cantDia) {
        this.cantDia = cantDia;
    }
}
