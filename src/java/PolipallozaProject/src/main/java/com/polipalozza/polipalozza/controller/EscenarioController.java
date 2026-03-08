package com.polipalozza.polipalozza.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.polipalozza.polipalozza.service.EscenarioService;
import com.polipalozza.polipalozza.model.Setlist;
import java.util.List;

@RestController
@RequestMapping("/api/escenarios")

public class EscenarioController {

    @Autowired private EscenarioService escenarioService;

    @GetMapping("/{id}/artistas")
    public List<Setlist> obtenerArtistasPorEscenario(@PathVariable Integer id){
        return escenarioService.obtenerGrilla(id);
    }

    @GetMapping("/hola")
    public String hgola(){
        return "hoal";
    }
}
