package sapienter

import grails.plugins.springsecurity.Secured

class TareaController {
	def springSecurityService
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def index = {
        redirect(action: "list", params: params)
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [tareaInstanceList: Tarea.list(params), tareaInstanceTotal: Tarea.count()]
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def create = {
        def tareaInstance = new Tarea()
        tareaInstance.properties = params

		Calendar calendar = new GregorianCalendar();
		def fecha = new Date()
		tareaInstance.fechaInicio = fecha
		
		calendar.setTime(fecha);
	    calendar.add(Calendar.MINUTE, +15)
		
		tareaInstance.fechaFin = calendar.getTime()
		
        return [tareaInstance: tareaInstance]
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def save = {
		def tareaInstance = new Tarea(params)
		def user = SecUser.get(springSecurityService.principal.id)
		tareaInstance.calendario = user.calendario 

        if (tareaInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'tarea.label', default: 'Tarea'), tareaInstance.id])}"
            redirect(action: "show", id: tareaInstance.id)
        }
        else {
            render(view: "create", model: [tareaInstance: tareaInstance])
        }
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def show = {
        def tareaInstance = Tarea.get(params.id)
        if (!tareaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'tarea.label', default: 'Tarea'), params.id])}"
            redirect(action: "list")
        }
        else {
			def movimiento = Movimiento.findByTareaAsociada(tareaInstance)
			if (movimiento == null)
				movimiento = new Movimiento()
            [tareaInstance: tareaInstance, movimiento:movimiento]
        }
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def edit = {
        def tareaInstance = Tarea.get(params.id)
        if (!tareaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'tarea.label', default: 'Tarea'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [tareaInstance: tareaInstance]
        }
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def update = {
        def tareaInstance = Tarea.get(params.id)
		def user = SecUser.get(springSecurityService.principal.id)
		tareaInstance.calendario = user.calendario
		
        if (tareaInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (tareaInstance.version > version) {
                    
                    tareaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'tarea.label', default: 'Tarea')] as Object[], "Another user has updated this Tarea while you were editing")
                    render(view: "edit", model: [tareaInstance: tareaInstance])
                    return
                }
            }
            tareaInstance.properties = params
            if (!tareaInstance.hasErrors() && tareaInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'tarea.label', default: 'Tarea'), tareaInstance.id])}"
                redirect(action: "show", id: tareaInstance.id)
            }
            else {
                render(view: "edit", model: [tareaInstance: tareaInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'tarea.label', default: 'Tarea'), params.id])}"
            redirect(action: "list")
        }
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def delete = {
        def tareaInstance = Tarea.get(params.id)
		def movimiento = Movimiento.findByTareaAsociada(tareaInstance)
        if (tareaInstance) {
            try {
                tareaInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'tarea.label', default: 'Tarea'), params.id])}"
				if (movimiento != null){
					movimiento.tareaAsociada = null
					movimiento.save()
				}
				def parametros = new HashMap()
				parametros.put("id", tareaInstance.calendario.id)
				redirect(controller:"calendario", action:"show", params:parametros)
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'tarea.label', default: 'Tarea'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'tarea.label', default: 'Tarea'), params.id])}"
            redirect(action: "list")
        }
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def calendario = {
		def mapa = params
		def tareaInstance = Tarea.get(params.id)
		def parametros = new HashMap()
		parametros.put("id", tareaInstance.calendario.id)
		redirect(controller:"calendario", action:"show", params:parametros)
	}
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def crearDesdeCalendario = {
		def parametros = params
		Calendario cal = Calendario.get(params.calendario)
		Date fecha = new Date(params.fecha)

		def tareaInstance = new Tarea()
		tareaInstance.calendario = cal

		Calendar calendar = new GregorianCalendar();
		calendar.setTime(fecha)
		calendar.add(Calendar.HOUR, +9)
		fecha = calendar.getTime()
		tareaInstance.fechaInicio = fecha
		
		calendar.add(Calendar.MINUTE, +15)
		
		tareaInstance.fechaFin = calendar.getTime()
		
		render(view: "create", model: [tareaInstance: tareaInstance])
	}
}
