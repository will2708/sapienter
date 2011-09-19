

<%@ page import="sapienter.ModeloDeDocumento" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <g:set var="entityName" value="${message(code: 'modeloDeDocumento.label', default: 'ModeloDeDocumento')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <g:javascript library="application" />
        <modalbox:modalIncludes />

    </head>
    <body>
        <div class="body">
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="nombre" title="${message(code: 'modeloDeDocumento.nombre.label', default: 'Nombre')}" />
                        
                            <g:sortableColumn property="descripcion" title="${message(code: 'modeloDeDocumento.descripcion.label', default: 'Descripcion')}" />
                        
                            <g:sortableColumn property="categoria" title="${message(code: 'modeloDeDocumento.categoria.label', default: 'Categoria')}" />
                        
                            <g:sortableColumn property="subCategoria" title="${message(code: 'modeloDeDocumento.subCategoria.label', default: 'Sub Categoria')}" />
                        
                            <g:sortableColumn property="estado" title="${message(code: 'modeloDeDocumento.estado.label', default: 'Estado')}" />
                        
                        	<g:sortableColumn property="usar" title=" " />
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${modeloDeDocumentoInstanceList}" status="i" var="modeloDeDocumentoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td>${fieldValue(bean: modeloDeDocumentoInstance, field: "nombre")}</td>
                        
                            <td>${fieldValue(bean: modeloDeDocumentoInstance, field: "descripcion")}</td>
                        
                            <td>${fieldValue(bean: modeloDeDocumentoInstance, field: "categoria")}</td>
                        
                            <td>${fieldValue(bean: modeloDeDocumentoInstance, field: "subCategoria")}</td>
                        
                            <td>${fieldValue(bean: modeloDeDocumentoInstance, field: "estado")}</td>

							<td><modalbox:createLink controller="modeloDeDocumento" action="usar" id="${modeloDeDocumentoInstance.id}" title="Variables" width="500">Usar</modalbox:createLink></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${modeloDeDocumentoInstanceTotal}" />
            </div>
        </div>

    </body>
</html>
