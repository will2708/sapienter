package sapienter

import grails.converters.JSON

import java.text.SimpleDateFormat
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
		if (params.id != "events"){
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
		}else
		{
			this.events(params)
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

	def nuevaTarea = {
		def mapa = params
		def parametros = new HashMap()
		parametros.put("calendario.id", params.id)
		redirect(controller:"tarea" ,action:"create", params:parametros)
	}	
	
	def events = {
		def start = new Date(params.long('start')*1000)
		def end = new Date(params.long('end')*1000)
				
		render Tarea.findAllByFechaInicioBetween(start, end).collect {
		   [
				 id: it.id,
				 title: "$it.observacion",
				 start: this.getDateInTimeZone(it.fechaInicio, "GMT-6"),
				 end: this.getDateInTimeZone(it.fechaFin, "GMT-6"),
				 allDay: false,
				 url: g.createLink(controller:"tarea", action:'show', id:it.id),
		   ]
		} as JSON
	 }
	public static Date getDateInTimeZone(Date currentDate, String timeZoneId)
	{
		TimeZone tz = TimeZone.getTimeZone(timeZoneId);
		Calendar mbCal = new GregorianCalendar(TimeZone.getTimeZone(timeZoneId));
		mbCal.setTimeInMillis(currentDate.getTime());
		
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.YEAR, mbCal.get(Calendar.YEAR));
		cal.set(Calendar.MONTH, mbCal.get(Calendar.MONTH));
		cal.set(Calendar.DAY_OF_MONTH, mbCal.get(Calendar.DAY_OF_MONTH));
		cal.set(Calendar.HOUR_OF_DAY, mbCal.get(Calendar.HOUR_OF_DAY));
		cal.set(Calendar.MINUTE, mbCal.get(Calendar.MINUTE));
		cal.set(Calendar.SECOND, mbCal.get(Calendar.SECOND));
		cal.set(Calendar.MILLISECOND, mbCal.get(Calendar.MILLISECOND));
		
		return cal.getTime();
	}
}
