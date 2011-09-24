package sapienter

class PersonaJuridicaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [personaJuridicaInstanceList: PersonaJuridica.list(params), personaJuridicaInstanceTotal: PersonaJuridica.count()]
    }

    def create = {
	  params.put("tipo","Juridica")
      redirect(controller:"persona", action:"create_mod", params:params)
    }

    def save = {
		redirect(controller: "persona", action: "createJuridica", params: params)
    }

    def show = {
        def personaJuridicaInstance = PersonaJuridica.get(params.id)
        if (!personaJuridicaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'personaJuridica.label', default: 'PersonaJuridica'), params.id])}"
            redirect(action: "list")
        }
        else {
            [personaJuridicaInstance: personaJuridicaInstance]
        }
    }

    def edit = {
        def personaJuridicaInstance = PersonaJuridica.get(params.id)
        if (!personaJuridicaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'personaJuridica.label', default: 'PersonaJuridica'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [personaJuridicaInstance: personaJuridicaInstance]
        }
    }

    def update = {
        def personaJuridicaInstance = PersonaJuridica.get(params.id)
        if (personaJuridicaInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (personaJuridicaInstance.version > version) {
                    
                    personaJuridicaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'personaJuridica.label', default: 'PersonaJuridica')] as Object[], "Another user has updated this PersonaJuridica while you were editing")
                    render(view: "edit", model: [personaJuridicaInstance: personaJuridicaInstance])
                    return
                }
            }
            personaJuridicaInstance.properties = params
            if (!personaJuridicaInstance.hasErrors() && personaJuridicaInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'personaJuridica.label', default: 'PersonaJuridica'), personaJuridicaInstance.id])}"
                redirect(action: "show", id: personaJuridicaInstance.id)
            }
            else {
                render(view: "edit", model: [personaJuridicaInstance: personaJuridicaInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'personaJuridica.label', default: 'PersonaJuridica'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def personaJuridicaInstance = PersonaJuridica.get(params.id)
        if (personaJuridicaInstance) {
            try {
                personaJuridicaInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'personaJuridica.label', default: 'PersonaJuridica'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'personaJuridica.label', default: 'PersonaJuridica'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'personaJuridica.label', default: 'PersonaJuridica'), params.id])}"
            redirect(action: "list")
        }
    }

}
