package com.polipalozza.polipalozza.service;

import com.polipalozza.polipalozza.dto.*;
import com.polipalozza.polipalozza.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.polipalozza.polipalozza.model.*;

import java.util.*;

@Service
public class AdminService {

    @Autowired private EscenarioRepository escenarioRepository;

    @Autowired private SetlistService setlistService;
    @Autowired private PersonalEscenarioService personalEscenarioService;

    public AdminService(EscenarioRepository escenarioRepository, PersonalEscenarioService personalEscenarioService) {
        this.escenarioRepository = escenarioRepository;
        this.personalEscenarioService = personalEscenarioService;
    }

    public String crearEscenario(Escenario e) {
        escenarioRepository.save(e);
        return "Escenario creado: " + e.getNombre() + " (ID: " + e.getId() + ")";
    }

    public String cargarSetlist(SetlistDTO setlistDTO) {
        return setlistService.cargarSetlist(setlistDTO);
    }

    public String asignarPersonalAEscenario(AsignarStaffDTO asignarStaffDTO) {
        return personalEscenarioService.asignarPersonalAEscenario(asignarStaffDTO);
    }
}