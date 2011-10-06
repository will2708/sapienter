
<%@ page import="sapienter.Calendario" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'calendario.label', default: 'Calendario')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
		<fullcal:resources/>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
			<fullcal:calendar id="cal">
	    		header: { left: "month, agendaWeek, agendaDay", center: "title", right: "prev, today, next" },
	    		columnFormat: { week: 'ddd d/M' },
	    		timeFormat: 'HH:mm{ - HH:mm}',
	    		buttonText: { today:    'Hoy',
	    					  month:    'Mes',
	    					  week:     'Semana',
	    					  day:      'Dia'
	    					  },
	    		dayNames: ['Domingo', 'Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sabado'],
	    		dayNamesShort: ['Dom', 'Lun', 'Mar', 'Mie', 'Jue', 'Vie', 'Sab'],
	    		allDaySlot: false,
	    		minTime: '7:00am',
	    		maxTime: '8:00pm',
	    		events: 'events'			  
			</fullcal:calendar>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${calendarioInstance?.id}" />
	                <span class="button"><g:actionSubmit class="edit" action="nuevaTarea" value="${message(code: 'default.button.nuevaTarea.label', default: 'Nueva Tarea')}" /></span>                    
                </g:form>
            </div>
        </div>
    </body>
</html>
