package com.sistemas.demo.controler;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sistemas.demo.modelo.Persona;
import com.sistemas.demo.service.PersonaService;

@Controller
@RequestMapping
public class Controlador {
	@Autowired
	private PersonaService service;
	// vamos a mapear la lista para cuando vamos a la url
	//se puede listar
	
	@GetMapping("/listar")
	public String listar(Model model) {
		List<Persona> personas = service.listar();
		//vamos a enviar la lista al formulario
		model.addAttribute("personas",personas);
		//visualizar la lista en la pagina index
		return "index";
	}
	
	@GetMapping("/new")
	public String agregar(Model model) {
		model.addAttribute("persona", new Persona());
		return "form";
	}
	
	@PostMapping("/save")
	public String save(@Validated Persona p, Model model) {
		service.save(p);
		return "redirect:/listar";
	}
	
	@GetMapping("/editar/{email}")
	public String editar(@PathVariable String email, Model model) {
		java.util.Optional<Persona>persona = service.listarId(email);
		model.addAttribute("persona", persona);
		return "form";
	}
	
	@GetMapping("/eliminar/{email}")
	public String eliminar(Model model, @PathVariable String email) {
		service.delete(email);
		return "redirect:/listar";
	}
	
}
