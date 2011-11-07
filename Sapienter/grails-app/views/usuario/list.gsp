
<%@ page import="sapienter.Usuario" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
    	<div>
        <div class="buttonSubMenu">
            <span><g:link class="create" action="create"><g:message code="sapienter.crear" args="[entityName]" /></g:link></span>
        </div>
        </div>
        <div class="body">
            <h1>Usuarios</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
	        	<div class="margin">
	           	 <g:form>
		       		<div class="buttonNewObjects">
						<g:textField class="find_text" name="q" value="${params.q}" />
						<g:submitButton class="find" name="list" value="Buscar" />
					</div>		
			   	</g:form>
			   	</div>             
                <table class="tabla">
                    <thead>
                        <tr>
                            <g:sortableColumn property="id" title="${message(code: 'sapienter.id', default: 'Id')}" />
                            <g:sortableColumn property="username" title="${message(code: 'usuario.usuario', default: 'Username')}" />
                            <g:sortableColumn property="nombre" title="${message(code: 'persona.nombre', default: 'Username')}" />
                            <g:sortableColumn property="apellido" title="${message(code: 'persona.apellido', default: 'Username')}" />
                            <g:sortableColumn property="enabled" title="${message(code: 'usuario.habilitado', default: 'Enabled')}" />
                            <g:sortableColumn property="accountExpired" title="${message(code: 'usuario.cuentaVencida', default: 'Account Expired')}" />
                            <g:sortableColumn property="accountLocked" title="${message(code: 'usuario.cuentaBloqueada', default: 'Account Locked')}" />
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${usuarioInstanceList}" status="i" var="usuarioInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td><g:link action="show" id="${usuarioInstance.id}">${fieldValue(bean: usuarioInstance, field: "id")}</g:link></td>
                            <td><g:link action="show" id="${usuarioInstance.id}">${fieldValue(bean: usuarioInstance, field: "username")}</g:link></td>
                            <td><g:link action="show" id="${usuarioInstance.id}">${fieldValue(bean: usuarioInstance, field: "nombre")}</g:link></td>
                            <td><g:link action="show" id="${usuarioInstance.id}">${fieldValue(bean: usuarioInstance, field: "apellido")}</g:link></td>
                            <td><g:formatBoolean boolean="${usuarioInstance.enabled}" /></td>
                            <td><g:formatBoolean boolean="${usuarioInstance.accountExpired}" /></td>
                            <td><g:formatBoolean boolean="${usuarioInstance.accountLocked}" /></td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
