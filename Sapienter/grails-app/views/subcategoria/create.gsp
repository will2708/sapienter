

<%@ page import="sapienter.Subcategoria" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'subcategoria.label', default: 'Subcategoria')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
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
            <g:form action="save" >
                <g:hiddenField name="id" value="${subcategoria?.id}" />
                <div class="dialog">
                   <div class="margin">
                   <div class="buttonNewObjects">
                   	 <span><g:submitButton name="create" class="save" value="${message(code: 'sapienter.guardar', default: 'Create')}" /></span>
                	</div>
                	</div>
                    <table class="tabla_edit">
                        <tbody>                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="categoria"><g:message code="proceso.subcategoria" default="Categoria" /></label>
                                </td>
                                    <td valign="top" class="value"><g:link controller="categoria" action="show" id="${subcategoriaInstance?.categoria?.id}">${subcategoriaInstance?.categoria?.encodeAsHTML()}</g:link></td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="subTipoCategoria"><g:message code="proceso.subcategoria" default="Sub Tipo Categoria" /></label>
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
