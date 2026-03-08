package com.polipalozza.polipalozza.service;

import com.polipalozza.polipalozza.model.*;
import com.polipalozza.polipalozza.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;
import java.util.Optional;

@Service
public class GrillaService {

    @Autowired private ClienteRepository clienteRepo;
    @Autowired private FavoritoRepository favoritoRepo;
    @Autowired private GrillaRepository grillaRepo;
    @Autowired private GrillaFavoritoRepository grillaFavoritoRepo;

    @Transactional
    public ResponseEntity<String> armarYGuardarGrillaPersonalizada(Integer idCliente) {
        Cliente cliente = clienteRepo.findById(idCliente)
                .orElseThrow(() -> new RuntimeException("Cliente no encontrado"));
        List<Favorito> favoritos = favoritoRepo.findByCliente(cliente);
        if (favoritos.isEmpty()) {
            throw new RuntimeException("No hay artistas favoritos para armar la grilla");
        }
        Optional<Grilla> optGrilla = grillaRepo.findByCliente(cliente);
        Grilla grilla;
        if (optGrilla.isEmpty()) {
            grilla = new Grilla();
            grilla.setCliente(cliente);
            grilla = grillaRepo.save(grilla);
            for (Favorito favorito : favoritos) {
                boolean existeEnGrilla = grillaFavoritoRepo.existsByGrillaAndFavorito(grilla, favorito);
                if (!existeEnGrilla) {
                    GrillaFavorito grillaFavorito = new GrillaFavorito(grilla, favorito);
                    grillaFavoritoRepo.save(grillaFavorito);
                }
            }
            return ResponseEntity.ok("Grilla personalizada armada y guardada correctamente");
        } else {
            grilla = optGrilla.get();
            for (Favorito favorito : favoritos) {
                boolean existeEnGrilla = grillaFavoritoRepo.existsByGrillaAndFavorito(grilla, favorito);
                if (!existeEnGrilla) {
                    GrillaFavorito grillaFavorito = new GrillaFavorito(grilla, favorito);
                    grillaFavoritoRepo.save(grillaFavorito);
                }
            }
            return ResponseEntity.ok("Grilla personalizada actualizada");
        }
    }
}