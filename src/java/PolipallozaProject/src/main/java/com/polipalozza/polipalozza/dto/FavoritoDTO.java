package com.polipalozza.polipalozza.dto;

public class FavoritoDTO {
    private Integer idSetlist;

    public FavoritoDTO(){

    }

    public FavoritoDTO(Integer idSetlist) {
        this.idSetlist = idSetlist;
    }

    public Integer getIdSetlist() {
        return idSetlist;
    }

    public void setIdSetlist(Integer idSetlist) {
        this.idSetlist = idSetlist;
    }
}
