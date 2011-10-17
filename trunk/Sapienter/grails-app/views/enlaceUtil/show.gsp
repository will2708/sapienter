
<%@ page import="sapienter.EnlaceUtil" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'enlaceUtil.label', default: 'EnlaceUtil')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
    	<div>
	        <div class="buttonSubMenu">
	            <span><g:link class="create" action="create"><g:message code="sapienter.crear" args="[entityName]" /></g:link></span>
	        </div>
           <g:form>
           <g:hiddenField name="id" value="${documentoInstance?.id}" />
           		<div class="buttonForm">
           			<span ><g:actionSubmit class="edit" action="edit" value="${message(code: 'sapienter.modificar', default: 'Edit')}" /></span>
           		</div>
           		<div class="buttonForm">
                	<span><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
        <div class="body">
            <h1>Enlace</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table class="tabla">
                    <tbody>                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="proceso.descripcions" default="Descripcion" /></td>
                            <td valign="top" class="value">${fieldValue(bean: enlaceUtilInstance, field: "descripcion")}</td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="enlaceUtil.enalace" default="Direccion" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: enlaceUtilInstance, field: "direccion")}</td>
                            
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="enlaceUtil.ultimoUsuario" default="Ultimo Usuario" /></td>
                            
                            <td valign="top" class="value"><g:link controller="usuario" action="show" id="${enlaceUtilInstance?.ultimoUsuario?.id}">${enlaceUtilInstance?.ultimoUsuario?.encodeAsHTML()}</g:link></td>
                            
                        </tr>                        
                    
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
