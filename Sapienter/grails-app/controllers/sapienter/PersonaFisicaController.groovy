package sapienter

import grails.plugins.springsecurity.Secured

class PersonaFisicaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def index = {
        redirect(action: "list", params: params)
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [personaFisicaInstanceList: PersonaFisica.list(params), personaFisicaInstanceTotal: PersonaFisica.count()]
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def create = {
		params.put("tipo","Fisica")
        redirect(controller:"persona", action:"create_mod",params:params)
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def save = {
		redirect(controller: "persona", action: "createFisica", params: params)
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def show = {
        def personaFisicaInstance = PersonaFisica.get(params.id)
        if (!personaFisicaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'personaFisica.label', default: 'PersonaFisica'), params.id])}"
            redirect(action: "list")
        }
        else {
            [personaFisicaInstance: personaFisicaInstance]
        }
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def edit = {
        def personaFisicaInstance = PersonaFisica.get(params.id)
        if (!personaFisicaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'personaFisica.label', default: 'PersonaFisica'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [personaFisicaInstance: personaFisicaInstance]
        }
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def update = {
        def personaFisicaInstance = PersonaFisica.get(params.id)
        if (personaFisicaInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (personaFisicaInstance.version > version) {
                    
                    personaFisicaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'personaFisica.label', default: 'PersonaFisica')] as Object[], "Another user has updated this PersonaFisica while you were editing")
                    render(view: "edit", model: [personaFisicaInstance: personaFisicaInstance])
                    return
                }
            }
            personaFisicaInstance.properties = params
            if (!personaFisicaInstance.hasErrors() && personaFisicaInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'personaFisica.label', default: 'PersonaFisica'), personaFisicaInstance.id])}"
                redirect(action: "show", id: personaFisicaInstance.id)
            }
            else {
                render(view: "edit", model: [personaFisicaInstance: personaFisicaInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'personaFisica.label', default: 'PersonaFisica'), params.id])}"
            redirect(action: "list")
        }
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def delete = {
        def personaFisicaInstance = PersonaFisica.get(params.id)
        if (personaFisicaInstance) {
            try {
                personaFisicaInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'personaFisica.label', default: 'PersonaFisica'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'personaFisica.label', default: 'PersonaFisica'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'personaFisica.label', default: 'PersonaFisica'), params.id])}"
            redirect(action: "list")
        }
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def crearProceso = {		
		def parametros = new HashMap()
		parametros.put("personaId", params.id)
		redirect(controller:"proceso", action:"create", params:parametros)
	}
}
