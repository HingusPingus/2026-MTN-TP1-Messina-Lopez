package com.polipalozza.polipalozza.model;

import jakarta.persistence.*;

@Entity
@Table(name = "Sponsor")
public class Sponsor {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String nombre;
    private String rubro;

    public Sponsor() {
    }

    public Sponsor(Integer id, String nombre, String rubro) {
        this.id = id;
        this.nombre = nombre;
        this.rubro = rubro;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getRubro() {
        return rubro;
    }

    public void setRubro(String rubro) {
        this.rubro = rubro;
    }
}
