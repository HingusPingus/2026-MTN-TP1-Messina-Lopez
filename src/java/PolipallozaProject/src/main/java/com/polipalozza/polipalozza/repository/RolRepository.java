package com.polipalozza.polipalozza.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.polipalozza.polipalozza.model.Rol;

public interface RolRepository extends JpaRepository<Rol, Integer> {
    Rol findByNombre(String nombre);
}
