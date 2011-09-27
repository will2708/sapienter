

<%@ page import="sapienter.Usuario" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
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
            <g:hasErrors bean="${usuarioInstance}">
            <div class="errors">
                <g:renderErrors bean="${usuarioInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="idUsuario"><g:message code="usuario.idUsuario.label" default="Id Usuario" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'idUsuario', 'errors')}">
                                    <g:textField name="idUsuario" value="${usuarioInstance?.idUsuario}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nombre"><g:message code="usuario.nombre.label" default="Nombre" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'nombre', 'errors')}">
                                    <g:textField name="nombre" value="${usuarioInstance?.nombre}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="apellido"><g:message code="usuario.apellido.label" default="Apellido" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'apellido', 'errors')}">
                                    <g:textField name="apellido" value="${usuarioInstance?.apellido}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="comentarios"><g:message code="usuario.comentarios.label" default="Comentarios" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'comentarios', 'errors')}">
                                    <g:textArea name="comentarios" cols="40" rows="5" value="${usuarioInstance?.comentarios}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="contrasena"><g:message code="usuario.contrasena.label" default="Contrasena" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'contrasena', 'errors')}">
                                    <g:passwordField name="contrasena" value="${usuarioInstance?.contrasena}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="correoElectronico"><g:message code="usuario.correoElectronico.label" default="Correo Electronico" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'correoElectronico', 'errors')}">
                                    <g:select name="correoElectronico.id" from="${sapienter.CorreoElectronico.list()}" optionKey="id" value="${usuarioInstance?.correoElectronico?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="estadoUsuario"><g:message code="usuario.estadoUsuario.label" default="Estado Usuario" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'estadoUsuario', 'errors')}">
                                    <g:select name="estadoUsuario" from="${usuarioInstance.constraints.estadoUsuario.inList}" value="${usuarioInstance?.estadoUsuario}" valueMessagePrefix="usuario.estadoUsuario"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="telefono"><g:message code="usuario.telefono.label" default="Telefono" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'telefono', 'errors')}">
                                    <g:textField name="telefono" value="${usuarioInstance?.telefono}" />
                                </td>
                            </tr>
                        <!--<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="usuarioCreacion"><g:message code="usuario.usuarioCreacion.label" default="Usuario Creacion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'usuarioCreacion', 'errors')}">
                                    <g:select name="usuarioCreacion.id" from="${sapienter.Usuario.list()}" optionKey="id" value="${usuarioInstance?.usuarioCreacion?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="usuarioModificacion"><g:message code="usuario.usuarioModificacion.label" default="Usuario Modificacion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'usuarioModificacion', 'errors')}">
                                    <g:select name="usuarioModificacion.id" from="${sapienter.Usuario.list()}" optionKey="id" value="${usuarioInstance?.usuarioModificacion?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="estudio"><g:message code="usuario.estudio.label" default="Estudio" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'estudio', 'errors')}">
                                    <g:select name="estudio.id" from="${sapienter.Estudio.list()}" optionKey="id" value="${usuarioInstance?.estudio?.id}"  />
                                </td>
                            </tr> -->
                        
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
