package com.polipalozza.polipalozza.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.polipalozza.polipalozza.model.PersonalEscenario;
import java.util.List;

public interface PersonalEscenarioRepository extends JpaRepository<PersonalEscenario, Integer> {
    List<PersonalEscenario> findByEscenarioIdAndDia(Integer idEscenario, Integer dia);
    List<PersonalEscenario> findByPersonalDniAndDia(Integer dniPersonal, Integer dia);
}
