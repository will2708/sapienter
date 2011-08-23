
<%@ page import="sapienter.Persona" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'persona.label', default: 'Persona')}" />
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
                            <td valign="top" class="name"><g:message code="persona.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="persona.apellido.label" default="Apellido" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaInstance, field: "apellido")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="persona.nombre.label" default="Nombre" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaInstance, field: "nombre")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="persona.tipoDePersona.label" default="Tipo De Persona" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaInstance, field: "tipoDePersona")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="persona.observaciones.label" default="Observaciones" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaInstance, field: "observaciones")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="persona.pais.label" default="Pais" /></td>
                            
                            <td valign="top" class="value"><country:name object="${personaInstance?.pais}"/></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="persona.dni.label" default="Dni" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaInstance, field: "dni")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="persona.fechaNacimiento.label" default="Fecha Nacimiento" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${personaInstance?.fechaNacimiento}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="persona.estadoCivil.label" default="Estado Civil" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaInstance, field: "estadoCivil")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="persona.padre.label" default="Padre" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaInstance, field: "padre")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="persona.madre.label" default="Madre" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaInstance, field: "madre")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="persona.conyuge.label" default="Conyuge" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaInstance, field: "conyuge")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="persona.email.label" default="Email" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaInstance, field: "email")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="persona.sitioWeb.label" default="Sitio Web" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaInstance, field: "sitioWeb")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="persona.notifica.label" default="Notifica" /></td>
                            
                            <td valign="top" class="value"><g:link controller="notifica" action="show" id="${personaInstance?.notifica?.id}">${personaInstance?.notifica?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="persona.aux1.label" default="Aux1" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaInstance, field: "aux1")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="persona.aux2.label" default="Aux2" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaInstance, field: "aux2")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="persona.aux3.label" default="Aux3" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaInstance, field: "aux3")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="persona.aux4.label" default="Aux4" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaInstance, field: "aux4")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="persona.aux5.label" default="Aux5" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaInstance, field: "aux5")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="persona.ciudad.label" default="Ciudad" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaInstance, field: "ciudad")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="persona.codPostal.label" default="Cod Postal" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaInstance, field: "codPostal")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="persona.direccion.label" default="Direccion" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaInstance, field: "direccion")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="persona.empresa.label" default="Empresa" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaInstance, field: "empresa")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="persona.fax.label" default="Fax" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaInstance, field: "fax")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="persona.infoTrib1.label" default="Info Trib1" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaInstance, field: "infoTrib1")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="persona.infoTrib2.label" default="Info Trib2" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaInstance, field: "infoTrib2")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="persona.infoTrib3.label" default="Info Trib3" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaInstance, field: "infoTrib3")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="persona.profesion.label" default="Profesion" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaInstance, field: "profesion")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="persona.telefono.label" default="Telefono" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: personaInstance, field: "telefono")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${personaInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
