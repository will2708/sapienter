package sapienter

import grails.plugins.countries.Country
import org.codehaus.groovy.grails.validation.BlankConstraint;


class Persona{
	static constraints = {
		apellido (blank:false, matches:"[A-ZÑÁÉÍÓÚa-zñáéíóú]+(([ '-][A-ZÑÁÉÍÓÚa-zñáéíóú]+)*)")
		nombre (blank:false, matches:"[A-ZÑÁÉÍÓÚa-zñáéíóú]+(([ '-][A-ZÑÁÉÍÓÚa-zñáéíóú]+)*)")
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

