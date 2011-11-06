package sapienter

import grails.plugins.springsecurity.Secured

class PersonaJuridicaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def index = {
        redirect(action: "list", params: params)
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [personaJuridicaInstanceList: PersonaJuridica.list(params), personaJuridicaInstanceTotal: PersonaJuridica.count()]
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def create = {
	  params.put("tipo","Juridica")
      redirect(controller:"persona", action:"create_mod", params:params)
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def save = {
		redirect(controller: "persona", action: "createJuridica", params: params)
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def show = {
        def personaJuridicaInstance = PersonaJuridica.get(params.id)
        if (!personaJuridicaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'personaJuridica.label', default: 'PersonaJuridica'), params.id])}"
            redirect(controller: "persona", action: "list")
        }
        else {
            [personaJuridicaInstance: personaJuridicaInstance]
        }
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def edit = {
        def personaJuridicaInstance = PersonaJuridica.get(params.id)
        if (!personaJuridicaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'personaJuridica.label', default: 'PersonaJuridica'), params.id])}"
            redirect(controller: "persona", action: "list")
        }
        else {
            return [personaJuridicaInstance: personaJuridicaInstance]
        }
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def update = {
		String fechaDeInicioActividades = params.fechaDeInicioActividades
		params.remove("fechaDeInicioActividades")

		if (fechaDeInicioActividades != null &&
			fechaDeInicioActividades != "" ){
			int anio = Integer.parseInt(fechaDeInicioActividades.substring(6,10))
			int mes = Integer.parseInt(fechaDeInicioActividades.substring(3,5))
			int dia = Integer.parseInt(fechaDeInicioActividades.substring(0,2))
			int hora = 9
			int minutos = 00

			mes = mes - 1
			
			Calendar calendar = new GregorianCalendar(anio,mes,dia,hora,minutos)
			params.put("fechaDeInicioActividades", calendar.getTime())
		}
		
        def personaJuridicaInstance = PersonaJuridica.get(params.id)
        if (personaJuridicaInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (personaJuridicaInstance.version > version) {
                    
                    personaJuridicaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'personaJuridica.label', default: 'PersonaJuridica')] as Object[], "Another user has updated this PersonaJuridica while you were editing")
                    render(view: "edit", model: [personaJuridicaInstance: personaJuridicaInstance])
                    return
                }
            }
            personaJuridicaInstance.properties = params
            if (!personaJuridicaInstance.hasErrors() && personaJuridicaInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'personaJuridica.label', default: 'PersonaJuridica'), personaJuridicaInstance.id])}"
                redirect(action: "show", id: personaJuridicaInstance.id)
            }
            else {
                render(view: "edit", model: [personaJuridicaInstance: personaJuridicaInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'personaJuridica.label', default: 'PersonaJuridica'), params.id])}"
            redirect(controller: "persona", action: "list")
        }
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def delete = {
        def personaJuridicaInstance = PersonaJuridica.get(params.id)
        if (personaJuridicaInstance) {
            try {
                personaJuridicaInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'personaJuridica.label', default: 'PersonaJuridica'), params.id])}"
                redirect(controller: "persona", action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'personaJuridica.label', default: 'PersonaJuridica'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'personaJuridica.label', default: 'PersonaJuridica'), params.id])}"
            redirect(controller: "persona", action: "list")
        }
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def crearProceso = {
		def parametros = new HashMap()
		parametros.put("personaId", params.id)
		redirect(controller:"proceso", action:"create", params:parametros)
	}

}
