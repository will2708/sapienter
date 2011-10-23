
<%@ page import="sapienter.EnlaceUtil" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'enlaceUtil.label', default: 'EnlaceUtil')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
    	<div>
        <div class="buttonSubMenu">
            <span><g:link class="create" action="create"><g:message code="sapienter.crear" args="[entityName]" /></g:link></span>
        </div>
        </div>
        <div class="body">
            <h1>Enlaces &Uacutetiles</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
	        	<div class="margin">
	           	 <g:form>
		       		<div class="buttonNewObjects">
						<g:textField class="find_text" name="q" value="${params.q}" />
						<g:submitButton class="find" name="list" value="Buscar" />
					</div>		
			   	</g:form>
			   	</div>             
                <table class="tabla">
                    <thead>
                        <tr>
                            <g:sortableColumn property="id" title="${message(code: 'enlaceUtil.id', default: 'Id')}" />
                            <g:sortableColumn property="descripcion" title="${message(code: 'proceso.descripcion', default: 'Descripcion')}" />
                            <g:sortableColumn property="direccion" title="${message(code: 'enlaceUtil.enlace', default: 'Direccion')}" />
							<g:sortableColumn property="ultimoUsuario" title="${message(code: 'enlaceUtil.ultimoUsuario', default: 'Ultimo Usuario')}" />
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${enlaceUtilInstanceList}" status="i" var="enlaceUtilInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td><g:link action="show" id="${enlaceUtilInstance.id}">${fieldValue(bean: enlaceUtilInstance, field: "id")}</g:link></td>
                            <td>${fieldValue(bean: enlaceUtilInstance, field: "descripcion")}</td>
                            <td>${fieldValue(bean: enlaceUtilInstance, field: "direccion")}</td>
                            <td>${fieldValue(bean: enlaceUtilInstance, field: "ultimoUsuario")}</td>                            
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
