
<%@ page import="sapienter.Calendario" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'calendario.label', default: 'Calendario')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
		<resource:calendarMonthView />
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
				<richui:calendarMonthView items="${appointments}"
	                               createLink="true" constraintDateFields="['fechaInicio-fechaFin', 'fechaInicio', 'fechaFin']"
	                               displayField="observacion" teaser="true" teaserLength="20" 
	                               weekOfYear="true" weekAction="semana" dayAction="dia"
	                               month="${month}" action="showItem" />
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${calendarioInstance?.id}" />
<!--                <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
-->
	                <span class="button"><g:actionSubmit class="edit" action="nuevaTarea" value="${message(code: 'default.button.nuevaTarea.label', default: 'Nueva Tarea')}" /></span>                    
                </g:form>
            </div>
        </div>
    </body>
</html>
