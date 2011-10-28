
<%@ page import="sapienter.Estudio" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'estudio.label', default: 'Estudio')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
    	<div>
	        <div class="buttonSubMenu">
	            <span><g:link class="create" action="create"><g:message code="sapienter.crear" args="[entityName]" /></g:link></span>
	        </div>
        </div> 
        <div class="body">
            <h1>Estudio jur&iacutedico</h1>
            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table class="tabla">
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'sapienter.id', default: 'Id')}" />
                        
                            <g:sortableColumn property="razonSocial" title="${message(code: 'persona.razonSocial', default: 'Razon Social')}" />
                        
                            <g:sortableColumn property="domicilioFiscal" title="${message(code: 'estudio.domicilioFiscal', default: 'Domicilio Fiscal')}" />
                        
                            <g:sortableColumn property="cuit" title="${message(code: 'persona.cuit', default: 'Cuit')}" />
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${estudioInstanceList}" status="i" var="estudioInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${estudioInstance.id}">${fieldValue(bean: estudioInstance, field: "id")}</g:link></td>
                        
                            <td><g:link action="show" id="${estudioInstance.id}">${fieldValue(bean: estudioInstance, field: "razonSocial")}</g:link></td>
                        
                            <td>${fieldValue(bean: estudioInstance, field: "domicilioFiscal")}</td>
                        
                            <td>${fieldValue(bean: estudioInstance, field: "cuit")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
