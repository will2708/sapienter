

<%@ page import="sapienter.Parte" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'parte.label', default: 'Parte')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <h1>Crear parte del proceso</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${parteInstance}">
            <div class="errors">
                <g:renderErrors bean="${parteInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
					<div class="margin">
						<div class="buttonNewObjects">
							<span><g:submitButton name="create" class="save" value="${message(code: 'sapienter.guardar', default: 'Create')}" /></span>
						</div>						
					</div>                    
                    <table class="tabla_edit">
                        <tbody>                        
							<tr>
							<td>
							<table>
								<g:hiddenField name="proceso" value="${parteInstance?.proceso?.id}" />
	                            <tr class="prop">
									<td valign="top" class="descripcion">
	                                    <label for="proceso"><g:message code="proceso.proceso" default="Proceso" /></label></td>
									<td valign="top" class="value"><g:link controller="proceso" action="show" id="${parteInstance?.proceso?.id}">${parteInstance?.proceso?.encodeAsHTML()}</g:link></td>                            
	                            </tr>          
	                            <tr><td><br></td></tr>                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="tipo"><g:message code="parte.tipo" default="Tipo" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: parteInstance, field: 'tipo', 'errors')}">
	                                    <g:select class="textField" name="tipo.id" from="${sapienter.TipoDeParte.list()}" optionKey="id" value="${parteInstance?.tipo?.id}"  />
	                                </td>
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
                             				<td valign="top" class="name">
                                   		<label for="apellido"><g:message code="parte.apellido.label" default="Apellido" /></label>
                               			</td>
                               			<td valign="top" class="value ${hasErrors(bean: parteInstance, field: 'apellido', 'errors')}">
                                   		<g:textField class="textField" name="apellido" value="${parteInstance?.apellido}" />
                               			</td>
                               		</tr>
                               		<tr class="prop">
		                                <td valign="top" class="name">
		                                    <label for="nombre"><g:message code="parte.nombre.label" default="Nombre" /></label>
		                                </td>
		                                <td valign="top" class="value ${hasErrors(bean: parteInstance, field: 'nombre', 'errors')}">
		                                    <g:textField class="textField" name="nombre" value="${parteInstance?.nombre}" />
		                                </td>                               			
                               		</tr>     
                        			</table>	
                        		</td>
                        		<td>
                        			<table>
		                            <tr class="prop">
		                                <td valign="top" class="name">
		                                    <label for="persona"><g:message code="parte.persona.label" default="Persona" /></label>
		                                </td>
		                                <td valign="top" class="value ${hasErrors(bean: parteInstance, field: 'persona', 'errors')}">
		                                    <g:select class="textField" name="persona.id" from="${sapienter.Persona.list()}" optionKey="id" value="${parteInstance?.persona?.id}" noSelection="['null': '']" />
		                                </td>
		                            </tr>                   			
                        			</table>
                        		</td>
                        		</tr>
                        	</table>
                        	</td>
                        	</tr>
                        </tbody>
                    </table>
                </div>
            </g:form>
        </div>
    </body>
</html>
