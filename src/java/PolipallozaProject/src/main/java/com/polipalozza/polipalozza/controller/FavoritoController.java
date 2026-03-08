package com.polipalozza.polipalozza.controller;

import com.polipalozza.polipalozza.service.FavoritoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/favoritos")
@CrossOrigin(origins = {"http://localhost:3000", "http://127.0.0.1:5500", "http://localhost:5500"})
public class FavoritoController {
    
    @Autowired
    private FavoritoService favoritoService;
    
    @GetMapping("/cliente/{dniCliente}")
    public ResponseEntity<?> getArtistasFavoritos(@PathVariable Integer dniCliente) {
        try {
            System.out.println("📥 Solicitando artistas favoritos para cliente: " + dniCliente);
            
            List<Map<String, Object>> artistasFavoritos = favoritoService.getArtistasFavoritos(dniCliente);
            
            System.out.println("📤 Enviando " + artistasFavoritos.size() + " artistas favoritos");
            
            return ResponseEntity.ok(artistasFavoritos);
            
        } catch (Exception e) {
            System.err.println("❌ Error en getArtistasFavoritos: " + e.getMessage());
            e.printStackTrace();
            return ResponseEntity.internalServerError()
                .body(Map.of("error", "Error al obtener artistas favoritos: " + e.getMessage()));
        }
    }
}