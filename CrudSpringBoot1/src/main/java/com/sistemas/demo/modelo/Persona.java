package com.sistemas.demo.modelo;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
//inyeccion de anotacion entre tabla y la clase
@Table(name="usuario")
public class Persona {
	// creando anotaciones
	@Id
	private String email;
	private String nombre;
	private String Apepat;
	private String Apemat;
	private String dni;
	private int sexo;
	
	//constructor vacio
	public Persona() {}
	//contructor explicito
	public Persona(String email,String nombre,String Apepat, String Apemat, String dni, int sexo) {
		super();
		this.email = email;
		this.nombre = nombre;
		this.Apepat = Apepat;
		this.Apemat = Apemat;
		this.dni = dni;
		this.sexo = sexo;
		
	}
	
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getApepat() {
		return Apepat;
	}
	public void setApepat(String apepat) {
		Apepat = apepat;
	}
	public String getApemat() {
		return Apemat;
	}
	public void setApemat(String apemat) {
		Apemat = apemat;
	}
	public String getDni() {
		return dni;
	}
	public void setDni(String dni) {
		this.dni = dni;
	}
	public int getSexo() {
		return sexo;
	}
	public void setSexo(int sexo) {
		this.sexo = sexo;
	}
	
	
}
