package com.example.lab5_20210779.repository;
import com.example.lab5_20210779.entity.Profesionales;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface ProfesionalRepository extends JpaRepository<Profesionales, Integer> {

    @Query("SELECT p FROM Profesionales p " +
            "JOIN p.fechasDisponibilidad f " +
            "WHERE (:profesional IS NULL OR :profesional = '' OR LOWER(p.nombre) LIKE LOWER(CONCAT('%', :profesional, '%'))) " +
            "AND (:area IS NULL OR :area = '' OR p.area.nombreArea = :area) " +
            "AND (:fecha IS NULL OR :fecha = '' OR f.fechaDisponibilidad = :fecha) " +
            "AND (:sede IS NULL OR :sede = '' OR p.sede.nombreSede = :sede)")
    List<Profesionales> findByFilters(String profesional, String area, String fecha, String sede);
}

