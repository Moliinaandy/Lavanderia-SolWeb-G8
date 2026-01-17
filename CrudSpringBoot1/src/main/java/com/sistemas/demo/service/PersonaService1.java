package com.sistemas.demo.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sistemas.demo.interfaces.IEmpleado;
import com.sistemas.demo.modelo.empleado;

@Service
public class PersonaService1 {
	@Autowired//acceder a los metodos get y set
	private IEmpleado data;
	public List<empleado>listar(){
		return (List<empleado>)data.findAll();
	}
	
	public Optional<empleado>listarEmail(String email){
		return data.findById(email);
	}
	
	public int save(empleado p) {
	    int res = 0;
	    empleado empleado = data.save(p);
	    if (empleado != null) {
	        res = 1; // Operación exitosa
	    }
	    return res; // Retornar el resultado (0 si falla, 1 si tiene éxito)
	}

	
	public void delete(String email) {
	    Optional<empleado> empleadoOpt = data.findById(email);
	    if (empleadoOpt.isPresent()) {
	        data.deleteById(email);
	    } else {
	        throw new RuntimeException("Empleado no encontrado con el email: " + email);
	    }
	}
}
