package sapienter

import grails.plugins.springsecurity.Secured

class UsuarioController {
	def springSecurityService
	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	@Secured(['Senior', 'IS_AUTHENTICATED_FULLY'])
	def index = {
		redirect(action: "list", params: params)
	}
	@Secured(['Senior','IS_AUTHENTICATED_FULLY'])
	def list = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[usuarioInstanceList: Usuario.list(params), usuarioInstanceTotal: Usuario.count()]
	}

	@Secured(['Senior','IS_AUTHENTICATED_FULLY'])
	def create = {
		def secRoleInstance = new SecRole()
		def usuarioInstance = new Usuario()
		usuarioInstance.properties = params
		return [usuarioInstance: usuarioInstance]
	}

	@Secured(['Senior','IS_AUTHENTICATED_FULLY'])
	def save = {
		def user = SecUser.get(springSecurityService.principal.id)
		def role = SecRole.findById(params["secRole"].id)
		def estudio = user.estudio
		params.put("estudio", estudio)
		def usuarioInstance = new Usuario(params)
		usuarioInstance.rol = role
		usuarioInstance.usuarioCreacion = user
		if (usuarioInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuarioInstance.id])}"
			def calendario =new Calendario()
			calendario.setProperty("usuario", usuarioInstance)
			calendario.save()
			usuarioInstance.calendario = calendario
			usuarioInstance.save()
			SecUserSecRole.create(usuarioInstance, role)
			redirect(action: "show", id: usuarioInstance.id)
		}
		else {
			render(view: "create", model: [usuarioInstance: usuarioInstance])
		}
	}
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def show = {
		def usuarioInstance = Usuario.get(params.id)
		if (!usuarioInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])}"
			redirect(action: "list")
		}
		else {
			[usuarioInstance: usuarioInstance]
		}
	}
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def edit = {
		def usuarioInstance = Usuario.get(params.id)
		if (!usuarioInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])}"
			redirect(action: "list")
		}
		else {
			return [usuarioInstance: usuarioInstance]
		}
	}

	@Secured(['Senior','IS_AUTHENTICATED_FULLY'])
	def update = {
		def user = SecUser.get(springSecurityService.principal.id)
		
		def usuarioInstance = Usuario.get(params.id)
		def role = usuarioInstance.rol
		if (usuarioInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (usuarioInstance.version > version) {
					
					usuarioInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [
						message(code: 'usuario.label', default: 'Usuario')]
					as Object[], "Another user has updated this Usuario while you were editing")
					render(view: "edit", model: [usuarioInstance: usuarioInstance])
					return
				}
			}
			usuarioInstance.properties = params
			usuarioInstance.usuarioModificacion = user
			if (!usuarioInstance.hasErrors() && usuarioInstance.save(flush: true)) {
				SecUserSecRole.removeAll(usuarioInstance)
				SecUserSecRole.create(usuarioInstance, role)
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuarioInstance.id])}"
				redirect(action: "show", id: usuarioInstance.id)
			}
			else {
				render(view: "edit", model: [usuarioInstance: usuarioInstance])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])}"
			redirect(action: "list")
		}
	}
	@Secured(['Senior','IS_AUTHENTICATED_FULLY'])
	def delete = {
		def usuarioInstance = Usuario.get(params.id)
		if (usuarioInstance) {
			try {
				usuarioInstance.delete(flush: true)
				flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])}"
				redirect(action: "list")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])}"
				redirect(action: "show", id: params.id)
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])}"
			redirect(action: "list")
		}
	}
}