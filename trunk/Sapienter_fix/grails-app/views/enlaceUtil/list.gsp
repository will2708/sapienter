
<%@ page import="sapienter.EnlaceUtil" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'enlaceUtil.label', default: 'EnlaceUtil')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'enlaceUtil.id.label', default: 'Id')}" />
                        
                            <th><g:message code="enlaceUtil.ultimoUsuario.label" default="Ultimo Usuario" /></th>
                        
                            <g:sortableColumn property="descripcion" title="${message(code: 'enlaceUtil.descripcion.label', default: 'Descripcion')}" />
                        
                            <g:sortableColumn property="direccion" title="${message(code: 'enlaceUtil.direccion.label', default: 'Direccion')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${enlaceUtilInstanceList}" status="i" var="enlaceUtilInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${enlaceUtilInstance.id}">${fieldValue(bean: enlaceUtilInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: enlaceUtilInstance, field: "ultimoUsuario")}</td>
                        
                            <td>${fieldValue(bean: enlaceUtilInstance, field: "descripcion")}</td>
                        
                            <td>${fieldValue(bean: enlaceUtilInstance, field: "direccion")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${enlaceUtilInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
