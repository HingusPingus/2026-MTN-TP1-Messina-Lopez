package com.polipalozza.polipalozza.controller;

import com.polipalozza.polipalozza.model.Setlist;
import com.polipalozza.polipalozza.repository.SetlistRepository;
import com.polipalozza.polipalozza.service.SetlistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/setlists")
@CrossOrigin(origins = {"http://localhost:3000", "http://127.0.0.1:5500", "http://localhost:5500"})
public class SetlistController {
    
    @Autowired
    private SetlistService setlistService;
    
    @GetMapping
    public ResponseEntity<List<Setlist>> getAllSetlists() {
        try {
            List<Setlist> setlists= setlistService.encontrarSetlists();
            System.out.println("🎵 Setlists encontrados: " + setlists.size());
            return ResponseEntity.ok(setlists);
        } catch (Exception e) {
            System.err.println("❌ Error obteniendo setlists: " + e.getMessage());
            return ResponseEntity.internalServerError().build();
        }
    }
}