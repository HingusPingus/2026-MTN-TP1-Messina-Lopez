package com.polipalozza.polipalozza.dto;

public class UsuarioDTO { // lo uso para registros, por eso tiene todo
    private Integer dni;
    private String nombre;
    private String apellido;
    private String mail;
    private String contrasenia;
    private Boolean esVoluntario; // solo para personal
    private String rolNombre; // solo para personal
    private String generoMusical; // solo para artistas
    private String nombreArtistico; // solo para artistas

    public UsuarioDTO() {}

    public UsuarioDTO(Integer dni, String nombre, String apellido, String mail, String contrasenia, Boolean esVoluntario, String rolNombre, String generoMusical, String nombreArtistico) {
        this.dni = dni;
        this.nombre = nombre;
        this.apellido = apellido;
        this.mail = mail;
        this.contrasenia = contrasenia;
        this.esVoluntario = esVoluntario;
        this.rolNombre = rolNombre;
        this.generoMusical = generoMusical;
        this.nombreArtistico = nombreArtistico;
    }

    public Integer getDni() {
        return dni;
    }

    public void setDni(Integer dni) {
        this.dni = dni;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getContrasenia() {
        return contrasenia;
    }

    public void setContrasenia(String contrasenia) {
        this.contrasenia = contrasenia;
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

    public String getGeneroMusical() {
        return generoMusical;
    }

    public void setGeneroMusical(String generoMusical) {
        this.generoMusical = generoMusical;
    }

    public String getNombreArtistico() {
        return nombreArtistico;
    }

    public void setNombreArtistico(String nombreArtistico) {
        this.nombreArtistico = nombreArtistico;
    }
}