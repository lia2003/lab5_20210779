package com.example.lab5_20210779.entity;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "areas")
public class Area {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idAreas", nullable = false)
    private Integer idAreas;

    @Column(name = "nombreArea", nullable = false)
    private String nombreArea;
}
