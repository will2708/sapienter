package sapienter


class PersonaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [personaInstanceList: Persona.list(params), personaInstanceTotal: Persona.count()]
    }

	def createFisica = {
		def estudio = Estudio.getAll().get(0)
		params.put("estudio", estudio)
		
		def personaFisicaInstance = new PersonaFisica(params)
		if (personaFisicaInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'personaFisica.label', default: 'PersonaFisica'), personaFisicaInstance.id])}"
			redirect(action: "show", id: personaFisicaInstance.id)
		}
		else {
			render(view: "create_mod", model: [personaFisicaInstance: personaFisicaInstance, selected1: "true", selected2: "false"])
		}
    }

	def createJuridica = {
		def estudio = Estudio.getAll().get(0)
		params.put("estudio", estudio)

		def personaJuridicaInstance = new PersonaJuridica(params)
		
		if (personaJuridicaInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'personaJuridica.label', default: 'PersonaJuridica'), personaJuridicaInstance.id])}"
			redirect(action: "show", id: personaJuridicaInstance.id)
		}
		else {
			render(view: "create_mod", model: [personaJuridicaInstance: personaJuridicaInstance, selected2: "true", selected1: "false"])
		}
	}

	def create_mod = {
			render(view: "create_mod", model: [selected1: "true", selected2: "false"])
		}
				
    def create = {
        def personaInstance = new Persona()
        personaInstance.properties = params
        return [personaInstance: personaInstance]
    }

    def save = {
        def personaInstance = new Persona(params)
        if (personaInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'persona.label', default: 'Persona'), personaInstance.id])}"
            redirect(action: "show", id: personaInstance.id)
        }
        else {
            render(view: "create", model: [personaInstance: personaInstance])
        }
    }

    def show = {
        def personaInstance = Persona.get(params.id)
        if (!personaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'persona.label', default: 'Persona'), params.id])}"
            redirect(action: "list")
        }
        else {
            [personaInstance: personaInstance]
        }
    }

    def edit = {
        def personaInstance = Persona.get(params.id)
        if (!personaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'persona.label', default: 'Persona'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [personaInstance: personaInstance]
        }
    }

    def update = {
        def personaInstance = Persona.get(params.id)
        if (personaInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (personaInstance.version > version) {
                    
                    personaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'persona.label', default: 'Persona')] as Object[], "Another user has updated this Persona while you were editing")
                    render(view: "edit", model: [personaInstance: personaInstance])
                    return
                }
            }
            personaInstance.properties = params
            if (!personaInstance.hasErrors() && personaInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'persona.label', default: 'Persona'), personaInstance.id])}"
                redirect(action: "show", id: personaInstance.id)
            }
            else {
                render(view: "edit", model: [personaInstance: personaInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'persona.label', default: 'Persona'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def personaInstance = Persona.get(params.id)
        if (personaInstance) {
            try {
                personaInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'persona.label', default: 'Persona'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'persona.label', default: 'Persona'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'persona.label', default: 'Persona'), params.id])}"
            redirect(action: "list")
        }
    }
}
