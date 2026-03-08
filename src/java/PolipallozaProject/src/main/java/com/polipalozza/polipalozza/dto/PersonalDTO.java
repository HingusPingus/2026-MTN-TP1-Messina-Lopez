package com.polipalozza.polipalozza.dto;

public class PersonalDTO extends PersonaDTO{
    private Boolean esVoluntario;
    private String rolNombre;

    public PersonalDTO(Integer dni, String nombre, String apellido, String mail, Boolean esVoluntario, String rolNombre) {
        super(dni, nombre, apellido, mail);
        this.esVoluntario = esVoluntario;
        this.rolNombre = rolNombre;
    }

    public Boolean getEsVoluntario() {
        return esVoluntario;
    }

    public void setEsVoluntario(Boolean esVoluntario) {
        this.esVoluntario = esVoluntario;
    }

    public String getRolNombre() {
        return rolNombre;
    }

    public void setRolNombre(String rolNombre) {
        this.rolNombre = rolNombre;
    }
}
