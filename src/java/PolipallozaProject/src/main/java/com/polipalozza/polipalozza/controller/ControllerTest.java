package com.polipalozza.polipalozza.controller;

import com.polipalozza.polipalozza.model.Cliente;
import com.polipalozza.polipalozza.model.Favorito;
import com.polipalozza.polipalozza.repository.ClienteRepository;
import com.polipalozza.polipalozza.repository.FavoritoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/debug")
public class ControllerTest {
    
    @Autowired
    private ClienteRepository clienteRepository;
    
    @Autowired
    private FavoritoRepository favoritoRepository;
    
    @GetMapping("/conexion")
    public String testConexion() {
        try {
            long countClientes = clienteRepository.count();
            long countFavoritos = favoritoRepository.count();
            
            return String.format("""
                ✅ Conexión exitosa! 
                - Clientes en BD: %d
                - Favoritos en BD: %d
                """, countClientes, countFavoritos);
        } catch (Exception e) {
            return "❌ Error de conexión: " + e.getMessage();
        }
    }
    
    @GetMapping("/cliente-1008")
    public String testCliente1008() {
        try {
            var clienteOpt = clienteRepository.findById(1008);
            if (clienteOpt.isPresent()) {
                Cliente cliente = clienteOpt.get();
                return "✅ Cliente 1008 encontrado: " + cliente.getDni();
            } else {
                return "❌ Cliente 1008 NO encontrado";
            }
        } catch (Exception e) {
            return "❌ Error: " + e.getMessage();
        }
    }
    
    @GetMapping("/favoritos-1008")
    public String testFavoritos1008() {
        try {
            var clienteOpt = clienteRepository.findById(1008);
            if (clienteOpt.isPresent()) {
                Cliente cliente = clienteOpt.get();
                List<Favorito> favoritos = favoritoRepository.findByCliente(cliente);
                
                return String.format("""
                    ✅ Favoritos del cliente 1008:
                    - Cantidad: %d
                    - Favoritos: %s
                    """, favoritos.size(), favoritos.toString());
            } else {
                return "❌ Cliente 1008 no encontrado";
            }
        } catch (Exception e) {
            return "❌ Error: " + e.getMessage();
        }
    }
}
