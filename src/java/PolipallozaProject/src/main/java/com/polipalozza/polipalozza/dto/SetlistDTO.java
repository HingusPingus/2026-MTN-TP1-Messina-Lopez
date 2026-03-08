package com.polipalozza.polipalozza.dto;

import java.time.LocalTime;

public class SetlistDTO {
    private Integer idArtista;
    private Integer idEscenario;
    private LocalTime horaInicio;
    private LocalTime horaFin;
    private int dia;

    public SetlistDTO(){

    }

    public SetlistDTO(Integer idArtista, Integer idEscenario, LocalTime horaInicio, LocalTime horaFin, int dia) {
        this.idArtista = idArtista;
        this.idEscenario = idEscenario;
        this.horaInicio = horaInicio;
        this.horaFin = horaFin;
        this.dia = dia;
    }

    public Integer getIdArtista() {
        return idArtista;
    }

    public void setIdArtista(Integer idArtista) {
        this.idArtista = idArtista;
    }

    public Integer getIdEscenario() {
        return idEscenario;
    }

    public void setIdEscenario(Integer idEscenario) {
        this.idEscenario = idEscenario;
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

    public int getDia() {
        return dia;
    }

    public void setDia(int dia) {
        this.dia = dia;
    }
}
