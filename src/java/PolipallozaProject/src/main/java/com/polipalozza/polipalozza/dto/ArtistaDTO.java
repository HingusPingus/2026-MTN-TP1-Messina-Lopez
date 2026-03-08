package com.polipalozza.polipalozza.dto;

public class ArtistaDTO extends PersonaDTO {
    private String generoMusical;
    private String nombreArtistico;

    public ArtistaDTO(Integer dni, String nombre, String apellido, String mail, String generoMusical, String nombreArtistico) {
        super(dni, nombre, apellido, mail);
        this.generoMusical = generoMusical;
        this.nombreArtistico = nombreArtistico;
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
