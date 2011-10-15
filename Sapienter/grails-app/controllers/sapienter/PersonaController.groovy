package sapienter

import grails.plugins.springsecurity.Secured


class PersonaController {
	def springSecurityService
	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def index = {
		redirect(action: "list", params: params)
	}
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def list = {
		def personaFisicaList
		def personaJuridicaList
		def personaTotal
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		if(params.q){
			personaFisicaList = PersonaFisica.search(params.q + "*").results
			personaJuridicaList = PersonaJuridica.search(params.q + "*").results
			personaTotal = personaFisicaList.size + personaJuridicaList.size()
		}
		else{
			personaFisicaList = PersonaFisica.list(params)
			personaJuridicaList = PersonaJuridica.list(params)
			personaTotal = Persona.count()
		}
		[personaInstanceTotal: personaTotal, personaFisicaList: personaFisicaList,personaJuridicaList:personaJuridicaList]
	}
	def showTime = {
		render "The time is ${new Date()}"
	}
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def createFisica = {
		def user = SecUser.get(springSecurityService.principal.id)
		def estudio = user.estudio
		params.put("estudio", estudio)
def pa = params
		def personaJuridicaInstance = new PersonaJuridica()

		def personaFisicaInstance = new PersonaFisica(params)
		if (personaFisicaInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'personaFisica.label', default: 'PersonaFisica'), personaFisicaInstance.id])}"
			redirect(Controller:"personaFisica", action: "show", id:personaFisicaInstance.id)
		}
		else {
			render(view: "create_mod", model: [personaFisicaInstance: personaFisicaInstance, personaJuridicaInstance: personaJuridicaInstance, selected1: "true", selected2: "false"])
		}
	}
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def createJuridica = {
		def user = SecUser.get(springSecurityService.principal.id)
		def estudio = user.estudio
		params.put("estudio", estudio)

		def personaJuridicaInstance = new PersonaJuridica(params)
		def personaFisicaInstance   = new PersonaFisica()

		if (personaJuridicaInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'personaJuridica.label', default: 'PersonaJuridica'), personaJuridicaInstance.id])}"
			redirect(controller:"personaJuridica", action: "show", id: personaJuridicaInstance.id)
		}
		else {
			render(view: "create_mod", model: [personaFisicaInstance: personaFisicaInstance, personaJuridicaInstance: personaJuridicaInstance, selected2: "true", selected1: "false"])
		}
	}
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def create_mod = {
		def personaFisicaInstance   = new PersonaFisica()
		def personaJuridicaInstance = new PersonaJuridica()
		if (params.getProperty("tipo") == "Juridica")
			render(view: "create_mod", model: [personaFisicaInstance: personaFisicaInstance, personaJuridicaInstance: personaJuridicaInstance,selected1: "false", selected2: "true"])
		else
			render(view: "create_mod", model: [personaFisicaInstance: personaFisicaInstance, personaJuridicaInstance: personaJuridicaInstance,selected1: "true", selected2: "false"])
	}
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def create = {
		def personaInstance = new Persona()
		personaInstance.properties = params
		return [personaInstance: personaInstance]
	}
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def save = {
		def personaInstance = new Persona(params)
		if (personaInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'persona.label', default: 'Persona'), personaInstance.id])}"
			redirect(action: "show", id: personaInstance.id)
		}
		else {
			render(view: "create", model: [personaInstance: personaInstance])
		}
	}
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def show = {
		def personaInstance = Persona.get(params.id)
		if (!personaInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'persona.label', default: 'Persona'), params.id])}"
		}
		else {
			if(personaInstance.class == PersonaFisica)
				redirect(controller:"personaFisica", action: "show", id: personaInstance.id)
			else
				redirect(controller:"personaJuridica", action: "show", id: personaInstance.id)
		}
	}
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def edit = {
		def personaInstance = Persona.get(params.id)
		if (!personaInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'persona.label', default: 'Persona'), params.id])}"
			redirect(action: "list")
		}
		else {
			return [personaInstance: personaInstance]
		}
	}
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def update = {
		def personaInstance = Persona.get(params.id)
		if (personaInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (personaInstance.version > version) {

					personaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [
						message(code: 'persona.label', default: 'Persona')]
					as Object[], "Another user has updated this Persona while you were editing")
					render(view: "edit", model: [personaInstance: personaInstance])
					return
				}
			}
			personaInstance.properties = params
			if (!personaInstance.hasErrors() && personaInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'persona.label', default: 'Persona'), personaInstance.id])}"
				redirect(action: "show", id: personaInstance.id)
			}
			else {
				render(view: "edit", model: [personaInstance: personaInstance])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'persona.label', default: 'Persona'), params.id])}"
			redirect(action: "list")
		}
	}
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def delete = {
		def personaInstance = Persona.get(params.id)
		if (personaInstance) {
			try {
				personaInstance.delete(flush: true)
				flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'persona.label', default: 'Persona'), params.id])}"
				redirect(action: "list")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'persona.label', default: 'Persona'), params.id])}"
				redirect(action: "show", id: params.id)
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'persona.label', default: 'Persona'), params.id])}"
			redirect(action: "list")
		}
	}
}
