package sapienter

class ProcesoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [procesoInstanceList: Proceso.list(params), procesoInstanceTotal: Proceso.count()]
    }

    def create = {
        def procesoInstance = new Proceso()
		def persona = Persona.findById(params["personaId"])
		procesoInstance.putAt("persona", persona)
        procesoInstance.properties = params
        return [procesoInstance: procesoInstance]
    }

    def save = {
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

    def update = {
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