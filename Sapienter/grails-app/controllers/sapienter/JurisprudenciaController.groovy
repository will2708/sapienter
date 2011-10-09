package sapienter

import grails.plugins.springsecurity.Secured

class JurisprudenciaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def index = {
        redirect(action: "list", params: params)
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [jurisprudenciaInstanceList: Jurisprudencia.list(params), jurisprudenciaInstanceTotal: Jurisprudencia.count()]
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def create = {
		def estudio = Estudio.getAll().get(0)
		params.put("estudio", estudio)
		
        def jurisprudenciaInstance = new Jurisprudencia()
        jurisprudenciaInstance.properties = params
		
        return [jurisprudenciaInstance: jurisprudenciaInstance]
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def save = {
        def jurisprudenciaInstance = new Jurisprudencia(params)
        if (jurisprudenciaInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'jurisprudencia.label', default: 'Jurisprudencia'), jurisprudenciaInstance.id])}"
            redirect(action: "show", id: jurisprudenciaInstance.id)
        }
        else {
            render(view: "create", model: [jurisprudenciaInstance: jurisprudenciaInstance])
        }
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def show = {
        def jurisprudenciaInstance = Jurisprudencia.get(params.id)
        if (!jurisprudenciaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'jurisprudencia.label', default: 'Jurisprudencia'), params.id])}"
            redirect(action: "list")
        }
        else {
            [jurisprudenciaInstance: jurisprudenciaInstance]
        }
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def edit = {	
        def jurisprudenciaInstance = Jurisprudencia.get(params.id)
        if (!jurisprudenciaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'jurisprudencia.label', default: 'Jurisprudencia'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [jurisprudenciaInstance: jurisprudenciaInstance]
        }
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def update = {
        def jurisprudenciaInstance = Jurisprudencia.get(params.id)
        if (jurisprudenciaInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (jurisprudenciaInstance.version > version) {
                    
                    jurisprudenciaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'jurisprudencia.label', default: 'Jurisprudencia')] as Object[], "Another user has updated this Jurisprudencia while you were editing")
                    render(view: "edit", model: [jurisprudenciaInstance: jurisprudenciaInstance])
                    return
                }
            }
            jurisprudenciaInstance.properties = params
            if (!jurisprudenciaInstance.hasErrors() && jurisprudenciaInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'jurisprudencia.label', default: 'Jurisprudencia'), jurisprudenciaInstance.id])}"
                redirect(action: "show", id: jurisprudenciaInstance.id)
            }
            else {
                render(view: "edit", model: [jurisprudenciaInstance: jurisprudenciaInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'jurisprudencia.label', default: 'Jurisprudencia'), params.id])}"
            redirect(action: "list")
        }
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def delete = {
        def jurisprudenciaInstance = Jurisprudencia.get(params.id)
        if (jurisprudenciaInstance) {
            try {
                jurisprudenciaInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'jurisprudencia.label', default: 'Jurisprudencia'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'jurisprudencia.label', default: 'Jurisprudencia'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'jurisprudencia.label', default: 'Jurisprudencia'), params.id])}"
            redirect(action: "list")
        }
    }
}
