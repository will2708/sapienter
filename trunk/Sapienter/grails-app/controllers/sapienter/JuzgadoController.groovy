package sapienter

import grails.plugins.springsecurity.Secured

class JuzgadoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def index = {
        redirect(action: "list", params: params)
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [juzgadoInstanceList: Juzgado.list(params), juzgadoInstanceTotal: Juzgado.count()]
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def create = {
        def juzgadoInstance = new Juzgado()
        juzgadoInstance.properties = params
        return [juzgadoInstance: juzgadoInstance]
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def save = {
        def juzgadoInstance = new Juzgado(params)
        if (juzgadoInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'juzgado.label', default: 'Juzgado'), juzgadoInstance.id])}"
            redirect(action: "show", id: juzgadoInstance.id)
        }
        else {
            render(view: "create", model: [juzgadoInstance: juzgadoInstance])
        }
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def show = {
        def juzgadoInstance = Juzgado.get(params.id)
        if (!juzgadoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'juzgado.label', default: 'Juzgado'), params.id])}"
            redirect(action: "list")
        }
        else {
            [juzgadoInstance: juzgadoInstance]
        }
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def edit = {
        def juzgadoInstance = Juzgado.get(params.id)
        if (!juzgadoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'juzgado.label', default: 'Juzgado'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [juzgadoInstance: juzgadoInstance]
        }
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def update = {
        def juzgadoInstance = Juzgado.get(params.id)
        if (juzgadoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (juzgadoInstance.version > version) {
                    
                    juzgadoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'juzgado.label', default: 'Juzgado')] as Object[], "Another user has updated this Juzgado while you were editing")
                    render(view: "edit", model: [juzgadoInstance: juzgadoInstance])
                    return
                }
            }
            juzgadoInstance.properties = params
            if (!juzgadoInstance.hasErrors() && juzgadoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'juzgado.label', default: 'Juzgado'), juzgadoInstance.id])}"
                redirect(action: "show", id: juzgadoInstance.id)
            }
            else {
                render(view: "edit", model: [juzgadoInstance: juzgadoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'juzgado.label', default: 'Juzgado'), params.id])}"
            redirect(action: "list")
        }
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def delete = {
        def juzgadoInstance = Juzgado.get(params.id)
        if (juzgadoInstance) {
            try {
                juzgadoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'juzgado.label', default: 'Juzgado'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'juzgado.label', default: 'Juzgado'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'juzgado.label', default: 'Juzgado'), params.id])}"
            redirect(action: "list")
        }
    }
}
