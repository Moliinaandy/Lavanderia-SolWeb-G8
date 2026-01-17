package com.sistemas.demo.interfaces;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sistemas.demo.modelo.empleado;


public interface IEmpleado extends JpaRepository<empleado, String>{
	
}
