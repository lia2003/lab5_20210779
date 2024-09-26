package com.example.lab5_20210779.entity;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "profesionales")
public class Profesionales {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idProfesionales", nullable = false)
    private Integer idProfesionales;

    @Column(name = "nombre", nullable = false)
    private String nombre;

    @Column(name = "imagen", nullable = false)
    private String imagen;

    @Column(name = "descripcionProfesional", nullable = false)
    private String descripcionProfesional;


    //con este codigo llamo a la tabla completa
    @ManyToOne
    @JoinColumn(name = "idArea")
    private Area area;

    @ManyToOne
    @JoinColumn(name = "idSede")
    private Sede sede;

}
