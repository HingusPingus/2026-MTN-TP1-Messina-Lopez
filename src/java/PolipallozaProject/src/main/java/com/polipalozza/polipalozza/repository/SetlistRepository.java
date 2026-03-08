package com.polipalozza.polipalozza.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.polipalozza.polipalozza.model.Setlist;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.time.LocalTime;

@Repository
public interface SetlistRepository extends JpaRepository<Setlist, Integer> {
    @Query("SELECT s FROM Setlist s WHERE s.escenario.id = :idEscenario")
    List<Setlist> findByEscenarioId(Integer idEscenario);
    List<Setlist> findByEscenarioIdAndHoraInicioLessThanEqualAndHoraFinGreaterThanEqual(Integer idEscenario, LocalTime horaFin, LocalTime horaInicio);
    List<Setlist> findByEscenarioIdAndDia(Integer idEscenario, Integer dia);
}
