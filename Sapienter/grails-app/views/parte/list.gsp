
<%@ page import="sapienter.Parte" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'parte.label', default: 'Parte')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'parte.id.label', default: 'Id')}" />
                        
                            <th><g:message code="parte.tipo.label" default="Tipo" /></th>
                        
                            <g:sortableColumn property="apellido" title="${message(code: 'parte.apellido.label', default: 'Apellido')}" />
                        
                            <g:sortableColumn property="nombre" title="${message(code: 'parte.nombre.label', default: 'Nombre')}" />
                        
                            <th><g:message code="parte.persona.label" default="Persona" /></th>
                        
                            <th><g:message code="parte.proceso.label" default="Proceso" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${parteInstanceList}" status="i" var="parteInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${parteInstance.id}">${fieldValue(bean: parteInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: parteInstance, field: "tipo")}</td>
                        
                            <td>${fieldValue(bean: parteInstance, field: "apellido")}</td>
                        
                            <td>${fieldValue(bean: parteInstance, field: "nombre")}</td>
                        
                            <td>${fieldValue(bean: parteInstance, field: "persona")}</td>
                        
                            <td>${fieldValue(bean: parteInstance, field: "proceso")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${parteInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
