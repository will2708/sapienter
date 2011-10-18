
<%@ page import="sapienter.Tarea" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'tarea.label', default: 'Tarea')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
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
                <table>
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
                            <td valign="top" class="name"><g:message code="tarea.observacion.label" default="Observacion" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: tareaInstance, field: "observacion")}</td>
                            
                        </tr>
                                        
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${tareaInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
            		<span class="button"><g:actionSubmit class="list" action="calendario" value="${message(code: 'default.calendario.label', default: 'Calendario')}" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
