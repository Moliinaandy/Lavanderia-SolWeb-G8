package com.sistemas.demo.modelo;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
//inyeccion de anotacion entre tabla y clase
@Table(name="empleado")
public class empleado {
	//creando anotaciones
	@Id
	private String email;
	private String nombre;
	private String apepat;
	private String apemat;
	private String dni;
	private int sexo;
	//constructor vacio
	public empleado() {}
	//constructor explicito
	public empleado(String email, String nombre, String apepat, String apemat, String dni, int sexo) {
		super();
		this.email = email;
		this.nombre = nombre;
		this.apepat = apepat;
		this.apemat = apemat;
		this.dni = dni;
		this.sexo = sexo;
	}
	//metodos get y set
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
		return apepat;
	}
	public void setApepat(String apepat) {
		this.apepat = apepat;
	}
	public String getApemat() {
		return apemat;
	}
	public void setApemat(String apemat) {
		this.apemat = apemat;
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