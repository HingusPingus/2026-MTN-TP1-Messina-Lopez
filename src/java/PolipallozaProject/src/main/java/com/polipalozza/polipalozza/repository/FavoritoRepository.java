package com.polipalozza.polipalozza.repository;

import com.polipalozza.polipalozza.model.Cliente;
import com.polipalozza.polipalozza.model.Favorito;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface FavoritoRepository extends JpaRepository<Favorito, Integer> {
    
    // Método para buscar favoritos por cliente
    @Query("SELECT f FROM Favorito f WHERE f.cliente.dni = :dniCliente")
    List<Favorito> findByClienteDni(@Param("dniCliente") Integer dniCliente);
    
    // Método alternativo si prefieres pasar el objeto Cliente
    @Query("SELECT f FROM Favorito f WHERE f.cliente = :cliente")
    List<Favorito> findByCliente(@Param("cliente") Cliente cliente);
    
    boolean existsByClienteAndSetlist(Cliente cliente, com.polipalozza.polipalozza.model.Setlist setlist);

    Optional<Favorito> findByClienteAndSetlist(Cliente cliente, com.polipalozza.polipalozza.model.Setlist setlist);
}