
<%@ page import="sapienter.Notifica" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'notifica.label', default: 'Notifica')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'notifica.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="descripcion" title="${message(code: 'notifica.descripcion.label', default: 'Descripcion')}" />
                        
                            <g:sortableColumn property="domicilio" title="${message(code: 'notifica.domicilio.label', default: 'Domicilio')}" />
                        
                            <g:sortableColumn property="ciudad" title="${message(code: 'notifica.ciudad.label', default: 'Ciudad')}" />
                        
                            <g:sortableColumn property="telefono" title="${message(code: 'notifica.telefono.label', default: 'Telefono')}" />
                        
                            <g:sortableColumn property="email" title="${message(code: 'notifica.email.label', default: 'Email')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${notificaInstanceList}" status="i" var="notificaInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${notificaInstance.id}">${fieldValue(bean: notificaInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: notificaInstance, field: "descripcion")}</td>
                        
                            <td>${fieldValue(bean: notificaInstance, field: "domicilio")}</td>
                        
                            <td>${fieldValue(bean: notificaInstance, field: "ciudad")}</td>
                        
                            <td>${fieldValue(bean: notificaInstance, field: "telefono")}</td>
                        
                            <td>${fieldValue(bean: notificaInstance, field: "email")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${notificaInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
