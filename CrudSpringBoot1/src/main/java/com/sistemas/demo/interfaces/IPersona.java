package com.sistemas.demo.interfaces;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sistemas.demo.modelo.Persona;

public interface IPersona extends JpaRepository<Persona, String> {
	
}
