package sapienter

import grails.plugins.springsecurity.Secured

class ParteController {
	def springSecurityService
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def index = {
        redirect(action: "list", params: params)
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [parteInstanceList: Parte.list(params), parteInstanceTotal: Parte.count()]
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def create = {
		def proceso1 = Proceso.get(params.proceso.id)
		def user = SecUser.get(springSecurityService.principal.id)
		def srRole = SecRole.findByAuthority('ROLE_SENIOR')
		def userAut = false
		if (user.role != srRole) {
			
			if (proceso1.usuariosAutorizados != null) {
				for (Iterator iterator = proceso1.usuariosAutorizados.iterator(); iterator
						.hasNext();) {
					SecUser users = (SecUser) iterator.next();
					if (users.id == user.id)
						userAut = true										
				}
				
				if (userAut){
				}
				else {
					flash.message = "${message(code: 'default.not.authorized.message')}"
					redirect(controller:"proceso", action: "list")
					return
				}
			}
		}

        def parteInstance = new Parte()
        parteInstance.properties = params
        return [parteInstance: parteInstance]
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def save = {
		def proceso1 = Proceso.get(params.proceso)
		def user = SecUser.get(springSecurityService.principal.id)
		def srRole = SecRole.findByAuthority('ROLE_SENIOR')
		def userAut = false
		if (user.role != srRole) {
			
			if (proceso1.usuariosAutorizados != null) {
				for (Iterator iterator = proceso1.usuariosAutorizados.iterator(); iterator
						.hasNext();) {
					SecUser users = (SecUser) iterator.next();
					if (users.id == user.id)
						userAut = true										
				}
				
				if (userAut){
				}
				else {
					flash.message = "${message(code: 'default.not.authorized.message')}"
					redirect(controller:"proceso", action: "list")
					return
				}
			}
		}

		def proceso =params.proceso
		params.remove("proceso")
        def parteInstance = new Parte(params)
		parteInstance.proceso = Proceso.get(proceso)
        if (parteInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'parte.label', default: 'Parte'), parteInstance.id])}"
            redirect(action: "show", id: parteInstance.id)
        }
        else {
            render(view: "create", model: [parteInstance: parteInstance])
        }
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
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
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def edit = {
		def map = params
		def parteInstance = Parte.get(params.id)
		def proceso1 = parteInstance.proceso
		def user = SecUser.get(springSecurityService.principal.id)
		def srRole = SecRole.findByAuthority('ROLE_SENIOR')
		def userAut = false
		if (user.role != srRole) {
			
			if (proceso1.usuariosAutorizados != null) {
				for (Iterator iterator = proceso1.usuariosAutorizados.iterator(); iterator
						.hasNext();) {
					SecUser users = (SecUser) iterator.next();
					if (users.id == user.id)
						userAut = true										
				}
				
				if (userAut){
				}
				else {
					flash.message = "${message(code: 'default.not.authorized.message')}"
					redirect(controller:"proceso", action: "list")
					return
				}
			}
		}

        
        if (!parteInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'parte.label', default: 'Parte'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [parteInstance: parteInstance]
        }
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def update = {
		def proceso = params.proceso
		params.remove("proceso")
        def parteInstance = Parte.get(params.id)
		parteInstance.proceso = Proceso.get(proceso)
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
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def delete = {
        def parteInstance = Parte.get(params.id)
        if (parteInstance) {
            try {
                parteInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'parte.label', default: 'Parte'), params.id])}"
				def parametros = new HashMap()
				parametros.put("id", parteInstance.proceso.id)
				redirect(controller:"proceso", action:"show", params:parametros)
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
