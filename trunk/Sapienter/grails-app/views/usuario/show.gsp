
<%@ page import="sapienter.Usuario" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
    	<div>
	        <div class="buttonSubMenu">
	            <span><g:link class="create" action="create"><g:message code="sapienter.crear" args="[entityName]" /></g:link></span>
	        </div>
           <g:form>
           <g:hiddenField name="id" value="${usuarioInstance?.id}" />
           		<div class="buttonForm">
           			<span ><g:actionSubmit class="edit" action="edit" value="${message(code: 'sapienter.modificar', default: 'Edit')}" /></span>
           		</div>
           		<div class="buttonForm">
                	<span><g:actionSubmit class="delete" action="delete" value="${message(code: 'sapienter.borrar', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
        <div class="body">
            <h1>Usuario</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table class="tabla">
                    <tbody>
                        <tr class="prop">
                            <td valign="top" class="descripcion"><g:message code="sapienter.id" default="Id" /></td>
                            <td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "id")}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.usuario" default="Username" /></td>
                            <td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "username")}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="persona.nombre" default="Nombre" /></td>
                            <td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "nombre")}</td>
                            <td valign="top" class="name"><g:message code="persona.apellido" default="Apellido" /></td>
                            <td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "apellido")}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.habilitado" default="Enabled" /></td>
                            <td valign="top" class="value"><g:formatBoolean boolean="${usuarioInstance?.enabled}" /></td>
                            <td valign="top" class="name"><g:message code="usuario.cuentaVencida" default="Account Expired" /></td>
                            <td valign="top" class="value"><g:formatBoolean boolean="${usuarioInstance?.accountExpired}" /></td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.cuentaBloqueada" default="Account Locked" /></td>
                            <td valign="top" class="value"><g:formatBoolean boolean="${usuarioInstance?.accountLocked}" /></td>
                            <td valign="top" class="name"><g:message code="usuario.contraseņaVencida" default="Password Expired" /></td>
                            <td valign="top" class="value"><g:formatBoolean boolean="${usuarioInstance?.passwordExpired}" /></td>
                            
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.correoElectronico.label" default="Correo Electronico" /></td>
                            <td valign="top" class="value"><g:link controller="correoElectronico" action="show" id="${usuarioInstance?.correoElectronico?.id}">${usuarioInstance?.correoElectronico?.encodeAsHTML()}</g:link></td>
                            <td valign="top" class="name"><g:message code="usuario.telefono.label" default="Telefono" /></td>
                            <td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "telefono")}</td>
                        </tr>                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.fechaCreacion" default="Date Created" /></td>
                            <td valign="top" class="value"><g:formatDate date="${usuarioInstance?.dateCreated}" /></td>
							<td valign="top" class="name"><g:message code="usuario.usuarioCreacion" default="Usuario Creacion" /></td>
                            <td valign="top" class="value"><g:link controller="usuario" action="show" id="${usuarioInstance?.usuarioCreacion?.id}">${usuarioInstance?.usuarioCreacion?.encodeAsHTML()}</g:link></td>                            
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.ultimaModificacion" default="Last Updated" /></td>
                            <td valign="top" class="value"><g:formatDate date="${usuarioInstance?.lastUpdated}" /></td>                        
                            <td valign="top" class="name"><g:message code="usuario.usuarioModificacion" default="Usuario Modificacion" /></td>
                            <td valign="top" class="value"><g:link controller="usuario" action="show" id="${usuarioInstance?.usuarioModificacion?.id}">${usuarioInstance?.usuarioModificacion?.encodeAsHTML()}</g:link></td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="descripcion"><g:message code="movimiento.comentario" default="Comentarios" /></td>
                            <td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "comentarios")}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
