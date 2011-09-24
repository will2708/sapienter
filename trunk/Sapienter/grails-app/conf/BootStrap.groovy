import java.util.Date;

import sapienter.Estudio
import sapienter.PersonaFisica
import sapienter.PersonaJuridica

class BootStrap {

    def init = { servletContext -> 
		1.times { i ->
			def est = new Estudio(razonSocial: "Sapienter", cuit: "20-30409317-0", domicilioFiscal: "Mozart y Zaraza")
			est.save()
			if (est.hasErrors()) {
				println est.errors
			}
			def perFis = new PersonaFisica(auxiliar:"",informacionTributaria:"",profesion: "",fax: "",telefono:"",codPostal: "",ciudad:"",domicilio:"",conyuge:"",madre: "", padre: "",estadoCivil: "Soltero", fechaNacimiento: new Date(),observaciones:"", nombre: "Matias", apellido: "Stani", dni: "31111111", pais: "Argentina", email: "a@a.com", estudio: (Estudio.getAll().get(0)))
			perFis.save()
			if (perFis.hasErrors()) {
				println perFis.errors
			}
			perFis = new PersonaFisica(auxiliar:"",informacionTributaria:"",profesion: "",fax: "",telefono:"",codPostal: "",ciudad:"",domicilio:"",conyuge:"",madre: "", padre: "",estadoCivil: "Soltero", fechaNacimiento: new Date(),observaciones:"", nombre: "Nicolas", apellido: "Souto", dni:"30000000", pais: "Argentina", email: "a@a.com", estudio: (Estudio.getAll().get(0)))
			perFis.save()
			if (perFis.hasErrors()) {
				println perFis.errors
			}
			perFis = new PersonaFisica(auxiliar:"",informacionTributaria:"",profesion: "",fax: "",telefono:"",codPostal: "",ciudad:"",domicilio:"",conyuge:"",madre: "", padre: "",estadoCivil: "Soltero", fechaNacimiento: new Date(),observaciones:"", nombre: "Romina", apellido: "Perrone", dni: "3000001", pais: "Argentina", email: "a@a.com", estudio: (Estudio.getAll().get(0)))
			perFis.save()
			if (perFis.hasErrors()) {
				println perFis.errors
			}
			def perJur = new PersonaJuridica(razonSocial:"Matute SA", cuit:"4343242", email:"matute@gmail.com",telefonoDeContacto:"5443", auxiliares:"", fax:"", observaciones:"", estudio: (Estudio.getAll().get(0)))
			perJur.save()
			if (perJur.hasErrors()) {
				println perJur.errors
			}
			perJur = new PersonaJuridica(razonSocial:"Nicolote SA", cuit:"4332247", email:"nicolote@gmail.com",telefonoDeContacto:"45", auxiliares:"", fax:"", observaciones:"", estudio: (Estudio.getAll().get(0)))
			perJur.save()
			if (perJur.hasErrors()) {
				println perJur.errors
			}
			perJur = new PersonaJuridica(razonSocial:"Romain SA", cuit:"4122247", email:"romain@gmail.com",telefonoDeContacto:"23", auxiliares:"", fax:"", observaciones:"", estudio: (Estudio.getAll().get(0)))
			perJur.save()
			if (perJur.hasErrors()) {
				println perJur.errors
			}
		}
    }
	def destroy = {
		 }
}
	

