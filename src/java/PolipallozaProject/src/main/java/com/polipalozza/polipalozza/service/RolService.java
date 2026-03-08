package com.polipalozza.polipalozza.service;

import jakarta.annotation.PostConstruct;
import org.springframework.stereotype.Service;
import com.polipalozza.polipalozza.model.*;
import java.util.*;
import java.util.concurrent.atomic.AtomicInteger;

@Service
public class RolService {

    private Map<String, Rol> rolesPorNombre = new HashMap<>();
    private AtomicInteger rolIdCounter = new AtomicInteger(1);

    @PostConstruct
    public void inicializarRoles() {
        // Roles predefinidos
        String[] rolesPredefinidos = {
                "Administrador",
                "Coordinador",
                "Voluntario",
                "Seguridad",
                "Logística",
                "Atención al público",
                "Técnico"
        };

        for (String nombreRol : rolesPredefinidos) {
            Rol rol = new Rol();
            rol.setId(rolIdCounter.getAndIncrement());
            rol.setNombre(nombreRol);
            rolesPorNombre.put(nombreRol.toLowerCase(), rol);
        }
    }

    public Rol obtenerOCrearRol(String nombreRol) {
        return rolesPorNombre.computeIfAbsent(nombreRol.toLowerCase(), nombre -> {
            Rol nuevoRol = new Rol();
            nuevoRol.setId(rolIdCounter.getAndIncrement());
            nuevoRol.setNombre(nombreRol);
            return nuevoRol;
        });
    }

    public Rol buscarRolPorNombre(String nombreRol) {
        return rolesPorNombre.get(nombreRol.toLowerCase());
    }

    public List<Rol> obtenerTodosLosRoles() {
        return new ArrayList<>(rolesPorNombre.values());
    }

    public boolean existeRol(String nombreRol) {
        return rolesPorNombre.containsKey(nombreRol.toLowerCase());
    }
}
