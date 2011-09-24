<%@ page import="sapienter.Persona" %>
<%@ page import="sapienter.PersonaFisica" %>
<%@ page import="sapienter.PersonaJuridica" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'persona.label', default: 'Persona')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create_mod"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'persona.id.label', default: 'Id')}" />
                            <g:sortableColumn property="Nombre" title="${message(code: 'personaJuridica.razonSocial.label', default: 'Nombre')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${personaFisicaList}" status="i" var="personaFisicaInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link controller= "persona" action="show" id="${personaFisicaInstance.id}">${fieldValue(bean: personaFisicaInstance, field: "id")}</g:link></td>
                            <td>${fieldValue(bean: personaFisicaInstance, field: "nombre")}</td>
                        
                        </tr>
                    </g:each>
					<g:each in="${personaJuridicaList}" status="i" var="personaJuridicaInstance">
					<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
					
						<td><g:link action="show" id="${personaJuridicaInstance.id}">${fieldValue(bean: personaJuridicaInstance, field: "id")}</g:link></td>
						<td>${fieldValue(bean: personaJuridicaInstance, field: "razonSocial")}</td>
					
					</tr>
				</g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${personaInstanceTotal}" /> 
            </div>
        </div>
    </body>
</html>
