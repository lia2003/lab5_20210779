package com.example.lab5_20210779.repository;
import com.example.lab5_20210779.entity.Fechas;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FechaRepository extends JpaRepository<Fechas, Integer> {

}
