package com.example.lab5_20210779.entity;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDate;


@Getter
@Setter
@Entity
@Table(name = "fechas")
public class Fechas {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idFechas", nullable = false)
    private Integer idFechas;

    @Column(name = "fechaDisponibilidad", nullable = false)
    private LocalDate fechaDisponibilidad;

    @ManyToOne
    @JoinColumn(name = "idProfesional", nullable = false)
    private Profesionales profesional;

}
