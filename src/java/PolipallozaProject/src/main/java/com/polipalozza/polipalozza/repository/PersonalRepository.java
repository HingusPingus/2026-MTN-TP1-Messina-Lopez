package com.polipalozza.polipalozza.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.polipalozza.polipalozza.model.Personal;

public interface PersonalRepository extends JpaRepository<Personal, Integer> {}
