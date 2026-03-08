package com.polipalozza.polipalozza.service;

import com.polipalozza.polipalozza.dto.AsignarStaffDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.polipalozza.polipalozza.model.*;
import com.polipalozza.polipalozza.repository.*;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Service
public class PersonalEscenarioService {

    @Autowired private PersonalEscenarioRepository personalEscenarioRepo;
    @Autowired private PersonalRepository personalRepo;
    @Autowired private EscenarioRepository escenarioRepo;
    @Autowired private RolRepository rolRepo;

    public String asignarPersonalAEscenario(AsignarStaffDTO asignarStaffDTO) {
        Set<Integer> roles = new HashSet<>();
        List<Personal> personalList = new ArrayList<>();
        for (Integer idPersonal : asignarStaffDTO.getIdPersonales()) {
            Personal personal = personalRepo.findById(idPersonal).orElse(null);
            if (personal == null) {
                return "El personal con DNI " + idPersonal + " no existe.";
            }
            Integer rolId = personal.getRol().getId();
            if (!roles.add(rolId)) {
                return "Ya existe un miembro del staff con ese rol en el escenario para este día.";
            }
            personalList.add(personal);
        }
        if (roles.size() < 5) {
            return "Se requieren al menos 5 roles distintos para asignar al personal al escenario.";
        }
        Escenario escenario = escenarioRepo.findById(asignarStaffDTO.getIdEscenario()).orElse(null);
        if (escenario == null) {
            return "El escenario no existe.";
        }
        List<PersonalEscenario> nuevas = personalList.stream().map(personal -> {
            PersonalEscenario pe = new PersonalEscenario();
            pe.setPersonal(personal);
            pe.setEscenario(escenario);
            pe.setDia(asignarStaffDTO.getDia());
            pe.setHoraInicio(asignarStaffDTO.getHoraInicio());
            pe.setHoraFin(asignarStaffDTO.getHoraFin());
            return pe;
        }).collect(Collectors.toList());
        try{
            personalEscenarioRepo.saveAll(nuevas);
            personalEscenarioRepo.flush();
        } catch (Exception e) {
            return "Personal ya asignado en ese horario";
        }
        return "Personal asignado correctamente al escenario.";
    }
}