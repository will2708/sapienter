

<%@ page import="sapienter.Subcategoria" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'subcategoria.label', default: 'Subcategoria')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
    	<div class="SubMenu">
   		<g:form>
   		<g:hiddenField name="id" value="${subcategoriaInstance?.id}" />
        <g:hiddenField name="version" value="${subcategoriaInstance?.version}" />
  	    <div class="buttonForm">
        	<span><g:actionSubmit class="delete" action="delete" value="${message(code: 'sapienter.borrar', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
        </div>
        </g:form>
        </div>
        <div class="body">
            <h1><g:message code="sapienter.subcategoria" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${subcategoriaInstance}">
            <div class="errors">
                <g:renderErrors bean="${subcategoriaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${subcategoriaInstance?.id}" />
                <g:hiddenField name="version" value="${subcategoriaInstance?.version}" />
                <div class="dialog">
                <div class="margin">
                	<div class="buttonNewObjects">
                    <span><g:actionSubmit class="save" action="update" value="${message(code: 'sapienter.guardar', default: 'Update')}" /></span>
                	</div>                   	
                </div>
                    <table class="tabla_edit">
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="categoria"><g:message code="proceso.categoria" default="Categoria" /></label>
                                </td>
                                     <td valign="top" class="value"><g:link controller="categoria" action="show" id="${subcategoriaInstance?.categoria?.id}">${subcategoriaInstance?.categoria?.encodeAsHTML()}</g:link></td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="subTipoCategoria"><g:message code="subcategoria.tipo" default="Sub Tipo Categoria" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: subcategoriaInstance, field: 'subTipoCategoria', 'errors')}">
                                    <g:textField class="textField" name="subTipoCategoria" value="${subcategoriaInstance?.subTipoCategoria}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>

            </g:form>
        </div>
    </body>
</html>
