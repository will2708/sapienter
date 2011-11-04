

<%@ page import="sapienter.Categoria" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'categoria.label', default: 'Categoria')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
    	<div class="SubMenu">
        <div class="buttonSubMenu">
            <span><g:link class="list" action="list"><g:message code="sapienter.categoria" args="[entityName]" /></g:link></span>
        </div>
        </div>
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
            <g:form action="save" >
                <div class="dialog">
                <div class="margin">
	                <div class="buttonNewObjects">
	                    <span><g:submitButton name="create" class="save" value="${message(code: 'sapienter.crear', default: 'Create')}" /></span>
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
                        
                        </tbody>
                    </table>
                </div>
            </g:form>
        </div>
    </body>
</html>
