
<%@ page import="sapienter.PersonaJuridica" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'personaJuridica.label', default: 'PersonaJuridica')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'personaJuridica.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="razonSocial" title="${message(code: 'personaJuridica.razonSocial.label', default: 'Razon Social')}" />
                        
                            <g:sortableColumn property="cuit" title="${message(code: 'personaJuridica.cuit.label', default: 'Cuit')}" />
                        
                            <g:sortableColumn property="fechaDeInicioActividades" title="${message(code: 'personaJuridica.fechaDeInicioActividades.label', default: 'Fecha De Inicio Actividades')}" />
                        
                            <g:sortableColumn property="telefonoDeContacto" title="${message(code: 'personaJuridica.telefonoDeContacto.label', default: 'Telefono De Contacto')}" />
                        
                            <g:sortableColumn property="email" title="${message(code: 'personaJuridica.email.label', default: 'Email')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${personaJuridicaInstanceList}" status="i" var="personaJuridicaInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${personaJuridicaInstance.id}">${fieldValue(bean: personaJuridicaInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: personaJuridicaInstance, field: "razonSocial")}</td>
                        
                            <td>${fieldValue(bean: personaJuridicaInstance, field: "cuit")}</td>
                        
                            <td><g:formatDate date="${personaJuridicaInstance.fechaDeInicioActividades}" /></td>
                        
                            <td>${fieldValue(bean: personaJuridicaInstance, field: "telefonoDeContacto")}</td>
                        
                            <td>${fieldValue(bean: personaJuridicaInstance, field: "email")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${personaJuridicaInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
