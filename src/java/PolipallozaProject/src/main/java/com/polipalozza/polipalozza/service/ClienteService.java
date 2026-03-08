package com.polipalozza.polipalozza.service;

import com.polipalozza.polipalozza.model.Cliente;
import com.polipalozza.polipalozza.model.Persona;
import com.polipalozza.polipalozza.repository.ClienteRepository;
import com.polipalozza.polipalozza.repository.PersonaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

@Service
public class ClienteService {
    
    @Autowired
    private ClienteRepository clienteRepository;
    
    @Autowired
    private PersonaRepository personaRepository;
    
    public Map<String, Object> getClienteCompleto(Integer dni) {
        Optional<Cliente> clienteOpt = clienteRepository.findById(dni);
        if (clienteOpt.isPresent()) {
            Cliente cliente = clienteOpt.get();
            Optional<Persona> personaOpt = personaRepository.findById(dni);
            
            Persona persona = personaOpt.orElse(new Persona());
            
            Map<String, Object> response = new HashMap<>();
            response.put("tipo", "cliente");
            response.put("usuario", Map.of(
                "dni", persona.getDni() != null ? persona.getDni() : dni,
                "nombre", persona.getNombre() != null ? persona.getNombre() : "Nombre no disponible",
                "apellido", persona.getApellido() != null ? persona.getApellido() : "Apellido no disponible",
                "mail", persona.getMail() != null ? persona.getMail() : "Email no disponible",
                "direccion", persona.getDireccion() != null ? persona.getDireccion() : "Dirección no disponible",
                "telefono", persona.getTelefono() != null ? persona.getTelefono() : "Teléfono no disponible"
            ));
            
            return response;
        }
        return null;
    }
}