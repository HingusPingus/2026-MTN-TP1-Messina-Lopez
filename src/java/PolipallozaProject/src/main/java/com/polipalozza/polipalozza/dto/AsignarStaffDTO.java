package com.polipalozza.polipalozza.dto;

import java.time.LocalTime;
import java.util.List;

public class AsignarStaffDTO {
    private List<Integer> idPersonales;
    private Integer idEscenario;
    private Integer dia;
    private LocalTime horaInicio;
    private LocalTime horaFin;

    public AsignarStaffDTO() {}

    public AsignarStaffDTO(List<Integer> idPersonales, Integer idEscenario, Integer dia, LocalTime horaInicio, LocalTime horaFin) {
        this.idPersonales = idPersonales;
        this.idEscenario = idEscenario;
        this.dia = dia;
        this.horaInicio = horaInicio;
        this.horaFin = horaFin;
    }

    public List<Integer> getIdPersonales() {
        return idPersonales;
    }

    public void setIdPersonales(List<Integer> idPersonales) {
        this.idPersonales = idPersonales;
    }

    public Integer getIdEscenario() {
        return idEscenario;
    }

    public void setIdEscenario(Integer idEscenario) {
        this.idEscenario = idEscenario;
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
