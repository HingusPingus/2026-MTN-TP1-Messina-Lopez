package com.polipalozza.polipalozza.controller;

import com.polipalozza.polipalozza.dto.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.polipalozza.polipalozza.service.*;
import com.polipalozza.polipalozza.model.*;

@RestController
@RequestMapping("/api/admin")
public class AdminController {

    @Autowired private AdminService adminService;

    @PostMapping("/escenarios")
    public String crearEscenario(@RequestBody Escenario e) {
        return adminService.crearEscenario(e);
    }

    @PostMapping("/shows")
    public String cargarSetlist(@RequestBody SetlistDTO setlistDTO) {
        return adminService.cargarSetlist(setlistDTO);
    }

    @PostMapping("/staff")
    public String asignarStaff(@RequestBody AsignarStaffDTO asignarStaffDTO) {
        return adminService.asignarPersonalAEscenario(asignarStaffDTO);
    }
}