package com.polipalozza.polipalozza.repository;

import com.polipalozza.polipalozza.model.Tarjeta;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

public interface TarjetaRepository extends JpaRepository<Tarjeta, Integer> {
    Tarjeta findByNumero(String numero);
    boolean existsById(Long id);
}
