package com.example.lab5_20210779.entity;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "sedes")
public class Sede {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idSedes", nullable = false)
    private Integer idSedes;

    @Column(name = "nombreSede", nullable = false)
    private String nombreSede;
}
