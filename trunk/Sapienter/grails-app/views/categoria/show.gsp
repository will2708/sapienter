
<%@ page import="sapienter.Categoria" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'categoria.label', default: 'Categoria')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
    	<div class="SubMenu">
        <div class="buttonSubMenu">
            <span><g:link class="list" action="list"><g:message code="sapienter.categoria" args="[entityName]" /></g:link></span>
		</div>            
		<div class="buttonSubMenu">
            <span><g:link class="create" action="create"><g:message code="sapienter.crear" args="[entityName]" /></g:link></span>
        </div>
        <g:form>
           <g:hiddenField name="id" value="${categoriaInstance?.id}" />
           	<div class="buttonForm">
               <span><g:actionSubmit class="edit" action="edit" value="${message(code: 'sapienter.modificar', default: 'Edit')}" /></span>
			</div>               
			<div class="buttonForm">
               <span><g:actionSubmit class="delete" action="delete" value="${message(code: 'sapienter.borrar', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
            </div>   
        </g:form>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
            	<g:form>
           		<g:hiddenField name="id" value="${categoriaInstance?.id}" />
            	<div class="margin">
                	<div class="buttonNewObjects">
                    <span><g:actionSubmit class="create" action="crearSubCategoria" value="${message(code: 'sapienter.crearSubCategoria', default: 'Update')}" /></span>
                	</div>   
                </div>
                </g:form>
                <table class="tabla">
                    <tbody>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sapienter.id" default="Id" /></td>
                            <td valign="top" class="value">${fieldValue(bean: categoriaInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="proceso.categoria" default="Nombre Categoria" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: categoriaInstance, field: "nombreCategoria")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="proceso.subcategoria" default="Sub Categorias" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${categoriaInstance.subCategorias}" var="s">
                                    <li><g:link controller="subcategoria" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
