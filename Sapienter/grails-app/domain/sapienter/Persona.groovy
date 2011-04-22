package sapienter

import org.codehaus.groovy.grails.validation.BlankConstraint;


class Persona{
	static constraints = {
		apellido (blank:false, matches:"[a-zA-z]+(([ '-][a-zA-Z]+)*)" )
		nombre (blank:false, matches:"[a-zA-z]+(([ '-][a-zA-Z]+)*)" )
		tipoDePersona (inList:["Física" , "Jurídica"])
		relacionPersona (inList:["Relacion", "Cliente", "Oponente"]) 
		/* TODO Ver como implementar la relación entre las personas y los procesos*/
		observaciones (maxsize:1000, nullable:true)
	}
			String apellido
			String nombre
			String tipoDePersona
			String relacionPersona
			String observaciones
		 	String country
    }


