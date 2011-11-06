package sapienter

import grails.plugins.springsecurity.Secured

class ProcesoController {
	def springSecurityService
	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def index = {
		redirect(action: "list", params: params)
	}
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def list = {
		def procesoList
		def procesoTotal
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		if(params.q){
			procesoList = Proceso.search(params.q + "*").results
			procesoTotal = procesoList.size
		}
		else{
			procesoList = Proceso.list(params)
			procesoTotal = Proceso.count()
		}
		[procesoInstanceList: procesoList, procesoInstanceTotal: procesoTotal]
	}
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def create = {
		def procesoInstance = new Proceso()
		def persona = Persona.findById(params["personaId"])
		def user = SecUser.get(springSecurityService.principal.id)
		procesoInstance.putAt("persona", persona)
		procesoInstance.properties = params

		procesoInstance.responsable = user
		return [procesoInstance: procesoInstance]
	}
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def save = {
		def userAut = null
		if (params.usuariosAutorizados != null)
			userAut = params.usuariosAutorizados.id

		params.remove("usuariosAutorizados")
		def personaInstance = Persona.get(params.persona)
		params.remove("persona")
		params.put("persona", personaInstance)

		def sub = Subcategoria.get(params.subCategoria)
		params.remove("subCategoria")
		params.put("subCategoria", sub)
		def procesoInstance = new Proceso(params)
		def user = SecUser.get(springSecurityService.principal.id)
		procesoInstance.ultimoModificador = user

		if (userAut != null)
			for (int i = 0; i < userAut.size(); i++) {
				Integer idAux = new Integer(userAut[i])
				def userAux = Usuario.get(idAux)
				procesoInstance.usuariosAutorizados.add(userAux)
			}

		if (procesoInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'proceso.label', default: 'Proceso'), procesoInstance.id])}"
			redirect(action: "show", id: procesoInstance.id)
		}
		else {
			render(view: "create", model: [procesoInstance: procesoInstance])
		}
	}
	@Secured(['IS_AUTHENTICATED_FULLY'])
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
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def edit = {
		def user = SecUser.get(springSecurityService.principal.id)
		def srRole = SecRole.findByAuthority('ROLE_SENIOR')
		def procesoInstance = Proceso.get(params.id)
		if (user.rol != srRole) {
			if (procesoInstance.usuariosAutorizados != null) {
				if (procesoInstance.usuariosAutorizados.contains(user)){
				}
				else {
					flash.message = "${message(code: 'default.not.authorized.message')}"
					redirect(action: "list")
				}
			}
		}
		if (!procesoInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'proceso.label', default: 'Proceso'), params.id])}"
			redirect(action: "list")
		}
		else {
			return [procesoInstance: procesoInstance]
		}
	}
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def update = {
		def map = params
		def sub = Subcategoria.get(params.subCategoria.id)
		params.remove("subCategoria")
		params.put("subCategoria", sub)
		def user = SecUser.get(springSecurityService.principal.id)
		def procesoInstance = Proceso.get(params.id)
		procesoInstance.ultimoModificador = user
		if (procesoInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (procesoInstance.version > version) {

					procesoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [
						message(code: 'proceso.label', default: 'Proceso')]
					as Object[], "Another user has updated this Proceso while you were editing")
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
	@Secured(['IS_AUTHENTICATED_FULLY'])
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
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def crearDocumento = {
		def parametros = new HashMap()
		parametros.put("proceso.id", params.id)
		redirect(controller:"documento", action:"create", params:parametros)
	}
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def crearMovimiento = {
		def parametros = new HashMap()
		parametros.put("proceso.id", params.id)
		redirect(controller:"movimiento", action:"create", params:parametros)
	}
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def crearGasto = {
		def parametros = new HashMap()
		parametros.put("proceso.id", params.id)
		redirect(controller:"gasto", action:"create", params:parametros)
	}
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def crearParte = {
		def parametros = new HashMap()
		parametros.put("proceso.id", params.id)
		redirect(controller:"parte", action:"create", params:parametros)
	}
}
