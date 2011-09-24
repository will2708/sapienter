
<%@ page import="sapienter.Movimiento" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'movimiento.label', default: 'Movimiento')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'movimiento.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="descripcion" title="${message(code: 'movimiento.descripcion.label', default: 'Descripcion')}" />
                        
                            <g:sortableColumn property="tipoDeMovimiento" title="${message(code: 'movimiento.tipoDeMovimiento.label', default: 'Tipo De Movimiento')}" />
                        
                            <g:sortableColumn property="estado" title="${message(code: 'movimiento.estado.label', default: 'Estado')}" />
                        
                            <g:sortableColumn property="comentario" title="${message(code: 'movimiento.comentario.label', default: 'Comentario')}" />
                        
                            <g:sortableColumn property="fechaDeCreacion" title="${message(code: 'movimiento.fechaDeCreacion.label', default: 'Fecha De Creacion')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${movimientoInstanceList}" status="i" var="movimientoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${movimientoInstance.id}">${fieldValue(bean: movimientoInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: movimientoInstance, field: "descripcion")}</td>
                        
                            <td>${fieldValue(bean: movimientoInstance, field: "tipoDeMovimiento")}</td>
                        
                            <td>${fieldValue(bean: movimientoInstance, field: "estado")}</td>
                        
                            <td>${fieldValue(bean: movimientoInstance, field: "comentario")}</td>
                        
                            <td><g:formatDate date="${movimientoInstance.fechaDeCreacion}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${movimientoInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
