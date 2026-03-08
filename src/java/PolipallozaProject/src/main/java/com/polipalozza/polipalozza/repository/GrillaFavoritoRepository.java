package com.polipalozza.polipalozza.repository;

import com.polipalozza.polipalozza.model.*;
import com.polipalozza.polipalozza.model.GrillaFavorito;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface GrillaFavoritoRepository extends JpaRepository<GrillaFavorito, Integer> {
    boolean existsByGrillaAndFavorito(Grilla grilla, Favorito favorito);

    void deleteByGrillaAndFavorito(Grilla grilla, Favorito favorito);
}