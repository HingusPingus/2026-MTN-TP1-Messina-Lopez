package com.polipalozza.polipalozza.service;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import com.polipalozza.polipalozza.dto.*;
import com.polipalozza.polipalozza.model.*;
import com.polipalozza.polipalozza.repository.*;
import java.time.LocalDateTime;

@Service
public class MerchService {
    @Autowired private MerchRepository merchRepo;
    @Autowired private CompraRepository compraRepo;
    @Autowired private CompraMerchRepository compraMerchRepo;
    @Autowired private ClienteRepository clienteRepo;
    @Autowired private TarjetaRepository tarjetaRepo;

    @Transactional
    public String reservarMerch(MerchReservaDTO dto) {
        // Verifica que el merch esté disponible
        Merch merch = merchRepo.findById(dto.getIdMerch()).orElseThrow(() -> new IllegalArgumentException("Merch no encontrado"));
        if (merch.getStock() < dto.getCantidad()) {
            throw new IllegalArgumentException("Stock insuficiente");
        }

        // Validación de tarjeta
        try {
            dto.getTarjeta().validar();
        } catch (Exception e) {
            throw new RuntimeException("Error al validar la tarjeta", e);
        }

        // Verifica que el cliente exista
        Cliente c = clienteRepo.findById(dto.getIdCliente()).orElseThrow(() -> new IllegalArgumentException("Cliente no encontrado"));

        // Verifica si la tarjeta ya existe en la base de datos
        Tarjeta tarjeta = tarjetaRepo.findByNumero(dto.getTarjeta().getNumero());

        // Si la tarjeta no existe, la guardamos
        if (tarjeta == null) {
            tarjeta = tarjetaRepo.save(dto.getTarjeta());
        }

        // Crear y guardar la compra
        Compra compra = new Compra();
        compra.setFecha(LocalDateTime.now());
        compra.setCantCuotas(dto.getCantCuotas());
        compra.setCliente(c);
        compra.setTarjeta(tarjeta);
        compra = compraRepo.save(compra);  // Guardamos la compra en la base de datos

        // Actualiza el stock del merch
        merch.setStock(merch.getStock() - dto.getCantidad());
        merchRepo.save(merch);  // Guardamos el merch actualizado

        // Crear la compra-merch (relación entre Compra y Merch)
        CompraMerch cm = new CompraMerch();
        cm.setIdCompra(compra.getId());  // Usamos el ID de la compra
        cm.setIdMerch(merch.getId());   // Usamos el ID del merch
        cm.setCantidad(dto.getCantidad());
        cm.setDiaRetiro(dto.getDiaRetiro());
        compraMerchRepo.save(cm);  // Guardamos la relación en la base de datos

        return "Reserva exitosa";
    }
}