
<%@ page import="sapienter.Proceso" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'proceso.label', default: 'Proceso')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'proceso.id.label', default: 'Id')}" />
                        
                            <th><g:message code="proceso.categoria.label" default="Categoria" /></th>
                        
                            <th><g:message code="proceso.subCategoria.label" default="Sub Categoria" /></th>
                        
                            <g:sortableColumn property="caratula" title="${message(code: 'proceso.caratula.label', default: 'Caratula')}" />
                        
                            <g:sortableColumn property="descripcion" title="${message(code: 'proceso.descripcion.label', default: 'Descripcion')}" />
                        
                            <g:sortableColumn property="estado" title="${message(code: 'proceso.estado.label', default: 'Estado')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${procesoInstanceList}" status="i" var="procesoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${procesoInstance.id}">${fieldValue(bean: procesoInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: procesoInstance, field: "categoria")}</td>
                        
                            <td>${fieldValue(bean: procesoInstance, field: "subCategoria")}</td>
                        
                            <td>${fieldValue(bean: procesoInstance, field: "caratula")}</td>
                        
                            <td>${fieldValue(bean: procesoInstance, field: "descripcion")}</td>
                        
                            <td>${fieldValue(bean: procesoInstance, field: "estado")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${procesoInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
