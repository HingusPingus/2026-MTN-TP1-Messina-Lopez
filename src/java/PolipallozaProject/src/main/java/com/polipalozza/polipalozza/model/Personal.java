package com.polipalozza.polipalozza.model;

import jakarta.persistence.*;

@Entity
@Table(name = "Personal")
public class Personal {
    @Id
    private Integer dni;

    private Boolean voluntario;
    private String contrasenia;

    @ManyToOne
    @JoinColumn(name = "idRol")
    private Rol rol;

    @Column(name = "dni", insertable = false, updatable = false)
    private Integer dniPersona;

    public Personal() {}

    public Personal(Integer dni, Boolean voluntario, String contrasenia, Rol rol) {
        this.dni = dni;
        this.voluntario = voluntario;
        this.contrasenia = contrasenia;
        this.rol = rol;
        this.dniPersona = dni;
    }

    public Integer getDni() {
        return dni;
    }

    public void setDni(Integer dni) {
        this.dni = dni;
    }

    public Boolean getVoluntario() {
        return voluntario;
    }

    public void setVoluntario(Boolean voluntario) {
        this.voluntario = voluntario;
    }

    public String getContrasenia() {
        return contrasenia;
    }

    public void setContrasenia(String contrasenia) {
        this.contrasenia = contrasenia;
    }

    public Rol getRol() {
        return rol;
    }

    public void setRol(Rol rol) {
        this.rol = rol;
    }

    public Integer getDniPersona() {
        return dniPersona;
    }

    public void setDniPersona(Integer dniPersona) {
        this.dniPersona = dniPersona;
    }
}