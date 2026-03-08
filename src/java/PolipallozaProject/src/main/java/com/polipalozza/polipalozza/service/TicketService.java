package com.polipalozza.polipalozza.service;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import com.polipalozza.polipalozza.dto.*;
import com.polipalozza.polipalozza.model.*;
import com.polipalozza.polipalozza.repository.*;
import java.time.LocalDateTime;

@Service
public class TicketService {
    @Autowired private DiaRepository diaRepo;
    @Autowired private TicketRepository ticketRepo;
    @Autowired private CompraRepository compraRepo;
    @Autowired private CompraTicketRepository compraTicketRepo;
    @Autowired private ClienteRepository clienteRepo;
    @Autowired private TarjetaRepository tarjetaRepo;

    @Transactional
    public String reservarTicket(TicketReservaDTO dto) {
        Dia dia = diaRepo.findById(dto.getCantDia()).orElseGet(() -> {
            Dia nuevoDia = new Dia();
            nuevoDia.setCantDia(dto.getCantDia());
            return diaRepo.save(nuevoDia);
        });

        // Validación de tarjeta
        try {
            dto.getTarjeta().validar();
        } catch (Exception e) {
            throw new RuntimeException("Error al validar la tarjeta", e);
        }

        // Verifica que el cliente exista
        Cliente c = clienteRepo.findById(dto.getIdCliente()).orElseThrow(() -> new IllegalArgumentException("Cliente no encontrado"));

        // Verifica si la tarjeta ya existe en la base de datos
        Tarjeta tarjeta = tarjetaRepo.findByNumero(dto.getTarjeta().getNumero());

        // Si la tarjeta no existe, la guardamos
        if (tarjeta == null) {
            tarjeta = tarjetaRepo.save(dto.getTarjeta());
        }


        Compra compra = new Compra();
        compra.setFecha(LocalDateTime.now());
        compra.setCantCuotas(dto.getCantCuotas());
        compra.setCliente(c);
        compra.setTarjeta(tarjeta);
        compra = compraRepo.save(compra);


        Ticket ticket = new Ticket();
        ticket.setIdDia(dto.getCantDia());
        ticket = ticketRepo.save(ticket); //


        CompraTicket ct = new CompraTicket();
        ct.setIdCompra(compra.getId());
        ct.setIdTicket(ticket.getId());
        compraTicketRepo.save(ct);

        return "Compra exitosa";
    }
}

