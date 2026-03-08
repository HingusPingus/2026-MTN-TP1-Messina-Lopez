package com.polipalozza.polipalozza.model;

import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "Cliente")
public class Cliente {
    @Id
    private Integer dni;

    private String contrasenia;

    @Column(name = "dni", insertable = false, updatable = false)
    private Integer dniPersona;

    @OneToMany(mappedBy = "cliente", cascade = CascadeType.ALL)
    private List<Notificacion> notificaciones;

    @OneToMany(mappedBy = "cliente", cascade = CascadeType.ALL)
    private List<Favorito> favoritos;

    @OneToMany(mappedBy = "cliente", cascade = CascadeType.ALL)
    private List<Compra> compras;

    public Cliente() {
    }

    public Cliente(Integer dni, String contrasenia, List<Notificacion> notificaciones, List<Favorito> favoritos, List<Compra> compras) {
        this.dni = dni;
        this.contrasenia = contrasenia;
        this.dniPersona = dni;
        this.notificaciones = notificaciones;
        this.favoritos = favoritos;
        this.compras = compras;
    }

    public Cliente(Integer dni, String contrasenia) {
        this.dni = dni;
        this.contrasenia = contrasenia;
        this.dniPersona = dni;
    }

    public Integer getDni() {
        return dni;
    }

    public void setDni(Integer dni) {
        this.dni = dni;
    }

    public String getContrasenia() {
        return contrasenia;
    }

    public void setContrasenia(String contrasenia) {
        this.contrasenia = contrasenia;
    }

    public Integer getDniPersona() {
        return dniPersona;
    }

    public void setDniPersona(Integer dniPersona) {
        this.dniPersona = dniPersona;
    }

    public List<Notificacion> getNotificaciones() {
        return notificaciones;
    }

    public void setNotificaciones(List<Notificacion> notificaciones) {
        this.notificaciones = notificaciones;
    }

    public List<Favorito> getFavoritos() {
        return favoritos;
    }

    public void setFavoritos(List<Favorito> favoritos) {
        this.favoritos = favoritos;
    }

    public List<Compra> getCompras() {
        return compras;
    }

    public void setCompras(List<Compra> compras) {
        this.compras = compras;
    }
}
