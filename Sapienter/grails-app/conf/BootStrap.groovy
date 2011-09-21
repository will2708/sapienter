import sapienter.Estudio
import sapienter.PersonaFisica
import sapienter.PersonaJuridica

class BootStrap {

    def init = { servletContext -> 
		1.times { i ->
			 new Estudio(razonSocial: "Sapienter", cuit: "20-30409317-0", domicilioFiscal: "Mozart y Zaraza").save()
			 new PersonaFisica(auxiliar:"",informacionTributaria:"",profesion: "",fax: "",telefono:"",codPostal: "",ciudad:"",domicilio:"",conyuge:"",madre: "", padre: "",estadoCivil: "Soltero", fechaNacimiento: new Date(),observaciones:"", nombre: "Matias", apellido: "Stani", dni: "31111111", pais: "Argentina", email: "a@a.com", estudio: (Estudio.getAll().get(0))).save()
		}
    }
    def destroy = {
    }
}
