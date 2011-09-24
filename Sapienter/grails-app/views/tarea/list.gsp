
<%@ page import="sapienter.Tarea" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'tarea.label', default: 'Tarea')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'tarea.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="fechaInicio" title="${message(code: 'tarea.fechaInicio.label', default: 'Fecha Inicio')}" />
                        
                            <g:sortableColumn property="fechaFin" title="${message(code: 'tarea.fechaFin.label', default: 'Fecha Fin')}" />
                        
                            <g:sortableColumn property="observacion" title="${message(code: 'tarea.observacion.label', default: 'Observacion')}" />
                        
                            <th><g:message code="tarea.calendario.label" default="Calendario" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${tareaInstanceList}" status="i" var="tareaInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${tareaInstance.id}">${fieldValue(bean: tareaInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: tareaInstance, field: "fechaInicio")}</td>
                        
                            <td>${fieldValue(bean: tareaInstance, field: "fechaFin")}</td>
                        
                            <td>${fieldValue(bean: tareaInstance, field: "observacion")}</td>
                        
                            <td>${fieldValue(bean: tareaInstance, field: "calendario")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${tareaInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
