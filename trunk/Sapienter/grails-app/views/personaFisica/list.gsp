
<%@ page import="sapienter.PersonaFisica" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'personaFisica.label', default: 'PersonaFisica')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'personaFisica.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="apellido" title="${message(code: 'personaFisica.apellido.label', default: 'Apellido')}" />
                        
                            <g:sortableColumn property="nombre" title="${message(code: 'personaFisica.nombre.label', default: 'Nombre')}" />
                        
                            <g:sortableColumn property="observaciones" title="${message(code: 'personaFisica.observaciones.label', default: 'Observaciones')}" />
                        
                            <th><g:message code="personaFisica.pais.label" default="Pais" /></th>
                        
                            <g:sortableColumn property="dni" title="${message(code: 'personaFisica.dni.label', default: 'Dni')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${personaFisicaInstanceList}" status="i" var="personaFisicaInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${personaFisicaInstance.id}">${fieldValue(bean: personaFisicaInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: personaFisicaInstance, field: "apellido")}</td>
                        
                            <td>${fieldValue(bean: personaFisicaInstance, field: "nombre")}</td>
                        
                            <td>${fieldValue(bean: personaFisicaInstance, field: "observaciones")}</td>
                        
                            <td>${fieldValue(bean: personaFisicaInstance, field: "pais")}</td>
                        
                            <td>${fieldValue(bean: personaFisicaInstance, field: "dni")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${personaFisicaInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
