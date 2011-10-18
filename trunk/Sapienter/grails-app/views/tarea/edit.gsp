

<%@ page import="sapienter.Tarea" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'tarea.label', default: 'Tarea')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${tareaInstance}">
            <div class="errors">
                <g:renderErrors bean="${tareaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${tareaInstance?.id}" />
                <g:hiddenField name="version" value="${tareaInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="fechaInicio"><g:message code="tarea.fechaInicio.label" default="Fecha Inicio" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tareaInstance, field: 'fechaInicio', 'errors')}">
                                    
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="fechaFin"><g:message code="tarea.fechaFin.label" default="Fecha Fin" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tareaInstance, field: 'fechaFin', 'errors')}">
                                    
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="observacion"><g:message code="tarea.observacion.label" default="Observacion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tareaInstance, field: 'observacion', 'errors')}">
                                    <g:textField name="observacion" value="${tareaInstance?.observacion}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="calendario"><g:message code="tarea.calendario.label" default="Calendario" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tareaInstance, field: 'calendario', 'errors')}">
                                    <g:select name="calendario.id" from="${sapienter.Calendario.list()}" optionKey="id" value="${tareaInstance?.calendario?.id}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
