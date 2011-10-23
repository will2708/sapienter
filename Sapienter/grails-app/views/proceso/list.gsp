
<%@ page import="sapienter.Proceso" %>
<html>
<!--<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'proceso.label', default: 'Proceso')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head> -->
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
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
                            <g:sortableColumn property="id" title="${message(code: 'proceso.id.label', default: 'Id')}" />
							<g:sortableColumn property="caratula" title="${message(code: 'proceso.caratula', default: 'Caratula')}" />                            
                            <g:sortableColumn property="persona" title="${message(code: 'persona.persona', default: 'Persona')}" />
							<g:sortableColumn property="categoria" title="${message(code: 'proceso.categoria', default: 'Categoria')}" />                            
                            <g:sortableColumn property="subcategoria" title="${message(code: 'proceso.subCategoria', default: 'Sub Categoria')}" />
                            <g:sortableColumn property="descripcion" title="${message(code: 'proceso.descripcion', default: 'Descripcion')}" />
                            <g:sortableColumn property="estado" title="${message(code: 'proceso.estado', default: 'Estado')}" />
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${procesoInstanceList}" status="i" var="procesoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td><g:link action="show" id="${procesoInstance.id}">${fieldValue(bean: procesoInstance, field: "id")}</g:link></td>
                            <td><g:link action="show" id="${procesoInstance.id}">${fieldValue(bean: procesoInstance, field: "caratula")}</g:link></td>
                            <td><g:link controller="persona" action="show" id="${procesoInstance?.persona?.id}">${procesoInstance?.persona?.encodeAsHTML()}</g:link></td>
                            <td>${fieldValue(bean: procesoInstance, field: "categoria")}</td>                        
                            <td>${fieldValue(bean: procesoInstance, field: "subCategoria")}</td>                        
                            <td>${fieldValue(bean: procesoInstance, field: "descripcion")}</td>                        
                            <td>${fieldValue(bean: procesoInstance, field: "estado")}</td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
