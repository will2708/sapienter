package sapienter

class EstudioController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [estudioInstanceList: Estudio.list(params), estudioInstanceTotal: Estudio.count()]
    }

    def create = {
        def estudioInstance = new Estudio()
        estudioInstance.properties = params
        return [estudioInstance: estudioInstance]
    }

    def save = {
        def estudioInstance = new Estudio(params)
        if (estudioInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'estudio.label', default: 'Estudio'), estudioInstance.id])}"
            redirect(action: "show", id: estudioInstance.id)
        }
        else {
            render(view: "create", model: [estudioInstance: estudioInstance])
        }
    }

    def show = {
        def estudioInstance = Estudio.get(params.id)
        if (!estudioInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'estudio.label', default: 'Estudio'), params.id])}"
            redirect(action: "list")
        }
        else {
            [estudioInstance: estudioInstance]
        }
    }

    def edit = {
        def estudioInstance = Estudio.get(params.id)
        if (!estudioInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'estudio.label', default: 'Estudio'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [estudioInstance: estudioInstance]
        }
    }

    def update = {
        def estudioInstance = Estudio.get(params.id)
        if (estudioInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (estudioInstance.version > version) {
                    
                    estudioInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'estudio.label', default: 'Estudio')] as Object[], "Another user has updated this Estudio while you were editing")
                    render(view: "edit", model: [estudioInstance: estudioInstance])
                    return
                }
            }
            estudioInstance.properties = params
            if (!estudioInstance.hasErrors() && estudioInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'estudio.label', default: 'Estudio'), estudioInstance.id])}"
                redirect(action: "show", id: estudioInstance.id)
            }
            else {
                render(view: "edit", model: [estudioInstance: estudioInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'estudio.label', default: 'Estudio'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def estudioInstance = Estudio.get(params.id)
        if (estudioInstance) {
            try {
                estudioInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'estudio.label', default: 'Estudio'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'estudio.label', default: 'Estudio'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'estudio.label', default: 'Estudio'), params.id])}"
            redirect(action: "list")
        }
    }
}
