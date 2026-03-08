package com.polipalozza.polipalozza.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.polipalozza.polipalozza.model.CompraTicket;

public interface CompraTicketRepository extends JpaRepository<CompraTicket, Integer> {
}
