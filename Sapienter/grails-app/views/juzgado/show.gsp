
<%@ page import="sapienter.Juzgado" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'juzgado.label', default: 'Juzgado')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    
    <body>          
    	<div class="SubMenu">
	        <div class="buttonSubMenu">
	            <span><g:link class="list" action="list"><g:message code="sapienter.juzgado" args="[entityName]" /></g:link></span>
	        </div>    	
	        <div class="buttonSubMenu">
	            <span><g:link class="create" action="create"><g:message code="sapienter.crear" args="[entityName]" /></g:link></span>
	        </div>
           <g:form>
           <g:hiddenField name="id" value="${juzgadoInstance?.id}" />
           		<div class="buttonForm">
           			<span ><g:actionSubmit class="edit" action="edit" value="${message(code: 'sapienter.modificar', default: 'Edit')}" /></span>
           		</div>
           		<div class="buttonForm">
                	<span><g:actionSubmit class="delete" action="delete" value="${message(code: 'sapienter.borrar', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
		</div>  
        <div class="body">
            <h1>Juzgado</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table class="tabla">
                    <tbody>
                    
<!--                          <tr class="prop">
                            <td valign="top" class="name"><g:message code="juzgado.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: juzgadoInstance, field: "id")}</td>
                            
                        </tr> -->
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="juzgado.nombre" default="Nombre De Juzgado" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: juzgadoInstance, field: "nombreDeJuzgado")}</td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="juzgado.numero" default="Numero De Juzgado" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: juzgadoInstance, field: "numeroDeJuzgado")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="juzgado.direccion" default="Direccion Juzgado" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: juzgadoInstance, field: "direccionJuzgado")}</td>
                            
                        </tr>
                    
<!--                         <tr class="prop">
                            <td valign="top" class="name"><g:message code="juzgado.estudio.label" default="Estudio" /></td>
                            
                            <td valign="top" class="value"><g:link controller="estudio" action="show" id="${juzgadoInstance?.estudio?.id}">${juzgadoInstance?.estudio?.encodeAsHTML()}</g:link></td>
                            
                        </tr> -->
                    
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
