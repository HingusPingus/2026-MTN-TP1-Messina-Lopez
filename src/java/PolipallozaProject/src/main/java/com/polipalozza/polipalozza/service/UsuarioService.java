package com.polipalozza.polipalozza.service;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import com.polipalozza.polipalozza.model.*;
import com.polipalozza.polipalozza.repository.*;
import com.polipalozza.polipalozza.dto.*;

import java.util.HashMap;

@Service
public class UsuarioService {

    @Autowired private PersonaRepository personaRepo;
    @Autowired private ClienteRepository clienteRepo;
    @Autowired private ArtistaRepository artistaRepo;
    @Autowired private FavoritoRepository favoritoRepo;
    @Autowired private SetlistRepository setlistRepo;
    @Autowired private RolRepository rolRepository;
    @Autowired private PersonalRepository personalRepo;

    private HashMap<Integer, String> registrados;

    @Transactional
    public String registrarUsuario(UsuarioDTO dto) {
        if (clienteRepo.existsById(dto.getDni())) {
            return "Error: El DNI ya está registrado como Cliente.";
        }

        if (artistaRepo.existsById(dto.getDni())) {
            return "Error: El DNI ya está registrado como Artista.";
        }

        if (personalRepo.existsById(dto.getDni())) {
            return "Error: El DNI ya está registrado como Personal.";
        }
        Persona persona = new Persona(dto.getDni(), dto.getNombre(), dto.getApellido(), null, null, dto.getMail());
        personaRepo.save(persona);
        if (dto.getRolNombre() != null) {
            Rol rol = rolRepository.findByNombre(dto.getRolNombre());
            if (rol == null) {
                rol = new Rol();
                rol.setNombre(dto.getRolNombre());
                rolRepository.save(rol);
            }
            Personal personal = new Personal(dto.getDni(), dto.getEsVoluntario(), dto.getContrasenia(), rol);
            personalRepo.save(personal);
        } else if (dto.getGeneroMusical() != null) {
            Artista artista = new Artista(dto.getDni(), dto.getGeneroMusical(), false, dto.getNombreArtistico());
            artistaRepo.save(artista);

        } else {
            Cliente cliente = new Cliente(dto.getDni(), dto.getContrasenia());
            clienteRepo.save(cliente);
        }
        return "Registrado correctamente";
    }

    public PersonaDTO obtenerPerfil(Integer dni) {
        Persona persona = personaRepo.findById(dni).orElse(null);
        if (persona == null) {
            return null;
        }
        Artista artista = artistaRepo.existsById(dni) ? artistaRepo.findById(dni).get() : null;
        if (artista != null) {
            ArtistaDTO dto = new ArtistaDTO(persona.getDni(), persona.getNombre(), persona.getApellido(), persona.getMail(), artista.getGeneroMusical(), artista.getNombreArtistico());
            return dto;
        }
        Personal personal = personalRepo.existsById(dni) ? personalRepo.findById(dni).get() : null;
        if (personal != null) {
            PersonalDTO dto = new PersonalDTO(persona.getDni(), persona.getNombre(), persona.getApellido(), persona.getMail(), personal.getVoluntario(), personal.getRol().getNombre());
            return dto;
        }
        ClienteDTO dto = new ClienteDTO(persona.getDni(), persona.getNombre(), persona.getApellido(), persona.getMail());
        return dto;
    }
}