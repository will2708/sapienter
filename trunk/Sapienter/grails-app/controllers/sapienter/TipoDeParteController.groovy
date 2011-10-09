package sapienter

import grails.plugins.springsecurity.Secured

class TipoDeParteController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def index = {
        redirect(action: "list", params: params)
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [tipoDeParteInstanceList: TipoDeParte.list(params), tipoDeParteInstanceTotal: TipoDeParte.count()]
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def create = {
        def tipoDeParteInstance = new TipoDeParte()
        tipoDeParteInstance.properties = params
        return [tipoDeParteInstance: tipoDeParteInstance]
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def save = {
        def tipoDeParteInstance = new TipoDeParte(params)
        if (tipoDeParteInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'tipoDeParte.label', default: 'TipoDeParte'), tipoDeParteInstance.id])}"
            redirect(action: "show", id: tipoDeParteInstance.id)
        }
        else {
            render(view: "create", model: [tipoDeParteInstance: tipoDeParteInstance])
        }
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def show = {
        def tipoDeParteInstance = TipoDeParte.get(params.id)
        if (!tipoDeParteInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'tipoDeParte.label', default: 'TipoDeParte'), params.id])}"
            redirect(action: "list")
        }
        else {
            [tipoDeParteInstance: tipoDeParteInstance]
        }
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def edit = {
        def tipoDeParteInstance = TipoDeParte.get(params.id)
        if (!tipoDeParteInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'tipoDeParte.label', default: 'TipoDeParte'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [tipoDeParteInstance: tipoDeParteInstance]
        }
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def update = {
        def tipoDeParteInstance = TipoDeParte.get(params.id)
        if (tipoDeParteInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (tipoDeParteInstance.version > version) {
                    
                    tipoDeParteInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'tipoDeParte.label', default: 'TipoDeParte')] as Object[], "Another user has updated this TipoDeParte while you were editing")
                    render(view: "edit", model: [tipoDeParteInstance: tipoDeParteInstance])
                    return
                }
            }
            tipoDeParteInstance.properties = params
            if (!tipoDeParteInstance.hasErrors() && tipoDeParteInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'tipoDeParte.label', default: 'TipoDeParte'), tipoDeParteInstance.id])}"
                redirect(action: "show", id: tipoDeParteInstance.id)
            }
            else {
                render(view: "edit", model: [tipoDeParteInstance: tipoDeParteInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'tipoDeParte.label', default: 'TipoDeParte'), params.id])}"
            redirect(action: "list")
        }
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def delete = {
        def tipoDeParteInstance = TipoDeParte.get(params.id)
        if (tipoDeParteInstance) {
            try {
                tipoDeParteInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'tipoDeParte.label', default: 'TipoDeParte'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'tipoDeParte.label', default: 'TipoDeParte'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'tipoDeParte.label', default: 'TipoDeParte'), params.id])}"
            redirect(action: "list")
        }
    }
}
