package com.example.lab5_20210779.repository;
import com.example.lab5_20210779.entity.Profesionales;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProfesionalRepository extends JpaRepository<Profesionales, Integer>{
}
