package sapienter
import java.util.Iterator;
import grails.plugins.springsecurity.Secured
import org.codehaus.groovy.grails.commons.ConfigurationHolder as CH
import org.grails.activiti.ActivitiConstants
import org.grails.activiti.ApprovalStatus

class DocumentoController {
	def springSecurityService
	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	static activiti = true
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def index = {
		redirect(action: "list", params: params)
	}
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def start = {
		def map = params
		session["procesid"] = params.get("proceso.id")
		params.remove("proceso")
		params.remove("proceso.id")
		start(params)
	}
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def list = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[documentoInstanceList: Documento.list(params), 
			documentoInstanceTotal: Documento.count(),
			myTasksCount: assignedTasksCount]
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def create = {
		def proceso = Proceso.get(session["procesid"])
		def user = SecUser.get(springSecurityService.principal.id)
		def srRole = SecRole.findByAuthority('ROLE_SENIOR')
		def userAut = false
		if (user.role != srRole) {
			
			if (proceso.usuariosAutorizados != null) {
				for (Iterator iterator = proceso.usuariosAutorizados.iterator(); iterator
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
		def documentoInstance = new Documento()
		params.put("proceso.id",session["procesid"])
		documentoInstance.properties = params
		if(user.role !=SecRole.findByAuthority('ROLE_JUNIOR')){
			documentoInstance.estado = ApprovalStatus.APPROVED
		}
        return [documentoInstance: documentoInstance,
			myTasksCount: assignedTasksCount]
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def save = {
		def proceso = Proceso.get(session["procesid"])
		def user = SecUser.get(springSecurityService.principal.id)
		def srRole = SecRole.findByAuthority('ROLE_SENIOR')
		def userAut = false
		if (user.role != srRole) {
			
			if (proceso.usuariosAutorizados != null) {
				for (Iterator iterator = proceso.usuariosAutorizados.iterator(); iterator
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

		params.remove("proceso")
		
		def documentoInstance = new Documento(params)
		documentoInstance.proceso = proceso
		
		params.remove("usuarioResponsable")
		params.remove("usuarioResponsable.id")
        if (documentoInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'documento.label', default: 'Documento'), documentoInstance.id])}"
			params.id = documentoInstance.id
			if (params.complete) {
				completeTask(params)
			} else {
				params.action="show"
				saveTask(params)
			}
			
            redirect(action: "show", id: documentoInstance.id)
        }
        else {
            render(view: "create", model: [documentoInstance: documentoInstance,myTasksCount: assignedTasksCount])
        }
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def show = {
		def documentoInstance = Documento.get(params.id)
		if (!documentoInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'documento.label', default: 'Documento'), params.id])}"
			redirect(action: "list")
		}
		else {
			[documentoInstance: documentoInstance,myTasksCount: assignedTasksCount]
		}
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def approval = {
		show()
	  }

	@Secured(['IS_AUTHENTICATED_FULLY'])
	def performApproval = {
		 def documentoInstance = Documento.get(params.id)
		 if (documentoInstance) {
			 if (params.version) {
				 def version = params.version.toLong()
				 if (documentoInstance.version > version) {
					 
					 documentoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'documento.label', default: 'Documento')] as Object[], "Otro usuario modificó el documento mientas usted lo estaba editando")
					 render(view: "approval", model: [documentoInstance: documentoInstance,
													  myTasksCount: assignedTasksCount])
					 return
				 }
			 }
			 documentoInstance.properties = params
			 def map = params
			 params.remove("usuarioResponsable")
			 params.remove("usuarioResponsable.id")
			 if (!documentoInstance.hasErrors() && documentoInstance.save(flush: true)) {
				 flash.message = "${message(code: 'default.updated.message', args: [message(code: 'documento.label', default: 'Documento'), documentoInstance.id])}"
				 if (params.complete) {
										 params.id = documentoInstance.id
										 params.documentoAprobado = documentoInstance.estado == ApprovalStatus.APPROVED
										 /*params.from = grailsApplication.config.activiti.mailServerDefaultFrom
										 params.emailTo = grailsApplication.config.activiti.mailServerDefaultFrom
										 params.approvalRemark = params.approvalRemark && params.approvalRemark != "" ? params.approvalRemark : "Sin comentarios."*/
						 completeTask(params)
								 } else {
										 params.action="approval"
										 saveTask(params)
								 }
								 params.isApproval = true
				 redirect(action: "show", id: documentoInstance.id, params: params)
								 
			 }
			 else {
				 render(view: "approval", model: [documentoInstance: documentoInstance,
													  myTasksCount: assignedTasksCount])
			 }
		 }
		 else {
			 flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'documento.label', default: 'Documento'), params.id])}"
			 redirect(controller: "task", action: "myTaskList")
		 }
		 
	 }
 
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def edit = {
		def proceso = Proceso.get(session["procesid"])
		def user = SecUser.get(springSecurityService.principal.id)
		def srRole = SecRole.findByAuthority('ROLE_SENIOR')
<<<<<<< .mine
		def userAut = false
		if (user.role != srRole) {
			
=======
		def documentoInstance = Documento.get(params.id)
		if (user.rol != srRole) {
>>>>>>> .r497
			if (proceso.usuariosAutorizados != null) {
				for (Iterator iterator = proceso.usuariosAutorizados.iterator(); iterator
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
        def documentoInstance = Documento.get(params.id)
        if (!documentoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'documento.label', default: 'Documento'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [documentoInstance: documentoInstance,
                    myTasksCount: assignedTasksCount]
        }
	}

	@Secured(['IS_AUTHENTICATED_FULLY'])
	def update = {
        def documentoInstance = Documento.get(params.id)
        if (documentoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (documentoInstance.version > version) {
                    
                    documentoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'documento.label', default: 'Documento')] as Object[], "Another user has updated this Documento while you were editing")
                    render(view: "edit", model: [documentoInstance: documentoInstance,
													myTasksCount: assignedTasksCount])
                    return
                }
            }
            documentoInstance.properties = params
            if (!documentoInstance.hasErrors() && documentoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'documento.label', default: 'Documento'), documentoInstance.id])}"
				        Boolean isComplete = params["_action_update"].equals(message(code: 'default.button.complete.label', default: 'Complete'))
								if (isComplete) {
										params.reenviarDocumento = documentoInstance.reenviarDocumento
										completeTask(params)
								} else {
										params.action="show"
										saveTask(params)
								}				
                redirect(action: "show", id: documentoInstance.id, params: [taskId:params.taskId, complete:isComplete?:null])
            }
            else {
                render(view: "edit", model: [documentoInstance: documentoInstance,
                    myTasksCount: assignedTasksCount])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'documento.label', default: 'Documento'), params.id])}"
            redirect(controller: "task", action: "myTaskList")
        }
	}
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def delete = {
		def proceso = Proceso.get(session["procesid"])
		def user = SecUser.get(springSecurityService.principal.id)
		def srRole = SecRole.findByAuthority('ROLE_SENIOR')
<<<<<<< .mine
		def userAut = false
		if (user.role != srRole) {
			
=======
		def documentoInstance = Documento.get(params.id)
		if (user.rol != srRole) {
>>>>>>> .r497
			if (proceso.usuariosAutorizados != null) {
				for (Iterator iterator = proceso.usuariosAutorizados.iterator(); iterator
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

        def documentoInstance = Documento.get(params.id)
        if (documentoInstance) {
            try {
                documentoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'documento.label', default: 'Documento'), params.id])}"
                redirect(controller: "task", action: "myTaskList")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'documento.label', default: 'Documento'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'documento.label', default: 'Documento'), params.id])}"
            redirect(controller: "task", action: "myTaskList")
        }
	}
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def createDesdeModelo = {
		println params
		def id = params.modId
		def modeloDeDocumentoInstance = ModeloDeDocumento.get(id)
		Map variables = new HashMap()
		def str = modeloDeDocumentoInstance.getModeloDeDocumento()
		def nuevoTexto
		def nuevaBusqueda
		def documentoInstance = new Documento()
		documentoInstance.proceso = Proceso.get(params.proId)

		if (str != null){
			def regex2 = /(::[a-zA-Z0-9'"¿?\s]+::)/
			def matcher = str =~ regex2
			def i = 0

			for (Iterator iterator = matcher.iterator(); iterator
			.hasNext();) {
				iterator.next()
				nuevoTexto = (matcher[i][1]).toString().substring(2,(matcher[i][1]).toString().length()-2)
				nuevoTexto = params.getAt(nuevoTexto)
				nuevaBusqueda = matcher[i][0]
				regex2 = /$nuevaBusqueda/
				str = str.replaceAll(regex2, nuevoTexto)
				i++
			}
		}

		documentoInstance.setContenidoDocumento(str)
		render(view: "create", model: [documentoInstance: documentoInstance])
	}
}
