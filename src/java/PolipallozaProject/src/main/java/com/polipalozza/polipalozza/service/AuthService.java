package com.polipalozza.polipalozza.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.polipalozza.polipalozza.dto.LoginDTO;
import com.polipalozza.polipalozza.model.Cliente;
import com.polipalozza.polipalozza.model.Personal;
import com.polipalozza.polipalozza.repository.ClienteRepository;
import com.polipalozza.polipalozza.repository.PersonalRepository;

import java.util.Map;

@Service
public class AuthService {

    @Autowired private ClienteRepository clienteRepo;
    @Autowired private PersonalRepository personalRepo;

    public Object login(LoginDTO loginDTO) {
        Cliente cliente = clienteRepo.findById(loginDTO.getDni()).orElse(null);
        if (cliente != null && cliente.getContrasenia().equals(loginDTO.getContrasenia())) {
            return Map.of("tipo", "cliente", "usuario", cliente);
        }

        Personal personal = personalRepo.findById(loginDTO.getDni()).orElse(null);
        if (personal != null && personal.getContrasenia().equals(loginDTO.getContrasenia())) {
            return Map.of("tipo", "personal", "usuario", personal);
        }

        throw new RuntimeException("Credenciales inválidas");
    }
}