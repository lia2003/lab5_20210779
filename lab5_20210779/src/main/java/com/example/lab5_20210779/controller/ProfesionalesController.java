package com.example.lab5_20210779.controller;
import com.example.lab5_20210779.entity.Profesionales;
import org.springframework.stereotype.Controller;
import com.example.lab5_20210779.entity.*; //todas las entidades
import com.example.lab5_20210779.repository.*; //todos los repositorios
import org.springframework.web.bind.annotation.*; //postmapping, getmapping
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import java.util.List;
import java.util.Optional;


@Controller
@RequestMapping("/profesional") //es decir todas las rutas empiezan con employee, ES GENERAL
public class ProfesionalesController {
    final ProfesionalRepository profesionalRepository;
    final AreaRepository areaRepository;
    final SedeRepository sedeRepository;
    final FechaRepository fechaRepository;

    public ProfesionalesController(ProfesionalRepository profesionalRepository, AreaRepository areaRepository, SedeRepository sedeRepository, FechaRepository fechaRepository) {
        this.profesionalRepository = profesionalRepository;
        this.areaRepository = areaRepository;
        this.sedeRepository= sedeRepository;
        this.fechaRepository= fechaRepository;
    }


    @GetMapping("/listar")
    public String getEmployees(@RequestParam(required = false) String profesional,
                               @RequestParam(required = false) String area,
                               @RequestParam(required = false) String sede,
                               @RequestParam(required = false) String fecha,
                               Model model) {

        List<Area> lista_areas = areaRepository.findAll();
        List<Sede> lista_sedes = sedeRepository.findAll();
        List<Fechas> lista_fechas = fechaRepository.findAll();
        List<Profesionales> lista_profesionales;

        // Si al menos un filtro está presente
        if (profesional != null || area != null || sede != null || fecha != null) {
            lista_profesionales = profesionalRepository.findByFilters(profesional, area, fecha, sede);
        } else {
            lista_profesionales = profesionalRepository.findAll();
        }

        model.addAttribute("lista_profesionales", lista_profesionales);
        model.addAttribute("lista_areas", lista_areas);
        model.addAttribute("lista_sedes", lista_sedes);
        model.addAttribute("lista_fechas", lista_fechas);

        return "/profesionales";
    }




}
