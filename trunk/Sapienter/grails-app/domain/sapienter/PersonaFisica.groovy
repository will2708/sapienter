package sapienter

import java.util.Date

class PersonaFisica extends Persona{
	String apellido
	String nombre
	String observaciones
    String pais
	String dni
	Date fechaNacimiento
	String estadoCivil
	String padre
	String madre
	String conyuge
	String domicilio
	String ciudad
	String codPostal
	String telefono
	String fax
	String email
	String profesion
	String informacionTributaria
	String auxiliar
	
			
	static constraints = {
		apellido (blank:false, matches:"[A-ZÑÁÉÍÓÚa-zñáéíóú]+(([ '-][A-ZÑÁÉÍÓÚa-zñáéíóú]+)*)")
		nombre (blank:false, matches:"[A-ZÑÁÉÍÓÚa-zñáéíóú]+(([ '-][A-ZÑÁÉÍÓÚa-zñáéíóú]+)*)")
		observaciones (maxsize:1000, nullable:true)
		pais (nullable:false)
		dni(blank:false , maxLength:8 , minLength:8, matches:"[0-9]+((([0-9])+)*)", unique:true)
		fechaNacimiento(validator:{return(it < new Date())})
		estadoCivil (inList:["Soltero","Casado","Viudo","Divorciado"])
		padre (matches:"[A-ZÑÁÉÍÓÚa-zñáéíóú]+(([ '-][A-ZÑÁÉÍÓÚa-zñáéíóú]+)*)")
		madre (matches:"[A-ZÑÁÉÍÓÚa-zñáéíóú]+(([ '-][A-ZÑÁÉÍÓÚa-zñáéíóú]+)*)")
		conyuge (matches:"[A-ZÑÁÉÍÓÚa-zñáéíóú]+(([ '-][A-ZÑÁÉÍÓÚa-zñáéíóú]+)*)")
		email(blank:false, email:true)

	}
   }

