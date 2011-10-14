

<%@ page import="sapienter.PersonaJuridica" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'personaJuridica.label', default: 'PersonaJuridica')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
    	<div>
        <div class="buttonSubMenu">           
            <span><g:link class="list" controller="persona" action="list"><g:message code="persona.list" args="[entityName]" /></g:link></span>
        </div>
        <div class="buttonSubMenu">
            <span><g:link class="create" action="create"><g:message code="sapienter.crear" args="[entityName]" /></g:link></span>
        </div>
        </div>
        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${personaJuridicaInstance}">
            <div class="errors">
                <g:renderErrors bean="${personaJuridicaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${personaJuridicaInstance?.id}" />
                <g:hiddenField name="version" value="${personaJuridicaInstance?.version}" />
                <div class="dialog">
					<div class="margin">
                		<g:form>
                			<div class="buttonNewObjects">
	                    		<span><g:actionSubmit class="save" action="update" value="${message(code: 'sapienter.guardar', default: 'Update')}" /></span>
	                		</div>
	                		<div class="buttonNewObjects">
	                    		<span><g:actionSubmit class="cancel" action="delete" value="${message(code: 'sapienter.cancelar', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
	                		</div>
	                	</g:form>
	                </div>                
                    <table class="tabla_edit">
                        <tbody>
                        	<tr>
                        		<td>
                        		<table>
									<tr class="prop">
										<td valign="top" class="descripcion"><g:message code="sapienter.id" default="Identificador:" /></td>
										<td valign="top" class="value"> ${fieldValue(bean: personaJuridicaInstance, field: "id")}</td>		
									</tr>                        		
                            		<tr class="prop">
                                		<td valign="top" class="name"><label for="razonSocial"><g:message code="persona.razonSocial" default="Razon Social" />  <mandatory> *</mandatory></label></td>
                                		<td valign="top" class="value ${hasErrors(bean: personaJuridicaInstance, field: 'razonSocial', 'errors')}">
                                    		<g:textField class="textField" name="razonSocial" value="${personaJuridicaInstance?.razonSocial}" /></td>
                                		<td valign="top" class="name"><label for="cuit"><g:message code="persona.cuit" default="Cuit" /> <mandatory> *</mandatory></label></td>
                                		<td valign="top" class="value ${hasErrors(bean: personaJuridicaInstance, field: 'cuit', 'errors')}">
                                    		<g:textField class="textField" name="cuit" value="${personaJuridicaInstance?.cuit}" /></td>
                            		</tr>
                            		<tr class="prop">
                                		<td valign="top" class="name"><label for="fechaDeInicioActividades"><g:message code="persona.fechaDeInicioActividades" default="Fecha De Inicio Actividades" /></label></td>
                                		<td valign="top" class="value ${hasErrors(bean: personaJuridicaInstance, field: 'fechaDeInicioActividades', 'errors')}">
                                    		<g:datePicker class="textField" name="fechaDeInicioActividades" precision="day" value="${personaJuridicaInstance?.fechaDeInicioActividades}" default="none" noSelection="['': '']" /></td>                            		
                                		<td valign="top" class="name"><label for="auxiliares"><g:message code="persona.auxiliares" default="Auxiliares" /></label></td>
                                		<td valign="top" class="value ${hasErrors(bean: personaJuridicaInstance, field: 'auxiliares', 'errors')}">
                                    		<g:textField class="textField" name="auxiliares" value="${personaJuridicaInstance?.auxiliares}" /></td>
                            		</tr>                                                    
                            		<tr class="prop">
                                        <td valign="top" class="name"><label for="email"><g:message code="sapienter.email" default="Email" /> <mandatory> *</mandatory></label></td>
                                		<td valign="top" class="value ${hasErrors(bean: personaJuridicaInstance, field: 'email', 'errors')}">
                                    		<g:textField class="textField" name="email" value="${personaJuridicaInstance?.email}" /></td>
                                		<td valign="top" class="name"><label for="telefonoDeContacto"><g:message code="persona.telefonoDeContacto" default="Telefono De Contacto" /></label></td>
                                		<td valign="top" class="value ${hasErrors(bean: personaJuridicaInstance, field: 'telefonoDeContacto', 'errors')}">
                                    		<g:textField class="textField" name="telefonoDeContacto" value="${personaJuridicaInstance?.telefonoDeContacto}" /></td>
                          			</tr>                        
                            		<tr class="prop">
                                		<td valign="top" class="name"><label for="fax"><g:message code="personaJuridica.fax.label" default="Fax" /></label></td>
                                		<td valign="top" class="value ${hasErrors(bean: personaJuridicaInstance, field: 'fax', 'errors')}">
                                    		<g:textField class="textField" name="fax" value="${personaJuridicaInstance?.fax}" /></td>
                            		</tr>
									<tr>
										<td>
											<br>
										</td>
									</tr>
                            		<tr class="prop">
                                		<td valign="top" class="descripcion"><label for="proceso"><g:message code="sapienter.proceso" default="Proceso" /></label></td>
                                		<td valign="top" class="value ${hasErrors(bean: personaJuridicaInstance, field: 'proceso', 'errors')}">
                                    		<!--<g:select class="textField"  name="proceso.id" from="${sapienter.Proceso.list()}" optionKey="id" value="${personaJuridicaInstance?.proceso?.id}"  /></td>-->
											<ul>
												<g:each in="${personaFisicaInstance?.proceso?}" var="p">
			    								<li><g:link controller="proceso" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
												</g:each>
											</ul>                                    		
                            		</tr>
                        		</table>
                        		</td>
                        	</tr>
                        	<tr>
                            	<td>
                            	<table>
                            		<tr class="prop">
                                		<td valign="top" class="descripcion"><label for="observaciones"><g:message code="sapienter.observaciones" default="Observaciones" /></label></td>
                                		<td valign="top" class="value ${hasErrors(bean: personaJuridicaInstance, field: 'observaciones', 'errors')}">
                                    		<g:textArea class="textField" name="observaciones" value="${personaJuridicaInstance?.observaciones}" /></td>
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
