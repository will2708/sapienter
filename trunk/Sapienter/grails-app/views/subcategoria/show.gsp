
<%@ page import="sapienter.Subcategoria" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'subcategoria.label', default: 'Subcategoria')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
    	<g:form>
    	<g:hiddenField name="id" value="${subcategoriaInstance?.id}" />
     	<div class="buttonForm">
                <span><g:actionSubmit class="edit" action="edit" value="${message(code: 'sapienter.modificar', default: 'Edit')}" /></span>
        </div>
        <div class="buttonForm">
           <span><g:actionSubmit class="delete" action="delete" value="${message(code: 'sapienter.borrar', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
        </div>
        </g:form>
        <div class="body">
            <h1><g:message code="sapienter.subcategoria" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table class="tabla">
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="proceso.id" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: subcategoriaInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="proceso.categoria" default="Categoria" /></td>
                            
                            <td valign="top" class="value"><g:link controller="categoria" action="show" id="${subcategoriaInstance?.categoria?.id}">${subcategoriaInstance?.categoria?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="proceso.subcategoria" default="Sub Tipo Categoria" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: subcategoriaInstance, field: "subTipoCategoria")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
