package com.polipalozza.polipalozza.controller;

import com.polipalozza.polipalozza.dto.FavoritoDTO;
import com.polipalozza.polipalozza.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import com.polipalozza.polipalozza.dto.UsuarioDTO;

@RestController
@RequestMapping("/api/usuarios")

public class UsuarioController {

    @Autowired private UsuarioService usuarioService;
    @Autowired private FavoritoService favoritoService;
    @Autowired private GrillaService grillaService;

    @PostMapping
    public String registrarUsuario(@RequestBody UsuarioDTO dto){
        return usuarioService.registrarUsuario(dto);
    }

    @GetMapping("/{id}")
    public Object obtenerPerfil(@PathVariable Integer id){
        return usuarioService.obtenerPerfil(id);
    }

    @PostMapping("/{id}/favoritos")
    public ResponseEntity<String> guardarFavorito(
            @PathVariable("id") Integer idCliente,
            @RequestBody FavoritoDTO request) {
        try {
            favoritoService.guardarFavorito(idCliente, request.getIdSetlist());
            return ResponseEntity.ok("Show agregado a favoritos correctamente");
        } catch (RuntimeException e) {
            return ResponseEntity.status(400).body(e.getMessage());
        }
    }


    


@PostMapping("/{id}/rmfavoritos")
    public ResponseEntity<String> removerFavorito(
        @PathVariable("id") Integer idCliente,
        @RequestBody FavoritoDTO request) {
    try {
        System.out.println("❌ ELIMINANDO FAVORITO - Cliente: " + idCliente + ", Setlist: " + request.getIdSetlist());
        favoritoService.removeFavorito(idCliente, request.getIdSetlist());
        return ResponseEntity.ok("Show removido de favoritos correctamente");
    } catch (RuntimeException e) {
        System.err.println("❌ Error eliminando favorito: " + e.getMessage());
        return ResponseEntity.status(400).body(e.getMessage());
    }
}

    @PostMapping("/{id}/mi-grilla")
    public ResponseEntity<String> armarYGuardarGrilla(@PathVariable Integer id) {
        try {
            return grillaService.armarYGuardarGrillaPersonalizada(id);
        } catch (RuntimeException e) {
            return ResponseEntity.badRequest().body("Error al armar la grilla: " + e.getMessage());
        }
    }
    
}