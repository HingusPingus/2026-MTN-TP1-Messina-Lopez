package com.polipalozza.polipalozza.controller;

import com.polipalozza.polipalozza.service.ClienteService;
import com.polipalozza.polipalozza.service.FavoritoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/clientes")
@CrossOrigin(origins = {"http://localhost:3000", "http://127.0.0.1:5500", "http://localhost:5500"})
public class ClienteController {
    
    @Autowired
    private ClienteService clienteService;
    
    @Autowired
    private FavoritoService favoritoService;
    
    @GetMapping("/{dni}")
    public ResponseEntity<?> getCliente(@PathVariable Integer dni) {
        try {
            Map<String, Object> cliente = clienteService.getClienteCompleto(dni);
            if (cliente != null) {
                return ResponseEntity.ok(cliente);
            } else {
                return ResponseEntity.notFound().build();
            }
        } catch (Exception e) {
            return ResponseEntity.internalServerError().body("Error: " + e.getMessage());
        }
    }
    
    @GetMapping("/{dni}/favoritos")
    public ResponseEntity<?> getArtistasFavoritos(@PathVariable Integer dni) {
        try {
            List<Map<String, Object>> favoritos = favoritoService.getArtistasFavoritos(dni);
            return ResponseEntity.ok(favoritos);
        } catch (Exception e) {
            return ResponseEntity.internalServerError().body("Error: " + e.getMessage());
        }
    }
    
    @GetMapping("/demo")
    public ResponseEntity<?> getClienteDemo() {
        try {
            // Usar el primer cliente de la base de datos (DNI 1008 según tu SQL)
            Map<String, Object> cliente = clienteService.getClienteCompleto(1008);
            if (cliente != null) {
                return ResponseEntity.ok(cliente);
            } else {
                return ResponseEntity.notFound().build();
            }
        } catch (Exception e) {
            return ResponseEntity.internalServerError().body("Error: " + e.getMessage());
        }
    }
}