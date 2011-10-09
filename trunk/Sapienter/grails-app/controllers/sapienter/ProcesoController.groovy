package sapienter

import grails.plugins.springsecurity.Secured

class ProcesoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def index = {
        redirect(action: "list", params: params)
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [procesoInstanceList: Proceso.list(params), procesoInstanceTotal: Proceso.count()]
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def create = {
        def procesoInstance = new Proceso()
		def persona = Persona.findById(params["personaId"])
		procesoInstance.putAt("persona", persona)
        procesoInstance.properties = params
        return [procesoInstance: procesoInstance]
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def save = {
		def personaInstance = Persona.get(params.persona)
		params.remove("persona") 
		params.put("persona", personaInstance)
		
		def sub = Subcategoria.get(params.subCategoria)
		params.remove("subCategoria")
		params.put("subCategoria", sub)
		def procesoInstance = new Proceso(params)
        if (procesoInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'proceso.label', default: 'Proceso'), procesoInstance.id])}"
            redirect(action: "show", id: procesoInstance.id)
        }
        else {
            render(view: "create", model: [procesoInstance: procesoInstance])
        }
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def show = {
        def procesoInstance = Proceso.get(params.id)
        if (!procesoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'proceso.label', default: 'Proceso'), params.id])}"
            redirect(action: "list")
        }
        else {
            [procesoInstance: procesoInstance]
        }
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def edit = {
        def procesoInstance = Proceso.get(params.id)
        if (!procesoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'proceso.label', default: 'Proceso'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [procesoInstance: procesoInstance]
        }
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def update = {
		def sub = Subcategoria.get(params.subCategoria)
		params.remove("subCategoria")
		params.put("subCategoria", sub)
		
		def procesoInstance = Proceso.get(params.id)
        if (procesoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (procesoInstance.version > version) {
                    
                    procesoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'proceso.label', default: 'Proceso')] as Object[], "Another user has updated this Proceso while you were editing")
                    render(view: "edit", model: [procesoInstance: procesoInstance])
                    return
                }
            }
            procesoInstance.properties = params
            if (!procesoInstance.hasErrors() && procesoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'proceso.label', default: 'Proceso'), procesoInstance.id])}"
                redirect(action: "show", id: procesoInstance.id)
            }
            else {
                render(view: "edit", model: [procesoInstance: procesoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'proceso.label', default: 'Proceso'), params.id])}"
            redirect(action: "list")
        }
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def delete = {
        def procesoInstance = Proceso.get(params.id)
        if (procesoInstance) {
            try {
                procesoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'proceso.label', default: 'Proceso'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'proceso.label', default: 'Proceso'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'proceso.label', default: 'Proceso'), params.id])}"
            redirect(action: "list")
        }
    }
}
