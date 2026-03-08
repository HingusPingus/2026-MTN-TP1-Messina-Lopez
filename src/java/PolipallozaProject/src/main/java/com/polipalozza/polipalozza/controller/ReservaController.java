package com.polipalozza.polipalozza.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.polipalozza.polipalozza.dto.*;
import com.polipalozza.polipalozza.service.*;

@RestController
@RequestMapping("/api/reservas")

public class ReservaController {

    @Autowired private MerchService merchService;
    @Autowired private TicketService ticketService;

    @PostMapping("/merch")
    public String reservarMerch(@RequestBody MerchReservaDTO dto){
        try{
            return merchService.reservarMerch(dto);
        } catch (Exception e) {
            return e.getMessage();
        }
    }

    @PostMapping("/ticket")
    public String reservaTicket(@RequestBody TicketReservaDTO dto){
        try{
            return ticketService.reservarTicket(dto);
        } catch (Exception e) {
            return e.getMessage();
        }
    }
}
