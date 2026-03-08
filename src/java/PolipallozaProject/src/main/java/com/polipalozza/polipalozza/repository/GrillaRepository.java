package com.polipalozza.polipalozza.repository;

import com.polipalozza.polipalozza.model.*;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface GrillaRepository extends JpaRepository<Grilla, Integer> {
    Optional<Grilla> findByCliente(Cliente cliente);
}