package com.polipalozza.polipalozza.dto;

public class EscenarioDTO {
    private String nombre;
    private String ubicacion;
    private Integer idSponsor;

    public EscenarioDTO() {}

    public EscenarioDTO(String nombre, String ubicacion, Integer idSponsor) {
        this.nombre = nombre;
        this.ubicacion = ubicacion;
        this.idSponsor = idSponsor;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getUbicacion() {
        return ubicacion;
    }

    public void setUbicacion(String ubicacion) {
        this.ubicacion = ubicacion;
    }

    public Integer getIdSponsor() {
        return idSponsor;
    }

    public void setIdSponsor(Integer idSponsor) {
        this.idSponsor = idSponsor;
    }
}