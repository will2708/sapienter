
<%@ page import="sapienter.PersonaJuridica" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'personaJuridica.label', default: 'PersonaJuridica')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
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
                            <td valign="top" class="name"><g:message code="personaJuridica.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaJuridicaInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personaJuridica.razonSocial.label" default="Razon Social" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaJuridicaInstance, field: "razonSocial")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personaJuridica.cuit.label" default="Cuit" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaJuridicaInstance, field: "cuit")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personaJuridica.fechaDeInicioActividades.label" default="Fecha De Inicio Actividades" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${personaJuridicaInstance?.fechaDeInicioActividades}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personaJuridica.telefonoDeContacto.label" default="Telefono De Contacto" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaJuridicaInstance, field: "telefonoDeContacto")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personaJuridica.email.label" default="Email" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaJuridicaInstance, field: "email")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personaJuridica.fax.label" default="Fax" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaJuridicaInstance, field: "fax")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personaJuridica.auxiliares.label" default="Auxiliares" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaJuridicaInstance, field: "auxiliares")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personaJuridica.observaciones.label" default="Observaciones" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaJuridicaInstance, field: "observaciones")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personaJuridica.estudio.label" default="Estudio" /></td>
                            
                            <td valign="top" class="value"><g:link controller="estudio" action="show" id="${personaJuridicaInstance?.estudio?.id}">${personaJuridicaInstance?.estudio?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personaJuridica.proceso.label" default="Proceso" /></td>
                            
                            <td valign="top" class="value"><g:link controller="proceso" action="show" id="${personaJuridicaInstance?.proceso?.id}">${personaJuridicaInstance?.proceso?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${personaJuridicaInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
