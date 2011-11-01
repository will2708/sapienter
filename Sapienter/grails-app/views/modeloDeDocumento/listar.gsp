

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
        	<h2>Haga click sobre el modelo que desea utilizar<br></h2>
            <g:hiddenField name="proceso" value="${proceso}"/>
            <div class="list">
                <table class="tabla_popup">
                    <thead>
                        <tr>
                            <g:sortableColumn property="nombre" title="${message(code: 'documento.nombre', default: 'Nombre')}" />	
                            <g:sortableColumn property="descripcion" title="${message(code: 'proceso.descripcion', default: 'Descripcion')}" />
                            <g:sortableColumn property="categoria" title="${message(code: 'proceso.categoria', default: 'Categoria')}" />
                            <g:sortableColumn property="subCategoria" title="${message(code: 'proceso.subCategoria', default: 'Sub Categoria')}" />
                            <g:sortableColumn property="estado" title="${message(code: 'proceso.estado', default: 'Estado')}" />
                        	<!-- <g:sortableColumn property="usar" title=" " /> -->
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${modeloDeDocumentoInstanceList}" status="i" var="modeloDeDocumentoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">                        
                            <td><modalbox:createLink controller="modeloDeDocumento" action="usar" id="${modeloDeDocumentoInstance.id}  ${proceso}" title="Variables" width="500">${fieldValue(bean: modeloDeDocumentoInstance, field: "nombre")}</modalbox:createLink></td>
                            <td><modalbox:createLink controller="modeloDeDocumento" action="usar" id="${modeloDeDocumentoInstance.id}  ${proceso}" title="Variables" width="500">${fieldValue(bean: modeloDeDocumentoInstance, field: "descripcion")}</modalbox:createLink></td>
                            <td><modalbox:createLink controller="modeloDeDocumento" action="usar" id="${modeloDeDocumentoInstance.id}  ${proceso}" title="Variables" width="500">${fieldValue(bean: modeloDeDocumentoInstance, field: "categoria")}</modalbox:createLink></td>
                            <td><modalbox:createLink controller="modeloDeDocumento" action="usar" id="${modeloDeDocumentoInstance.id}  ${proceso}" title="Variables" width="500">${fieldValue(bean: modeloDeDocumentoInstance, field: "subCategoria")}</modalbox:createLink></td>
                            <td><modalbox:createLink controller="modeloDeDocumento" action="usar" id="${modeloDeDocumentoInstance.id}  ${proceso}" title="Variables" width="500">${fieldValue(bean: modeloDeDocumentoInstance, field: "estado")}</modalbox:createLink></td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <!-- <div class="paginateButtons">
                <g:paginate total="${modeloDeDocumentoInstanceTotal}" />
            </div>-->
        </div>

    </body>
</html>
