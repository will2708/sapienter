package sapienter

import grails.plugins.countries.Country
import org.codehaus.groovy.grails.validation.BlankConstraint;


class Persona{
	
	String apellido
	String nombre
	String tipoDePersona
	String observaciones
    Country pais
	String dni
	Date fechaNacimiento
	String estadoCivil
	String padre
	String madre
	String conyuge
	String direccion
	String ciudad
	String codPostal
	String telefono
	String fax
	String email
	String sitioWeb
	String profesion
	String empresa
	String infoTrib1
	String infoTrib2
	String infoTrib3
	String aux1
	String aux2
	String aux3
	String aux4
	String aux5
	Notifica notifica
	
			
	static constraints = {
		apellido (blank:false, matches:"[A-ZÑÁÉÍÓÚa-zñáéíóú]+(([ '-][A-ZÑÁÉÍÓÚa-zñáéíóú]+)*)")
		nombre (blank:false, matches:"[A-ZÑÁÉÍÓÚa-zñáéíóú]+(([ '-][A-ZÑÁÉÍÓÚa-zñáéíóú]+)*)")
		tipoDePersona (inList:["Física" , "Jurídica"])
		observaciones (maxsize:1000, nullable:true)
		pais (nullable:false)
		dni(blank:false , maxLength:8 , minLength:8, matches:"[0-9]+((([0-9])+)*)", unique:true)
		fechaNacimiento(validator:{return(it < new Date())})
		estadoCivil (inList:["Soltero","Casado","Viudo","Divorciado"])
		padre (matches:"[A-ZÑÁÉÍÓÚa-zñáéíóú]+(([ '-][A-ZÑÁÉÍÓÚa-zñáéíóú]+)*)")
		madre (matches:"[A-ZÑÁÉÍÓÚa-zñáéíóú]+(([ '-][A-ZÑÁÉÍÓÚa-zñáéíóú]+)*)")
		conyuge (matches:"[A-ZÑÁÉÍÓÚa-zñáéíóú]+(([ '-][A-ZÑÁÉÍÓÚa-zñáéíóú]+)*)")
		email(blank:false, email:true)
		sitioWeb(url:true)
		notifica(nullable:false)
	}
   }

