
<%@ page import="sapienter.Usuario" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
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
                            <td valign="top" class="name"><g:message code="usuario.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.idUsuario.label" default="Id Usuario" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "idUsuario")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.nombre.label" default="Nombre" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "nombre")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.apellido.label" default="Apellido" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "apellido")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.calendario.label" default="Calendario" /></td>
                            
                            <td valign="top" class="value"><g:link controller="calendario" action="show" id="${usuarioInstance?.calendario?.id}">${usuarioInstance?.calendario?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.comentarios.label" default="Comentarios" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "comentarios")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.contrasena.label" default="Contrasena" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "contrasena")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.correoElectronico.label" default="Correo Electronico" /></td>
                            
                            <td valign="top" class="value"><g:link controller="correoElectronico" action="show" id="${usuarioInstance?.correoElectronico?.id}">${usuarioInstance?.correoElectronico?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.estadoUsuario.label" default="Estado Usuario" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "estadoUsuario")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.dateCreated.label" default="Date Created" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${usuarioInstance?.dateCreated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.lastUpdated.label" default="Last Updated" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${usuarioInstance?.lastUpdated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.rol.label" default="Rol" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${usuarioInstance.rol}" var="r">
                                    <li><g:link controller="rol" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.telefono.label" default="Telefono" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "telefono")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.usuarioCreacion.label" default="Usuario Creacion" /></td>
                            
                            <td valign="top" class="value"><g:link controller="usuario" action="show" id="${usuarioInstance?.usuarioCreacion?.id}">${usuarioInstance?.usuarioCreacion?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.usuarioModificacion.label" default="Usuario Modificacion" /></td>
                            
                            <td valign="top" class="value"><g:link controller="usuario" action="show" id="${usuarioInstance?.usuarioModificacion?.id}">${usuarioInstance?.usuarioModificacion?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.estudio.label" default="Estudio" /></td>
                            
                            <td valign="top" class="value"><g:link controller="estudio" action="show" id="${usuarioInstance?.estudio?.id}">${usuarioInstance?.estudio?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${usuarioInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
