
<%@ page import="sapienter.Tarea" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'tarea.label', default: 'Tarea')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
    <div>
	<div class = "buttonSubMenu"> 
		 <span><g:link class="create" action="create"><g:message code="sapienter.crear" args="[entityName]" /></g:link></span>
	</div>
	<g:form>
	<g:hiddenField name="id" value="${tareaInstance?.id}" />
		<div class="buttonForm">
			<span><g:actionSubmit class="edit" action="edit" value="${message(code: 'sapienter.modificar', default: 'Edit')}" /></span>
	 	</div>
	 	<div class="buttonForm"> 
			<span><g:actionSubmit class="delete" action="delete" value="${message(code: 'sapienter.borrar', default: 'Delete')}"
					onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
			</span>
		</div>
	</g:form>
	</div>
        <div class="body">
            <h1>Tarea</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table class="tabla">
                    <tbody>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="tarea.fechaInicio.label" default="Fecha Inicio" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: tareaInstance, field: "fechaInicio")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="tarea.fechaFin.label" default="Fecha Fin" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: tareaInstance, field: "fechaFin")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="descripcion"><g:message code="tarea.observacion.label" default="Observacion" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: tareaInstance, field: "observacion")}</td>
                            
                        </tr>
                                        
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
