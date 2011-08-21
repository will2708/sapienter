
<%@ page import="sapienter.Gasto" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'gasto.label', default: 'Gasto')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'gasto.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="concepto" title="${message(code: 'gasto.concepto.label', default: 'Concepto')}" />
                        
                            <g:sortableColumn property="estado" title="${message(code: 'gasto.estado.label', default: 'Estado')}" />
                        
                            <g:sortableColumn property="fecha" title="${message(code: 'gasto.fecha.label', default: 'Fecha')}" />
                        
                            <g:sortableColumn property="moneda" title="${message(code: 'gasto.moneda.label', default: 'Moneda')}" />
                        
                            <g:sortableColumn property="monto" title="${message(code: 'gasto.monto.label', default: 'Monto')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${gastoInstanceList}" status="i" var="gastoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${gastoInstance.id}">${fieldValue(bean: gastoInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: gastoInstance, field: "concepto")}</td>
                        
                            <td>${fieldValue(bean: gastoInstance, field: "estado")}</td>
                        
                            <td><g:formatDate date="${gastoInstance.fecha}" /></td>
                        
                            <td>${fieldValue(bean: gastoInstance, field: "moneda")}</td>
                        
                            <td>${fieldValue(bean: gastoInstance, field: "monto")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${gastoInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
