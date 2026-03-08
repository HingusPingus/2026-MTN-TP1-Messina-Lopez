package com.polipalozza.polipalozza.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.polipalozza.polipalozza.model.Ticket;

public interface TicketRepository extends JpaRepository<Ticket, Integer> {

}