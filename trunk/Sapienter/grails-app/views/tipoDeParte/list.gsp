
<%@ page import="sapienter.TipoDeParte" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'tipoDeParte.label', default: 'TipoDeParte')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'tipoDeParte.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="descripcion" title="${message(code: 'tipoDeParte.descripcion.label', default: 'Descripcion')}" />
                        
                            <th><g:message code="tipoDeParte.estudio.label" default="Estudio" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${tipoDeParteInstanceList}" status="i" var="tipoDeParteInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${tipoDeParteInstance.id}">${fieldValue(bean: tipoDeParteInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: tipoDeParteInstance, field: "descripcion")}</td>
                        
                            <td>${fieldValue(bean: tipoDeParteInstance, field: "estudio")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${tipoDeParteInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
