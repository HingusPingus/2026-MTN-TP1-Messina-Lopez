package com.polipalozza.polipalozza.dto;

public class LoginDTO {
    private Integer dni;
    private String contrasenia;

    public LoginDTO(){

    }

    public LoginDTO(Integer dni, String contrasenia) {
        this.dni = dni;
        this.contrasenia = contrasenia;
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
}
