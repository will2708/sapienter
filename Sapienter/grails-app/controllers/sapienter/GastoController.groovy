package sapienter

import grails.plugins.springsecurity.Secured

class GastoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def index = {
        redirect(action: "list", params: params)
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [gastoInstanceList: Gasto.list(params), gastoInstanceTotal: Gasto.count()]
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def create = {
        def gastoInstance = new Gasto()
        gastoInstance.properties = params
        return [gastoInstance: gastoInstance]
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def save = {
		def proceso = params.proceso
		params.remove("proceso")
		
        def gastoInstance = new Gasto(params)
		gastoInstance.proceso = Proceso.get(proceso)
        if (gastoInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'gasto.label', default: 'Gasto'), gastoInstance.id])}"
            redirect(action: "show", id: gastoInstance.id)
        }
        else {
            render(view: "create", model: [gastoInstance: gastoInstance])
        }
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def show = {
        def gastoInstance = Gasto.get(params.id)
        if (!gastoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'gasto.label', default: 'Gasto'), params.id])}"
            redirect(action: "list")
        }
        else {
            [gastoInstance: gastoInstance]
        }
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def edit = {
        def gastoInstance = Gasto.get(params.id)
        if (!gastoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'gasto.label', default: 'Gasto'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [gastoInstance: gastoInstance]
        }
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def update = {
        def gastoInstance = Gasto.get(params.id)
		def proceso = params.proceso
		params.remove("proceso")
		gastoInstance.proceso = Proceso.get(proceso)
        if (gastoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (gastoInstance.version > version) {
                    
                    gastoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'gasto.label', default: 'Gasto')] as Object[], "Another user has updated this Gasto while you were editing")
                    render(view: "edit", model: [gastoInstance: gastoInstance])
                    return
                }
            }
            gastoInstance.properties = params
            if (!gastoInstance.hasErrors() && gastoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'gasto.label', default: 'Gasto'), gastoInstance.id])}"
                redirect(action: "show", id: gastoInstance.id)
            }
            else {
                render(view: "edit", model: [gastoInstance: gastoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'gasto.label', default: 'Gasto'), params.id])}"
            redirect(action: "list")
        }
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def delete = {
        def gastoInstance = Gasto.get(params.id)
        if (gastoInstance) {
            try {
                gastoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'gasto.label', default: 'Gasto'), params.id])}"
				def parametros = new HashMap()
				parametros.put("id", gastoInstance.proceso.id)
				redirect(controller:"proceso", action:"show", params:parametros)
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'gasto.label', default: 'Gasto'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'gasto.label', default: 'Gasto'), params.id])}"
            redirect(action: "list")
        }
    }
}
