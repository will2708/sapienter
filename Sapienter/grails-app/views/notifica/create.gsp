

<%@ page import="sapienter.Notifica" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'notifica.label', default: 'Notifica')}" />
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
            <g:hasErrors bean="${notificaInstance}">
            <div class="errors">
                <g:renderErrors bean="${notificaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="descripcion"><g:message code="notifica.descripcion.label" default="Descripcion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: notificaInstance, field: 'descripcion', 'errors')}">
                                    <g:textField name="descripcion" value="${notificaInstance?.descripcion}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="domicilio"><g:message code="notifica.domicilio.label" default="Domicilio" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: notificaInstance, field: 'domicilio', 'errors')}">
                                    <g:textField name="domicilio" value="${notificaInstance?.domicilio}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="ciudad"><g:message code="notifica.ciudad.label" default="Ciudad" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: notificaInstance, field: 'ciudad', 'errors')}">
                                    <g:textField name="ciudad" value="${notificaInstance?.ciudad}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="telefono"><g:message code="notifica.telefono.label" default="Telefono" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: notificaInstance, field: 'telefono', 'errors')}">
                                    <g:textField name="telefono" value="${notificaInstance?.telefono}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="email"><g:message code="notifica.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: notificaInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${notificaInstance?.email}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="aux1"><g:message code="notifica.aux1.label" default="Aux1" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: notificaInstance, field: 'aux1', 'errors')}">
                                    <g:textField name="aux1" value="${notificaInstance?.aux1}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="aux2"><g:message code="notifica.aux2.label" default="Aux2" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: notificaInstance, field: 'aux2', 'errors')}">
                                    <g:textField name="aux2" value="${notificaInstance?.aux2}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fax"><g:message code="notifica.fax.label" default="Fax" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: notificaInstance, field: 'fax', 'errors')}">
                                    <g:textField name="fax" value="${notificaInstance?.fax}" />
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
