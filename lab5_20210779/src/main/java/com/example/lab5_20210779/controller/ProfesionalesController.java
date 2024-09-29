package com.example.lab5_20210779.controller;
import com.example.lab5_20210779.entity.Profesionales;
import com.example.lab5_20210779.repository.ProfesionalRepository;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.ui.Model;
import java.util.List;


@Controller
@RequestMapping("/profesional") //es decir todas las rutas empiezan con employee, ES GENERAL
public class ProfesionalesController {
    //siempre que se crea un repositorio, en su controlador debe haber:
    //un atributo final:
    final ProfesionalRepository profesionalRepository;
    //y su contructor
    public ProfesionalesController(ProfesionalRepository profesionalRepository) {
        this.profesionalRepository = profesionalRepository;
    }

    @GetMapping("/listar") //obtiene la lista y la manda a la vista
    public String getEmployees(Model model) {

        List<Profesionales> lista_profesionales = profesionalRepository.findAll();

        // Pasa la lista de empleados al modelo para que esté disponible en la vista
        model.addAttribute("lista_profesionales", lista_profesionales);

        // Retorna el nombre del archivo HTML que se encargará de mostrar la lista
        return "/profesionales";
    }


}
