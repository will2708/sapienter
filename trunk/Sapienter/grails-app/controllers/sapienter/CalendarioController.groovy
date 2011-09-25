package sapienter

import java.util.Date

class CalendarioController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [calendarioInstanceList: Calendario.list(params), calendarioInstanceTotal: Calendario.count()]
    }

    def create = {
        def calendarioInstance = new Calendario()
        calendarioInstance.properties = params
        return [calendarioInstance: calendarioInstance]
    }

    def save = {
        def calendarioInstance = new Calendario(params)
        if (calendarioInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'calendario.label', default: 'Calendario'), calendarioInstance.id])}"
            redirect(action: "show", id: calendarioInstance.id)
        }
        else {
            render(view: "create", model: [calendarioInstance: calendarioInstance])
        }
    }

    def show = {
        def calendarioInstance = Calendario.get(params.id)
        if (!calendarioInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'calendario.label', default: 'Calendario'), params.id])}"
            redirect(action: "list")
        }
        else {
			def month = new java.util.Date()
			def appointments = Tarea.list()
		    [calendarioInstance: calendarioInstance, appointments: appointments, month: month]
        }
    }

    def edit = {
        def calendarioInstance = Calendario.get(params.id)
        if (!calendarioInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'calendario.label', default: 'Calendario'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [calendarioInstance: calendarioInstance]
        }
    }

    def update = {
        def calendarioInstance = Calendario.get(params.id)
        if (calendarioInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (calendarioInstance.version > version) {
                    
                    calendarioInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'calendario.label', default: 'Calendario')] as Object[], "Another user has updated this Calendario while you were editing")
                    render(view: "edit", model: [calendarioInstance: calendarioInstance])
                    return
                }
            }
            calendarioInstance.properties = params
            if (!calendarioInstance.hasErrors() && calendarioInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'calendario.label', default: 'Calendario'), calendarioInstance.id])}"
                redirect(action: "show", id: calendarioInstance.id)
            }
            else {
                render(view: "edit", model: [calendarioInstance: calendarioInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'calendario.label', default: 'Calendario'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def calendarioInstance = Calendario.get(params.id)
        if (calendarioInstance) {
            try {
                calendarioInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'calendario.label', default: 'Calendario'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'calendario.label', default: 'Calendario'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'calendario.label', default: 'Calendario'), params.id])}"
            redirect(action: "list")
        }
    }

	def month = {
		Date month = new Date()
		def appointments = Tarea.list()
		[appointments: appointments, month: month]
    }

	def dia = {
		def anio = new Integer(params.year)
		def mes = new Integer(params.month)
		def dia = new Integer(params.day)

		mes = mes - 1
		
		Calendar calendar = new GregorianCalendar()
		calendar.set(GregorianCalendar.YEAR, anio)
		calendar.set(GregorianCalendar.MONTH, mes)
		calendar.set(GregorianCalendar.DAY_OF_MONTH, dia)
		def fecha = calendar.getTime()
						
		def appointments = Tarea.list()
		[fecha:fecha, appointments: appointments]
	}

	def semana = {
		def anio = new Integer(params.year)
	
		Calendar calendar = new GregorianCalendar()
		calendar.set(GregorianCalendar.YEAR, anio)
		calendar.set(GregorianCalendar.DAY_OF_WEEK, GregorianCalendar.MONDAY)
		calendar.set(GregorianCalendar.WEEK_OF_YEAR, new Integer(params.week))
		def fecha = calendar.getTime();
		
		def appointments = Tarea.list()
		[fecha:fecha, appointments: appointments]
	}
			
	def showItem = {
		redirect(controller:"tarea" ,action:"show", params:params)
	}		

	def nuevaTarea = {
		def mapa = params
		def parametros = new HashMap()
		parametros.put("calendario.id", params.id)
		redirect(controller:"tarea" ,action:"create", params:parametros)
	}	
}
