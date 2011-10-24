
<%@ page import="sapienter.Parte" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'parte.label', default: 'Parte')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
           <g:form>
           <g:hiddenField name="id" value="${parteInstance?.id}" />
           		<div class="buttonForm">
           			<span ><g:actionSubmit class="edit" action="edit" value="${message(code: 'sapienter.modificar', default: 'Edit')}" /></span>
           		</div>
           		<div class="buttonForm">
                	<span><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>  
        <div class="body">
            <h1>Parte del proceso</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table class="tabla">
                    		<tr>
							<td>
							<table>
								<g:hiddenField name="proceso" value="${parteInstance?.proceso?.id}" />
	                            <tr class="prop">
									<td valign="top" class="descripcion"><g:message code="sapienter.id" default="Id" /></td>
                            		<td valign="top" class="value">${fieldValue(bean: parteInstance, field: "id")}</td>	                            
									<td valign="top" class="descripcion">
	                                    <label for="proceso"><g:message code="proceso.proceso" default="Proceso" /></label></td>
									<td valign="top" class="value"><g:link controller="proceso" action="show" id="${parteInstance?.proceso?.id}">${parteInstance?.proceso?.encodeAsHTML()}</g:link></td>                            
	                            </tr>          
	                            <tr class="prop">
	                                <td valign="top" class="name"><g:message code="parte.tipo" default="Concepto" /></td>
	                                <td valign="top" class="value">${fieldValue(bean: parteInstance, field: "tipo")}</td>
	                            </tr>
	                        </table>
	                        </td>
	                        </tr>
								<tr>
                        			<td>
                        			<h2>Ingrese una nueva parte o seleccione la misma desde la lista de personas</h2>
                        			</td>
                        		</tr>                        	
                        		<tr>	                        
                        	<tr>
                        	<td>
                        	<table class="tabla_parte">
                        		<td>
                        			<table>
                       				<tr class="prop">
	                                	<td valign="top" class="name"><g:message code="persona.apellido" default="Concepto" /></td>
	                                	<td valign="top" class="value">${fieldValue(bean: parteInstance, field: "apellido")}</td>
                               		</tr>
                               		<tr class="prop">
										<td valign="top" class="name"><g:message code="persona.nombre" default="Concepto" /></td>
	                                	<td valign="top" class="value">${fieldValue(bean: parteInstance, field: "nombre")}</td>
                               		</tr>     
                        			</table>	
                        		</td>           		
                        		<td>
                        			<table>
		                            <tr class="prop">		
                  	                	<td valign="top" class="name"><g:message code="sapienter.persona" default="Concepto" /></td>
	                                	<td valign="top" class="value">${fieldValue(bean: parteInstance, field: "persona")}</td>
		                            </tr>                   			
                        			</table>
                        		</td>
                        		</tr>
                        	</table>
                        	</td>
                        	</tr>

                </table>
            </div>
        </div>
    </body>
</html>