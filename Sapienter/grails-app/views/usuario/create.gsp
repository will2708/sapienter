

<%@ page import="sapienter.Usuario" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
    	<div>
        <div class="buttonSubMenu">
            <span><g:link class="list" action="list"><g:message code="sapienter.usuario" args="[entityName]" /></g:link></span>
        </div>
        </div>
        <div class="body">
            <h1>Crear Usuario</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${usuarioInstance}">
            <div class="errors">
                <g:renderErrors bean="${usuarioInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
					<div class="margin">
						<div class="buttonNewObjects">
							 <span><g:actionSubmit class="create" action="save" value="${message(code: 'sapienter.guardar', default: 'Update')}" /></span>
						</div>
					</div>                  
                    <table class="tabla_edit">
                        <tbody>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="username"><g:message code="usuario.usuario" default="Username" /><mandatory> *</mandatory></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'username', 'errors')}">
                                    <g:textField class="textField" name="username" value="${usuarioInstance?.username}" />
                                </td>
                                <td valign="top" class="name">
                                    <label for="password"><g:message code="usuario.contraseña" default="Password" /><mandatory> *</mandatory></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'password', 'errors')}">
                                    <g:passwordField class="textField" name="password" value="${usuarioInstance?.password}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nombre"><g:message code="persona.nombre" default="Nombre" /><mandatory> *</mandatory></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'nombre', 'errors')}">
                                    <g:textField class="textField" name="nombre" value="${usuarioInstance?.nombre}" />
                                </td>
                                <td valign="top" class="name">
                                    <label for="apellido"><g:message code="persona.apellido" default="Apellido" /><mandatory> *</mandatory></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'apellido', 'errors')}">
                                    <g:textField class="textField" name="apellido" value="${usuarioInstance?.apellido}" />
                                </td>
                            </tr>                            
                             <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="Role"><g:message code="usuario.role" default="Role" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: secRoleInstance, field: 'authority', 'errors')}">
                                    <g:select class="textField" name="secRole.id" from="${sapienter.SecRole.list()}" optionKey="id" value="${secRoleInstance?.id}"  />
                                </td>
                            </tr>                            
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="enabled"><g:message code="usuario.habilitado" default="Enabled" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'enabled', 'errors')}">
                                    <g:checkBox class="textField" name="enabled" value="${usuarioInstance?.enabled}" />
                                </td>
                                <td valign="top" class="name">
                                    <label for="accountExpired"><g:message code="usuario.cuentaVencida" default="Account Expired" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'accountExpired', 'errors')}">
                                    <g:checkBox class="textField" name="accountExpired" value="${usuarioInstance?.accountExpired}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="accountLocked"><g:message code="usuario.cuentaBloqueada" default="Account Locked" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'accountLocked', 'errors')}">
                                    <g:checkBox class="textField" name="accountLocked" value="${usuarioInstance?.accountLocked}" />
                                </td>
                                <td valign="top" class="name">
                                    <label for="passwordExpired"><g:message code="usuario.contraseñaVencida" default="Password Expired" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'passwordExpired', 'errors')}">
                                    <g:checkBox class="textField" name="passwordExpired" value="${usuarioInstance?.passwordExpired}" />
                                </td>
                            </tr>
                       
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="correoElectronico"><g:message code="usuario.correoElectronico.label" default="Correo Electronico" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'correoElectronico', 'errors')}">
                                    <g:select class="textField" name="correoElectronico.id" from="${sapienter.CorreoElectronico.list()}" optionKey="id" value="${usuarioInstance?.correoElectronico?.id}" noSelection="['null': '']" />
                                </td>
                                <td valign="top" class="name">
                                    <label for="telefono"><g:message code="usuario.telefono.label" default="Telefono" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'telefono', 'errors')}">
                                    <g:textField class="textField" name="telefono" value="${usuarioInstance?.telefono}" />
                                </td>
                            </tr>                        
                            <tr class="prop">
                                <td valign="top" class="descripcion">
                                    <label for="comentarios"><g:message code="movimiento.comentario" default="Comentarios" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'calendario', 'errors')}">
                                    <g:textArea class="textField" name="comentarios" cols="40" rows="5" value="${usuarioInstance?.comentarios}" />
                                </td>
                            </tr>
                        

                                                                        
                        </tbody>
                    </table>
                </div>
            </g:form>
        </div>
    </body>
</html>
