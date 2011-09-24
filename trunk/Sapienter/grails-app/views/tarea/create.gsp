

<%@ page import="sapienter.Tarea" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'tarea.label', default: 'Tarea')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${tareaInstance}">
            <div class="errors">
                <g:renderErrors bean="${tareaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fechaInicio"><g:message code="tarea.fechaInicio.label" default="Fecha Inicio" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tareaInstance, field: 'fechaInicio', 'errors')}">
                                    <g:datePicker name="fechaInicio" precision="minute" value="${tareaInstance?.fechaInicio}"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fechaFin"><g:message code="tarea.fechaFin.label" default="Fecha Fin" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tareaInstance, field: 'fechaFin', 'errors')}">
                                    <g:datePicker name="fechaFin" precision="minute" value="${tareaInstance?.fechaFin}"/>
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
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
