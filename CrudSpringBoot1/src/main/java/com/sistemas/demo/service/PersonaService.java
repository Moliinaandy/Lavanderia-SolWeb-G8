package com.sistemas.demo.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;

import com.sistemas.demo.interfaces.IPersona;
import com.sistemas.demo.modelo.Persona;

@Service
public class PersonaService {
	@Autowired //acceder a los metodos get y set
	private IPersona data;
	
	public List<Persona>listar(){
		return (List<Persona>)data.findAll();
	}
	
	public Optional<Persona>listarId(String email){
		return data.findById(email);
	}
	
	public int save(Persona p) {
		int res=0;
		Persona persona = data.save(p);
		if(!persona.equals(null)) {
			res=1;
		}
		return 0;
	}
	
	public void delete(String email) {
		data.deleteById(email); 
	}
	
}
