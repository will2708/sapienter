

<%@ page import="sapienter.PersonaJuridica" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'personaJuridica.label', default: 'PersonaJuridica')}" />
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
            <g:hasErrors bean="${personaJuridicaInstance}">
            <div class="errors">
                <g:renderErrors bean="${personaJuridicaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${personaJuridicaInstance?.id}" />
                <g:hiddenField name="version" value="${personaJuridicaInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="razonSocial"><g:message code="personaJuridica.razonSocial.label" default="Razon Social" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personaJuridicaInstance, field: 'razonSocial', 'errors')}">
                                    <g:textField name="razonSocial" value="${personaJuridicaInstance?.razonSocial}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="cuit"><g:message code="personaJuridica.cuit.label" default="Cuit" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personaJuridicaInstance, field: 'cuit', 'errors')}">
                                    <g:textField name="cuit" value="${personaJuridicaInstance?.cuit}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="fechaDeInicioActividades"><g:message code="personaJuridica.fechaDeInicioActividades.label" default="Fecha De Inicio Actividades" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personaJuridicaInstance, field: 'fechaDeInicioActividades', 'errors')}">
                                    <g:datePicker name="fechaDeInicioActividades" precision="day" value="${personaJuridicaInstance?.fechaDeInicioActividades}" default="none" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="telefonoDeContacto"><g:message code="personaJuridica.telefonoDeContacto.label" default="Telefono De Contacto" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personaJuridicaInstance, field: 'telefonoDeContacto', 'errors')}">
                                    <g:textField name="telefonoDeContacto" value="${personaJuridicaInstance?.telefonoDeContacto}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="email"><g:message code="personaJuridica.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personaJuridicaInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${personaJuridicaInstance?.email}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="fax"><g:message code="personaJuridica.fax.label" default="Fax" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personaJuridicaInstance, field: 'fax', 'errors')}">
                                    <g:textField name="fax" value="${personaJuridicaInstance?.fax}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="auxiliares"><g:message code="personaJuridica.auxiliares.label" default="Auxiliares" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personaJuridicaInstance, field: 'auxiliares', 'errors')}">
                                    <g:textField name="auxiliares" value="${personaJuridicaInstance?.auxiliares}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="observaciones"><g:message code="personaJuridica.observaciones.label" default="Observaciones" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personaJuridicaInstance, field: 'observaciones', 'errors')}">
                                    <g:textField name="observaciones" value="${personaJuridicaInstance?.observaciones}" />
                                </td>
                            </tr>
                         
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="proceso"><g:message code="personaJuridica.proceso.label" default="Proceso" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personaJuridicaInstance, field: 'proceso', 'errors')}">
                                    <g:select name="proceso.id" from="${sapienter.Proceso.list()}" optionKey="id" value="${personaJuridicaInstance?.proceso?.id}"  />
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
