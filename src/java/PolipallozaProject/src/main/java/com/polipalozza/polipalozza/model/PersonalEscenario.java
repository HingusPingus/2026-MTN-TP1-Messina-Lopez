package com.polipalozza.polipalozza.model;

import jakarta.persistence.*;
import java.time.LocalTime;

@Entity
@Table(name = "Personal_Escenario")
public class PersonalEscenario {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "idPersonal")
    private Personal personal;

    @ManyToOne
    @JoinColumn(name = "idEscenario")
    private Escenario escenario;

    private Integer dia;
    private LocalTime horaInicio;
    private LocalTime horaFin;

    public PersonalEscenario() {
    }

    public PersonalEscenario(Integer id, Personal personal, Escenario escenario, Integer dia, LocalTime horaInicio, LocalTime horaFin) {
        this.id = id;
        this.personal = personal;
        this.escenario = escenario;
        this.dia = dia;
        this.horaInicio = horaInicio;
        this.horaFin = horaFin;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Personal getPersonal() {
        return personal;
    }

    public void setPersonal(Personal personal) {
        this.personal = personal;
    }

    public Escenario getEscenario() {
        return escenario;
    }

    public void setEscenario(Escenario escenario) {
        this.escenario = escenario;
    }

    public Integer getDia() {
        return dia;
    }

    public void setDia(Integer dia) {
        this.dia = dia;
    }

    public LocalTime getHoraInicio() {
        return horaInicio;
    }

    public void setHoraInicio(LocalTime horaInicio) {
        this.horaInicio = horaInicio;
    }

    public LocalTime getHoraFin() {
        return horaFin;
    }

    public void setHoraFin(LocalTime horaFin) {
        this.horaFin = horaFin;
    }
}
