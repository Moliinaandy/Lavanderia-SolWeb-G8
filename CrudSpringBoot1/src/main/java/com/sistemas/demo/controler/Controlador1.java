package com.sistemas.demo.controler;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sistemas.demo.modelo.empleado;
import com.sistemas.demo.service.PersonaService1;

@Controller
@RequestMapping
//administra, gestiona, etc.

public class Controlador1 {
	@Autowired
	private PersonaService1 service;
	//vamos a mapear la lista para cuando vamos a la URL
	//se puede listar
	@GetMapping("/listar1")
	public String listar(Model model) {
		List<empleado>empleados=service.listar();
		//vamos a enviar la lista al formulario
		model.addAttribute("empleados",empleados);
		//visualizar la lista de personas en la pagina index
		return "index1";
	}
	@GetMapping("/new1")
	public String agregar(Model model) {
		model.addAttribute("empleado",new empleado());
		return "form1";
	}
	
	@PostMapping("/save1")
	public String save(@Validated empleado p, Model model) {
		service.save(p);
		return "redirect:/listar1";
	}
	
	@GetMapping("/editar1/{email}")
	public String editar(@PathVariable String email, Model model) {
		java.util.Optional<empleado>empleado = service.listarEmail(email);
		model.addAttribute("empleado", empleado);
		return "form1";
	}
	
	@GetMapping("/eliminar1/{email}")
	public String eliminar(Model model, @PathVariable String email) {
		service.delete(email);
		return "redirect:/listar1";
	}
}
