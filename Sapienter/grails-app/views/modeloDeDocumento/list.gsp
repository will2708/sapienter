
<%@ page import="sapienter.ModeloDeDocumento" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'modeloDeDocumento.label', default: 'ModeloDeDocumento')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
    	<div>
        <div class="buttonSubMenu">
            <span><g:link class="create" action="create"><g:message code="sapienter.crear" args="[entityName]" /></g:link></span>
        </div>
        </div>
        <div class="body">
            <h1>Modelos de Documentos</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <!-- <div class="list">-->
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
                            <g:sortableColumn property="id" title="${message(code: 'modeloDeDocumento.id.label', default: 'Id')}" />
                            <g:sortableColumn property="nombre" title="${message(code: 'modeloDeDocumento.nombre.label', default: 'Nombre')}" />
                            <g:sortableColumn property="descripcion" title="${message(code: 'modeloDeDocumento.descripcion.label', default: 'Descripcion')}" />
                            <g:sortableColumn property="categoria" title="${message(code: 'modeloDeDocumento.categoria.label', default: 'Categoria')}" />
                            <g:sortableColumn property="subCategoria" title="${message(code: 'modeloDeDocumento.subCategoria.label', default: 'Sub Categoria')}" />
                            <g:sortableColumn property="estado" title="${message(code: 'modeloDeDocumento.estado.label', default: 'Estado')}" />
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${modeloDeDocumentoInstanceList}" status="i" var="modeloDeDocumentoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${modeloDeDocumentoInstance.id}">${fieldValue(bean: modeloDeDocumentoInstance, field: "id")}</g:link></td>
                        
                            <td><g:link action="show" id="${modeloDeDocumentoInstance.id}">${fieldValue(bean: modeloDeDocumentoInstance, field: "nombre")}</g:link></td>
                        
                            <td>${fieldValue(bean: modeloDeDocumentoInstance, field: "descripcion")}</td>
                        
                            <td>${fieldValue(bean: modeloDeDocumentoInstance, field: "categoria")}</td>
                        
                            <td>${fieldValue(bean: modeloDeDocumentoInstance, field: "subCategoria")}</td>
                        
                            <td>${fieldValue(bean: modeloDeDocumentoInstance, field: "estado")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
