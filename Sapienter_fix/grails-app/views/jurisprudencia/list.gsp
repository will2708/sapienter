
<%@ page import="sapienter.Jurisprudencia" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'jurisprudencia.label', default: 'Jurisprudencia')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'jurisprudencia.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="descripcion" title="${message(code: 'jurisprudencia.descripcion.label', default: 'Descripcion')}" />
                        
                            <g:sortableColumn property="fuero" title="${message(code: 'jurisprudencia.fuero.label', default: 'Fuero')}" />
                        
                            <g:sortableColumn property="origen" title="${message(code: 'jurisprudencia.origen.label', default: 'Origen')}" />
                        
                            <g:sortableColumn property="sitio" title="${message(code: 'jurisprudencia.sitio.label', default: 'Sitio')}" />
                        
                            <g:sortableColumn property="jurisprudencia" title="${message(code: 'jurisprudencia.jurisprudencia.label', default: 'Jurisprudencia')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${jurisprudenciaInstanceList}" status="i" var="jurisprudenciaInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${jurisprudenciaInstance.id}">${fieldValue(bean: jurisprudenciaInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: jurisprudenciaInstance, field: "descripcion")}</td>
                        
                            <td>${fieldValue(bean: jurisprudenciaInstance, field: "fuero")}</td>
                        
                            <td>${fieldValue(bean: jurisprudenciaInstance, field: "origen")}</td>
                        
                            <td>${fieldValue(bean: jurisprudenciaInstance, field: "sitio")}</td>
                        
                            <td>${fieldValue(bean: jurisprudenciaInstance, field: "jurisprudencia")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${jurisprudenciaInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
