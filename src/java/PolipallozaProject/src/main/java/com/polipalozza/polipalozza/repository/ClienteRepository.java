package com.polipalozza.polipalozza.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.polipalozza.polipalozza.model.Cliente;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface ClienteRepository extends JpaRepository<Cliente, Integer> {
    @Query("SELECT c FROM Cliente c WHERE c.dni = :dni")
    Optional<Cliente> findByDni(@Param("dni") Integer dni);
}
