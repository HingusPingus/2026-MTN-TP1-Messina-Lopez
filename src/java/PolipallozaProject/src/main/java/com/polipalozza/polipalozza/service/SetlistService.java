package com.polipalozza.polipalozza.service;

import com.polipalozza.polipalozza.dto.SetlistDTO;
import com.polipalozza.polipalozza.model.*;
import com.polipalozza.polipalozza.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SetlistService {

    @Autowired private SetlistRepository setlistRepo;
    @Autowired private ArtistaRepository artistaRepo;
    @Autowired private EscenarioRepository escenarioRepo;
    @Autowired private DiaRepository diaRepo;
    @Autowired private PersonaRepository personaRepo;

    public String cargarSetlist(SetlistDTO setlistDTO) {
        Artista artista = artistaRepo.findById(setlistDTO.getIdArtista()).orElse(null);
        Persona persona = personaRepo.findById(setlistDTO.getIdArtista()).orElse(null);
        if (artista == null) {
            return "El artista no existe.";
        }
        Escenario escenario = escenarioRepo.findById(setlistDTO.getIdEscenario()).orElse(null);
        if (escenario == null) {
            return "El escenario no existe.";
        }
        Setlist nuevoSetlist = new Setlist();
        nuevoSetlist.setArtista(artista);
        nuevoSetlist.setEscenario(escenario);
        nuevoSetlist.setDia(setlistDTO.getDia());
        nuevoSetlist.setHoraInicio(setlistDTO.getHoraInicio());
        nuevoSetlist.setHoraFin(setlistDTO.getHoraFin());
        try{
            setlistRepo.save(nuevoSetlist);
        } catch (Exception e) {
            return "Ya se encuentra una setlist en ese horario y dia";
        }

        return "Setlist cargado correctamente para el artista " + persona.getNombre() + " en el escenario " + escenario.getNombre() + " (Día " + setlistDTO.getDia() + ").";
    }

    public List<Setlist> encontrarSetlists(){
        return setlistRepo.findAll();
    }

}
