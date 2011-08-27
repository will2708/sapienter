package sapienter

class ParteController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [parteInstanceList: Parte.list(params), parteInstanceTotal: Parte.count()]
    }

    def create = {
        def parteInstance = new Parte()
        parteInstance.properties = params
        return [parteInstance: parteInstance]
    }

    def save = {
        def parteInstance = new Parte(params)
        if (parteInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'parte.label', default: 'Parte'), parteInstance.id])}"
            redirect(action: "show", id: parteInstance.id)
        }
        else {
            render(view: "create", model: [parteInstance: parteInstance])
        }
    }

    def show = {
        def parteInstance = Parte.get(params.id)
        if (!parteInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'parte.label', default: 'Parte'), params.id])}"
            redirect(action: "list")
        }
        else {
            [parteInstance: parteInstance]
        }
    }

    def edit = {
        def parteInstance = Parte.get(params.id)
        if (!parteInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'parte.label', default: 'Parte'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [parteInstance: parteInstance]
        }
    }

    def update = {
        def parteInstance = Parte.get(params.id)
        if (parteInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (parteInstance.version > version) {
                    
                    parteInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'parte.label', default: 'Parte')] as Object[], "Another user has updated this Parte while you were editing")
                    render(view: "edit", model: [parteInstance: parteInstance])
                    return
                }
            }
            parteInstance.properties = params
            if (!parteInstance.hasErrors() && parteInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'parte.label', default: 'Parte'), parteInstance.id])}"
                redirect(action: "show", id: parteInstance.id)
            }
            else {
                render(view: "edit", model: [parteInstance: parteInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'parte.label', default: 'Parte'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def parteInstance = Parte.get(params.id)
        if (parteInstance) {
            try {
                parteInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'parte.label', default: 'Parte'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'parte.label', default: 'Parte'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'parte.label', default: 'Parte'), params.id])}"
            redirect(action: "list")
        }
    }
}