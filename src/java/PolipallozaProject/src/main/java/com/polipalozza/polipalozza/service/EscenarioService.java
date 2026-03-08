package com.polipalozza.polipalozza.service;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import com.polipalozza.polipalozza.model.*;
import com.polipalozza.polipalozza.repository.*;
import java.util.List;

@Service
public class EscenarioService {
    @Autowired private EscenarioRepository escenarioRepo;
    @Autowired private SetlistRepository setlistRepo;

    public List<Setlist> obtenerGrilla(Integer idEscenario){ return setlistRepo.findByEscenarioId(idEscenario); }
}
