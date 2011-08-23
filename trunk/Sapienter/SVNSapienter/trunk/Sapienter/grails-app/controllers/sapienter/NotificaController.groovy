package sapienter

class NotificaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [notificaInstanceList: Notifica.list(params), notificaInstanceTotal: Notifica.count()]
    }

    def create = {
        def notificaInstance = new Notifica()
        notificaInstance.properties = params
        return [notificaInstance: notificaInstance]
    }

    def save = {
        def notificaInstance = new Notifica(params)
        if (notificaInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'notifica.label', default: 'Notifica'), notificaInstance.id])}"
            redirect(action: "show", id: notificaInstance.id)
        }
        else {
            render(view: "create", model: [notificaInstance: notificaInstance])
        }
    }

    def show = {
        def notificaInstance = Notifica.get(params.id)
        if (!notificaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'notifica.label', default: 'Notifica'), params.id])}"
            redirect(action: "list")
        }
        else {
            [notificaInstance: notificaInstance]
        }
    }

    def edit = {
        def notificaInstance = Notifica.get(params.id)
        if (!notificaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'notifica.label', default: 'Notifica'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [notificaInstance: notificaInstance]
        }
    }

    def update = {
        def notificaInstance = Notifica.get(params.id)
        if (notificaInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (notificaInstance.version > version) {
                    
                    notificaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'notifica.label', default: 'Notifica')] as Object[], "Another user has updated this Notifica while you were editing")
                    render(view: "edit", model: [notificaInstance: notificaInstance])
                    return
                }
            }
            notificaInstance.properties = params
            if (!notificaInstance.hasErrors() && notificaInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'notifica.label', default: 'Notifica'), notificaInstance.id])}"
                redirect(action: "show", id: notificaInstance.id)
            }
            else {
                render(view: "edit", model: [notificaInstance: notificaInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'notifica.label', default: 'Notifica'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def notificaInstance = Notifica.get(params.id)
        if (notificaInstance) {
            try {
                notificaInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'notifica.label', default: 'Notifica'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'notifica.label', default: 'Notifica'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'notifica.label', default: 'Notifica'), params.id])}"
            redirect(action: "list")
        }
    }
}
