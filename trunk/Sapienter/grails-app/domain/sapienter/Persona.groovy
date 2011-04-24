package sapienter

import grails.plugins.countries.Country
import org.codehaus.groovy.grails.validation.BlankConstraint;


class Persona{
	static constraints = {
		apellido (blank:false, matches:"[a-zA-z]+(([ '-][a-zA-Z]+)*)" )
		nombre (blank:false, matches:"[a-zA-z]+(([ '-][a-zA-Z]+)*)" )
		tipoDePersona (inList:["Física" , "Jurídica"])
		observaciones (maxsize:1000, nullable:true)
		pais (nullable:false)
	}
			String apellido
			String nombre
			String tipoDePersona
			String observaciones
		 	Country pais
    }

