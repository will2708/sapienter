

<%@ page import="sapienter.Categoria" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'categoria.label', default: 'Categoria')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="buttonSubMenu">            
            <span><g:link class="list" action="list"><g:message code="sapienter.categoria" args="[entityName]" /></g:link></span>
        </div>
        <div class="buttonSubMenu">
            <span><g:link class="create" action="create"><g:message code="sapienter.crear" args="[entityName]" /></g:link></span>
        </div>
        <g:form>
           <g:hiddenField name="id" value="${categoriaInstance?.id}" />
           <g:hiddenField name="version" value="${categoriaInstance?.version}" />
          	<div class="buttonForm">
               <span><g:actionSubmit class="delete" action="delete" value="${message(code: 'sapienter.borrar', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
            </div>
         </g:form>
        <div class="body">
            <h1><g:message code="sapienter.categoria" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${categoriaInstance}">
            <div class="errors">
                <g:renderErrors bean="${categoriaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${categoriaInstance?.id}" />
                <g:hiddenField name="version" value="${categoriaInstance?.version}" />
                <div class="dialog">
                <div class="margin">
                	<div class="buttonNewObjects">
						<span><g:actionSubmit class="save" action="update" value="${message(code: 'sapienter.guardar', default: 'Update')}" /></span>
                	</div>
                	<div class="buttonNewObjects">
                    	<span><g:actionSubmit class="create" action="crearSubCategoria" value="${message(code: 'sapienter.crearSubCategoria', default: 'Update')}" /></span>
                	</div>   
               	</div>
                    <table class="tabla_edit">
                        <tbody>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nombreCategoria"><g:message code="proceso.categoria" default="Nombre Categoria" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: categoriaInstance, field: 'nombreCategoria', 'errors')}">
                                    <g:textField class="textField" name="nombreCategoria" value="${categoriaInstance?.nombreCategoria}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="subCategorias"><g:message code="proceso.subCategorias" default="Sub Categorias" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: categoriaInstance, field: 'subCategorias', 'errors')}">
									<ul>
									<g:each in="${categoriaInstance?.subCategorias?}" var="s">
									    <li><g:link controller="subcategoria" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
									</g:each>
									</ul>
									<g:link controller="subcategoria" action="create" params="['categoria.id': categoriaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'subcategoria.label', default: 'Subcategoria')])}</g:link>
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
            </g:form>
        </div>
    </body>
</html>
