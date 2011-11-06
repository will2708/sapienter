package sapienter

import grails.plugins.springsecurity.Secured

class MovimientoController {
	def springSecurityService
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def index = {
        redirect(action: "list", params: params)
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [movimientoInstanceList: Movimiento.list(params), movimientoInstanceTotal: Movimiento.count()]
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def create = {
		def proceso1 = Proceso.get(params.proceso.id)
		def user = SecUser.get(springSecurityService.principal.id)
		def srRole = SecRole.findByAuthority('ROLE_SENIOR')
		if (user.rol != srRole) {
			if (proceso1.usuariosAutorizados != null) {
				if (proceso1.usuariosAutorizados.contains(user)){
				}
				else {
					flash.message = "${message(code: 'default.not.authorized.message')}"
					redirect(controller:"proceso", action: "list")
					return
				}
			}
		}

        def movimientoInstance = new Movimiento()
        movimientoInstance.properties = params
        return [movimientoInstance: movimientoInstance]
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def save = {
		def proceso1 = params.proceso
		def user = SecUser.get(springSecurityService.principal.id)
		def srRole = SecRole.findByAuthority('ROLE_SENIOR')
		if (user.rol != srRole) {
			if (proceso.usuariosAutorizados != null) {
				if (proceso.usuariosAutorizados.contains(user)){
				}
				else {
					flash.message = "${message(code: 'default.not.authorized.message')}"
					redirect(controller:"proceso", action: "list")
					return
				}
			}
		}

		String fechaInicial = params.fechaDeCreacion
		String fechaFinal   = params.fechaDeVencimiento
		params.remove("fechaDeCreacion")
		params.remove("fechaDeVencimiento")
		if (fechaInicial != null &&
			fechaInicial != "" ){
			int anio = Integer.parseInt(fechaInicial.substring(6,10))
			int mes = Integer.parseInt(fechaInicial.substring(3,5))
			int dia = Integer.parseInt(fechaInicial.substring(0,2))
			int hora = 9
			int minutos = 00

			mes = mes - 1
			
			Calendar calendar = new GregorianCalendar(anio,mes,dia,hora,minutos)
			params.put("fechaDeCreacion", calendar.getTime())
		}
		if (fechaFinal != null &&
			fechaFinal != ""){
			int anio = Integer.parseInt(fechaFinal.substring(6,10))
			int mes = Integer.parseInt(fechaFinal.substring(3,5))
			int dia = Integer.parseInt(fechaFinal.substring(0,2))
			int hora = 9
			int minutos = 00
			
			mes = mes - 1
			
			Calendar calendar = new GregorianCalendar(anio,mes,dia,hora,minutos)
			params.put("fechaDeVencimiento", calendar.getTime())
		}
		
		def proceso2 = params.proceso
		params.remove("proceso")
				
        def movimientoInstance = new Movimiento(params)
		movimientoInstance.proceso = Proceso.get(proceso2)
		
        if (movimientoInstance.save(flush: true)) {
			if (fechaFinal != null &&
				fechaFinal != ""){
				Proceso proceso = movimientoInstance.getProperty("proceso")
				Calendario calendario = proceso.getResponsable().getCalendario()
				
				Calendar calendar = new GregorianCalendar();
				def inicio = movimientoInstance.getProperty("fechaDeVencimiento")
				calendar.setTime(inicio);
				calendar.add(Calendar.MINUTE, +15)
				def fin = calendar.getTime()
				
				def tarea = new Tarea(fechaInicio:inicio,
									  fechaFin:fin, 
									  calendario:calendario,
									  observacion: movimientoInstance.getProperty("descripcion"))
				tarea.save()
				movimientoInstance.tareaAsociada = tarea
				movimientoInstance.save()
				if (tarea.hasErrors()) {
					println tarea.errors
				}
			}
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'movimiento.label', default: 'Movimiento'), movimientoInstance.id])}"
            redirect(action: "show", id: movimientoInstance.id)
        }
        else {
            render(view: "create", model: [movimientoInstance: movimientoInstance])
        }
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def show = {
        def movimientoInstance = Movimiento.get(params.id)
        if (!movimientoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'movimiento.label', default: 'Movimiento'), params.id])}"
            redirect(action: "list")
        }
        else {
            [movimientoInstance: movimientoInstance]
        }
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def edit = {
        def movimientoInstance = Movimiento.get(params.id)
        if (!movimientoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'movimiento.label', default: 'Movimiento'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [movimientoInstance: movimientoInstance]
        }
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def update = {
		String fechaInicial = params.fechaDeCreacion
		String fechaFinal   = params.fechaDeVencimiento
		params.remove("fechaDeCreacion")
		params.remove("fechaDeVencimiento")
		if (fechaInicial != null &&
			fechaInicial != "" ){
			int anio = Integer.parseInt(fechaInicial.substring(6,10))
			int mes = Integer.parseInt(fechaInicial.substring(3,5))
			int dia = Integer.parseInt(fechaInicial.substring(0,2))
			int hora = 9
			int minutos = 00

			mes = mes - 1
			
			Calendar calendar = new GregorianCalendar(anio,mes,dia,hora,minutos)
			params.put("fechaDeCreacion", calendar.getTime())
		}
		if (fechaFinal != null &&
			fechaFinal != ""){
			int anio = Integer.parseInt(fechaFinal.substring(6,10))
			int mes = Integer.parseInt(fechaFinal.substring(3,5))
			int dia = Integer.parseInt(fechaFinal.substring(0,2))
			int hora = 9
			int minutos = 15
			
			mes = mes - 1
			
			Calendar calendar = new GregorianCalendar(anio,mes,dia,hora,minutos)
			params.put("fechaDeVencimiento", calendar.getTime())
		}

		def proceso2 = Proceso.get(params.proceso)
		params.remove("proceso")
		params.put("proceso", proceso2)	

        def movimientoInstance = Movimiento.get(params.id)
        if (movimientoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (movimientoInstance.version > version) {
                    
                    movimientoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'movimiento.label', default: 'Movimiento')] as Object[], "Another user has updated this Movimiento while you were editing")
                    render(view: "edit", model: [movimientoInstance: movimientoInstance])
                    return
                }
            }
            movimientoInstance.properties = params
            if (!movimientoInstance.hasErrors() && movimientoInstance.save(flush: true)) {
				if (movimientoInstance.tareaAsociada != null){
					movimientoInstance.tareaAsociada.fechaFin = movimientoInstance.fechaDeVencimiento 
					movimientoInstance.tareaAsociada.fechaInicio = movimientoInstance.fechaDeCreacion
					movimientoInstance.tareaAsociada.save()
				}
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'movimiento.label', default: 'Movimiento'), movimientoInstance.id])}"
                redirect(action: "show", id: movimientoInstance.id)
            }
            else {
                render(view: "edit", model: [movimientoInstance: movimientoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'movimiento.label', default: 'Movimiento'), params.id])}"
            redirect(action: "list")
        }
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def delete = {
        def movimientoInstance = Movimiento.get(params.id)
		def tarea = movimientoInstance.tareaAsociada
		if (movimientoInstance) {
            try {
                movimientoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'movimiento.label', default: 'Movimiento'), params.id])}"
                def parametros = new HashMap()
				if (tarea != null) 
					tarea.delete(flush: true)
				parametros.put("id", movimientoInstance.proceso.id)
				redirect(controller:"proceso", action:"show", params:parametros)
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'movimiento.label', default: 'Movimiento'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'movimiento.label', default: 'Movimiento'), params.id])}"
            redirect(action: "list")
        }
    }
}
