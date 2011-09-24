

<%@ page import="sapienter.Calendario" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'calendario.label', default: 'Calendario')}" />
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
            <g:hasErrors bean="${calendarioInstance}">
            <div class="errors">
                <g:renderErrors bean="${calendarioInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="descripcion"><g:message code="calendario.descripcion.label" default="Descripcion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: calendarioInstance, field: 'descripcion', 'errors')}">
                                    <g:textField name="descripcion" value="${calendarioInstance?.descripcion}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="tipoDeTareas"><g:message code="calendario.tipoDeTareas.label" default="Tipo De Tareas" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: calendarioInstance, field: 'tipoDeTareas', 'errors')}">
                                    <g:select name="tipoDeTareas" from="${calendarioInstance.constraints.tipoDeTareas.inList}" value="${calendarioInstance?.tipoDeTareas}" valueMessagePrefix="calendario.tipoDeTareas"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="usuarioResponsable"><g:message code="calendario.usuarioResponsable.label" default="Usuario Responsable" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: calendarioInstance, field: 'usuarioResponsable', 'errors')}">
                                    <g:select name="usuarioResponsable.id" from="${sapienter.Usuario.list()}" optionKey="id" value="${calendarioInstance?.usuarioResponsable?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="usuario"><g:message code="calendario.usuario.label" default="Usuario" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: calendarioInstance, field: 'usuario', 'errors')}">
                                    <g:select name="usuario.id" from="${sapienter.Usuario.list()}" optionKey="id" value="${calendarioInstance?.usuario?.id}"  />
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
