
<%@ page import="sapienter.Estudio" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'estudio.label', default: 'Estudio')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'estudio.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="razonSocial" title="${message(code: 'estudio.razonSocial.label', default: 'Razon Social')}" />
                        
                            <g:sortableColumn property="domicilioFiscal" title="${message(code: 'estudio.domicilioFiscal.label', default: 'Domicilio Fiscal')}" />
                        
                            <g:sortableColumn property="cuit" title="${message(code: 'estudio.cuit.label', default: 'Cuit')}" />
                        
                            <th><g:message code="estudio.modelosDeDocumento.label" default="Modelos De Documento" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${estudioInstanceList}" status="i" var="estudioInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${estudioInstance.id}">${fieldValue(bean: estudioInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: estudioInstance, field: "razonSocial")}</td>
                        
                            <td>${fieldValue(bean: estudioInstance, field: "domicilioFiscal")}</td>
                        
                            <td>${fieldValue(bean: estudioInstance, field: "cuit")}</td>
                        
                            <td>${fieldValue(bean: estudioInstance, field: "modelosDeDocumento")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${estudioInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
