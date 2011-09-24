
<%@ page import="sapienter.PersonaFisica" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'personaFisica.label', default: 'PersonaFisica')}" />
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
                            <td valign="top" class="name"><g:message code="personaFisica.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaFisicaInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personaFisica.apellido.label" default="Apellido" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaFisicaInstance, field: "apellido")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personaFisica.nombre.label" default="Nombre" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaFisicaInstance, field: "nombre")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personaFisica.observaciones.label" default="Observaciones" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaFisicaInstance, field: "observaciones")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personaFisica.pais.label" default="Pais" /></td>
                            
                            <td valign="top" class="value">
                            	<g:country code="${personaFisicaInstance?.pais}"/>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personaFisica.dni.label" default="Dni" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaFisicaInstance, field: "dni")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personaFisica.fechaNacimiento.label" default="Fecha Nacimiento" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${personaFisicaInstance?.fechaNacimiento}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personaFisica.estadoCivil.label" default="Estado Civil" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaFisicaInstance, field: "estadoCivil")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personaFisica.padre.label" default="Padre" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaFisicaInstance, field: "padre")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personaFisica.madre.label" default="Madre" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaFisicaInstance, field: "madre")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personaFisica.conyuge.label" default="Conyuge" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaFisicaInstance, field: "conyuge")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personaFisica.email.label" default="Email" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaFisicaInstance, field: "email")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personaFisica.auxiliar.label" default="Auxiliar" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaFisicaInstance, field: "auxiliar")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personaFisica.ciudad.label" default="Ciudad" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaFisicaInstance, field: "ciudad")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personaFisica.codPostal.label" default="Cod Postal" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaFisicaInstance, field: "codPostal")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personaFisica.domicilio.label" default="Domicilio" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaFisicaInstance, field: "domicilio")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personaFisica.estudio.label" default="Estudio" /></td>
                            
                            <td valign="top" class="value"><g:link controller="estudio" action="show" id="${personaFisicaInstance?.estudio?.id}">${personaFisicaInstance?.estudio?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personaFisica.fax.label" default="Fax" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaFisicaInstance, field: "fax")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personaFisica.informacionTributaria.label" default="Informacion Tributaria" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaFisicaInstance, field: "informacionTributaria")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personaFisica.proceso.label" default="Proceso" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${personaFisicaInstance.proceso}" var="p">
                                    <li><g:link controller="proceso" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personaFisica.profesion.label" default="Profesion" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaFisicaInstance, field: "profesion")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="personaFisica.telefono.label" default="Telefono" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaFisicaInstance, field: "telefono")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${personaFisicaInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
