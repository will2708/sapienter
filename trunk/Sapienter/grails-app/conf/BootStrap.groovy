import sapienter.Estudio
import sapienter.PersonaFisica
import sapienter.PersonaJuridica

class BootStrap {

    def init = { servletContext -> 
		1.times { i ->
			 new Estudio(razonSocial: "Sapienter", cuit: "20-30409317-0", domicilioFiscal: "Mozart y Zaraza").save()
			 new PersonaFisica(auxiliar:"",informacionTributaria:"",profesion: "",fax: "",telefono:"",codPostal: "",ciudad:"",domicilio:"",conyuge:"",madre: "", padre: "",estadoCivil: "Soltero", fechaNacimiento: new Date(),observaciones:"", nombre: "Matias", apellido: "Stani", dni: "31111111", pais: "Argentina", email: "a@a.com", estudio: (Estudio.getAll().get(0))).save()
			 new PersonaFisica(auxiliar:"",informacionTributaria:"",profesion: "",fax: "",telefono:"",codPostal: "",ciudad:"",domicilio:"",conyuge:"",madre: "", padre: "",estadoCivil: "Soltero", fechaNacimiento: new Date(),observaciones:"", nombre: "Nicolas", apellido: "Souto", dni:"30000000", pais: "Argentina", email: "a@a.com", estudio: (Estudio.getAll().get(0))).save()
			 new PersonaFisica(auxiliar:"",informacionTributaria:"",profesion: "",fax: "",telefono:"",codPostal: "",ciudad:"",domicilio:"",conyuge:"",madre: "", padre: "",estadoCivil: "Soltero", fechaNacimiento: new Date(),observaciones:"", nombre: "Romina", apellido: "Perrone", dni: "3000001", pais: "Argentina", email: "a@a.com", estudio: (Estudio.getAll().get(0))).save()
			 new PersonaJuridica(razonSocial:"Matute SA", cuit:"4343242", email:"matute@gmail.com").save()
			 new PersonaJuridica(razonSocial:"Nicolote SA", cuit:"4332247", email:"nicolote@gmail.com").save()
			 new PersonaJuridica(razonSocial:"Romain SA", cuit:"4122247", email:"romain@gmail.com").save()
		 }
    }
	def destroy = {
		 }
}
	

