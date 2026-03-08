package com.polipalozza.polipalozza.service;

import com.polipalozza.polipalozza.model.*;
import com.polipalozza.polipalozza.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
public class FavoritoService {

    @Autowired private ClienteRepository clienteRepo;
    @Autowired private SetlistRepository setlistRepo;
    @Autowired private FavoritoRepository favoritoRepo;
    @Autowired private GrillaRepository grillaRepo;
    @Autowired private GrillaFavoritoRepository grillaFavoritoRepo;

    @Transactional
    

        public List<Map<String, Object>> getArtistasFavoritos(Integer dniCliente) {
         try {
        System.out.println("🔍 Buscando artista favoritos para cliente DNI: " + dniCliente);
        
        Optional<Cliente> clienteOpt = clienteRepo.findById(dniCliente);
        
        if (clienteOpt.isEmpty()) {
            System.out.println("❌ Cliente no encontrado: " + dniCliente);
            return new ArrayList<>();
        }
        
        Cliente cliente = clienteOpt.get();
        System.out.println("✅ Cliente encontrado: " + cliente.getDni());
        
        List<Favorito> favoritos = favoritoRepo.findByCliente(cliente);
        System.out.println("📊 Favoritos encontrados: " + favoritos.size());
        
        List<Map<String, Object>> artistasFavoritos = new ArrayList<>();
        
        for (Favorito favorito : favoritos) {
            Setlist setlist = favorito.getSetlist();
            if (setlist != null && setlist.getArtista() != null) {
                Artista artista = setlist.getArtista();
                
                Map<String, Object> artistaInfo = new HashMap<>();
                artistaInfo.put("id", artista.getDni());
                artistaInfo.put("nombre", artista.getNombreArtistico());
                artistaInfo.put("genero", artista.getGeneroMusical());
                artistaInfo.put("destacado", artista.getDestacado());
                artistaInfo.put("setlistId", setlist.getId());
                artistaInfo.put("dia", "Día " + setlist.getDia());
                artistaInfo.put("escenario", setlist.getEscenario() != null ? setlist.getEscenario().getNombre() : "Escenario Principal");
                artistaInfo.put("horario", setlist.getHoraInicio() + " a " + setlist.getHoraFin());
                artistaInfo.put("imagen", obtenerImagenArtista(artista.getNombreArtistico()));
                
                artistasFavoritos.add(artistaInfo);
                
                System.out.println("🎵 Artista procesado: " + artista.getNombreArtistico());
            }
        }
        
        System.out.println("✅ Total artistas favoritos procesados: " + artistasFavoritos.size());
        return artistasFavoritos;
        
    } catch (Exception e) {
        System.err.println("❌ Error en obtenerArtistasFavoritosCompletos: " + e.getMessage());
        e.printStackTrace();
        return new ArrayList<>();
    }
    }
    
    private String obtenerImagenArtista(String nombreArtistico) {
        // Mapeo de nombres de artistas a imágenes
        Map<String, String> imagenes = new HashMap<>();
        imagenes.put("Arctic Monkeys", "../Imagenes/Gri/artic esce.jpg");
        imagenes.put("Billie Eilish", "../Imagenes/Gri/billie esce.jpg");
        imagenes.put("Duki", "../Imagenes/Gri/duko esce.avif");
        imagenes.put("Milo J", "../Imagenes/Gri/milo esce.webp");
        // Agrega más artistas según tu base de datos
        
        return imagenes.getOrDefault(nombreArtistico, "../Imagenes/default-artist.jpg");
    }

    @Transactional
    public void guardarFavorito(Integer idCliente, Integer idSetlist) {
        Cliente cliente = clienteRepo.findById(idCliente)
                .orElseThrow(() -> new RuntimeException("Cliente no encontrado"));
        Setlist setlist = setlistRepo.findById(idSetlist)
                .orElseThrow(() -> new RuntimeException("Setlist no encontrado"));
        boolean alreadyFavorited = favoritoRepo.existsByClienteAndSetlist(cliente, setlist);
        if (alreadyFavorited) {
            throw new RuntimeException("Este setlist ya está en los favoritos del cliente");
        }
        Favorito favorito = new Favorito();
        favorito.setCliente(cliente);
        favorito.setSetlist(setlist);
        favoritoRepo.save(favorito);
    }

    @Transactional

public void removeFavorito(Integer idCliente, Integer idSetlist){
    try {
        System.out.println("❌ ELIMINANDO FAVORITO - Cliente: " + idCliente + ", Setlist: " + idSetlist);
        
        Cliente cliente = clienteRepo.findById(idCliente)
                .orElseThrow(() -> new RuntimeException("Cliente no encontrado"));
        Setlist setlist = setlistRepo.findById(idSetlist)
                .orElseThrow(() -> new RuntimeException("Setlist no encontrado"));
        
        Favorito favorito = favoritoRepo.findByClienteAndSetlist(cliente, setlist)
                .orElseThrow(() -> new RuntimeException("Este setlist no está en los favoritos del cliente"));
        
        System.out.println("✅ Favorito encontrado, ID: " + favorito.getId());
        
        // SOLUCIÓN SIMPLE: Eliminar directamente el favorito
        // (La base de datos debería tener ON DELETE CASCADE para grilla_favoritos)
        favoritoRepo.delete(favorito);
        System.out.println("✅ Favorito eliminado correctamente");
        
    } catch (Exception e) {
        System.err.println("💥 Error en removeFavorito: " + e.getMessage());
        throw new RuntimeException("Error al eliminar favorito: " + e.getMessage());
    }
}
}