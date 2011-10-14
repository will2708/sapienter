

<%@ page import="sapienter.PersonaFisica" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'personaFisica.label', default: 'PersonaFisica')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
    	<div>
        <div class="buttonSubMenu">
            <!--<span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>-->
            <span><g:link class="list" action="list"><g:message code="persona.list" args="[entityName]" /></g:link></span>
        </div>
        <div class="buttonSubMenu">
            <span><g:link class="create" action="create"><g:message code="sapienter.crear" args="[entityName]" /></g:link></span>
        </div>
		</div>
        <div class="body">
            <!--<h1><g:message code="default.edit.label" args="[entityName]" /></h1>-->
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${personaFisicaInstance}">
            <div class="errors">
                <g:renderErrors bean="${personaFisicaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${personaFisicaInstance?.id}" />
                <g:hiddenField name="version" value="${personaFisicaInstance?.version}" />
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
                    <table class="tabla">
                        <tbody>             
                        <tr>
                        	<td>
                        	<table>           
	                            <tr class="prop">
	                                <td valign="top" class="name"><label for="apellido"><g:message code="persona.apellido" default="Apellido" /></label></td>
	                                <td valign="top" class="value ${hasErrors(bean: personaFisicaInstance, field: 'apellido', 'errors')}">
	                                    <g:textField name="apellido" value="${personaFisicaInstance?.apellido}" /></td>
	 								<td valign="top" class="name"><label for="fechaNacimiento"><g:message code="persona.fechaNacimiento" default="Fecha Nacimiento" /></label></td>
	                                <td valign="top" class="value ${hasErrors(bean: personaFisicaInstance, field: 'fechaNacimiento', 'errors')}">
	                                    <g:datePicker name="fechaNacimiento" precision="day" value="${personaFisicaInstance?.fechaNacimiento}"  /></td>                                    
	                            </tr>                        
	                            <tr class="prop">
	                                <td valign="top" class="name"><label for="nombre"><g:message code="persona.nombre" default="Nombre" /></label></td>
	                                <td valign="top" class="value ${hasErrors(bean: personaFisicaInstance, field: 'nombre', 'errors')}">
	                                    <g:textField name="nombre" value="${personaFisicaInstance?.nombre}" /></td>
	                                <td valign="top" class="name"><label for="pais"><g:message code="sapienter.pais" default="Pais" /></label></td>
	                                <td valign="top" class="value ${hasErrors(bean: personaFisicaInstance, field: 'pais', 'errors')}">
	                                    <g:countrySelect name="pais" value="${personaFisicaInstance?.pais}" /></td>                                    
	                            </tr>                        
	                            <tr class="prop">
	                                <td valign="top" class="name"><label for="dni"><g:message code="persona.dni" default="Dni" /></label></td>
	                                <td valign="top" class="value ${hasErrors(bean: personaFisicaInstance, field: 'dni', 'errors')}">
	                                    <g:textField name="dni" value="${personaFisicaInstance?.dni}" /></td>
	                                <td valign="top" class="name"><label for="estadoCivil"><g:message code="persona.estadoCivil" default="Estado Civil" /></label></td>
	                                <td valign="top" class="value ${hasErrors(bean: personaFisicaInstance, field: 'estadoCivil', 'errors')}">
	                                    <g:select name="estadoCivil" from="${personaFisicaInstance.constraints.estadoCivil.inList}" value="${personaFisicaInstance?.estadoCivil}" valueMessagePrefix="personaFisica.estadoCivil"  /></td>
	                            </tr>
	                            <tr class="prop">
	                                <td valign="top" class="name"><label for="email"><g:message code="sapienter.email" default="Email" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: personaFisicaInstance, field: 'email', 'errors')}">
	                                    <g:textField name="email" value="${personaFisicaInstance?.email}" /></td>
									<td valign="top" class="name"><label for="telefono"><g:message code="sapienter.telefono" default="Telefono" /></label></td>
	                                <td valign="top" class="value ${hasErrors(bean: personaFisicaInstance, field: 'telefono', 'errors')}">
	                                	<g:textField name="telefono" value="${personaFisicaInstance?.telefono}" /></td>                                    
	                            </tr>
	                            <tr class="prop">
	                            	<td valign="top" class="name"><label for="domicilio"><g:message code="sapienter.domicilio" default="Domicilio" /></label></td>
	                                <td valign="top" class="value ${hasErrors(bean: personaFisicaInstance, field: 'domicilio', 'errors')}">
	                                    <g:textField name="domicilio" value="${personaFisicaInstance?.domicilio}" /></td>
	                                <td valign="top" class="name"><label for="ciudad"><g:message code="persona.ciudad" default="Ciudad" /></label></td>
	                                <td valign="top" class="value ${hasErrors(bean: personaFisicaInstance, field: 'ciudad', 'errors')}">
	                                    <g:textField name="ciudad" value="${personaFisicaInstance?.ciudad}" /></td>
	                            </tr>
	                            <tr class="prop">
	                                <td valign="top" class="name"><label for="codPostal"><g:message code="sapienter.codPostal" default="Cod Postal" /></label></td>
	                                <td valign="top" class="value ${hasErrors(bean: personaFisicaInstance, field: 'codPostal', 'errors')}">
	                                    <g:textField name="codPostal" value="${personaFisicaInstance?.codPostal}" /></td>
	                                <td valign="top" class="name"><label for="fax"><g:message code="sapienter.fax" default="Fax" /></label></td>
	                                <td valign="top" class="value ${hasErrors(bean: personaFisicaInstance, field: 'fax', 'errors')}">
	                                    <g:textField name="fax" value="${personaFisicaInstance?.fax}" /></td>
	                            </tr>
	                            <tr class="prop">
	                                <td valign="top" class="name"><label for="profesion"><g:message code="persona.profesion" default="Profesion" /></label></td>
	                                <td valign="top" class="value ${hasErrors(bean: personaFisicaInstance, field: 'profesion', 'errors')}">
	                                    <g:textField name="profesion" value="${personaFisicaInstance?.profesion}" /></td>
                                		<td valign="top" class="name"><label for="informacionTributaria"><g:message code="persona.informacionTributaria" default="Informacion Tributaria" /></label></td>
                                		<td valign="top" class="value ${hasErrors(bean: personaFisicaInstance, field: 'informacionTributaria', 'errors')}">
                                    		<g:textField name="informacionTributaria" value="${personaFisicaInstance?.informacionTributaria}" /></td>
	                            </tr>
	                            <tr class="prop">
	                                <td valign="top" class="descripcion"><br><label for="proceso"><g:message code="sapienter.proceso" default="Proceso" /></label></td>
	                                <td valign="top" class="value ${hasErrors(bean: personaFisicaInstance, field: 'proceso', 'errors')}"><br>
										<ul>
											<g:each in="${personaFisicaInstance?.proceso?}" var="p">
		    								<li><g:link controller="proceso" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
											</g:each>
										</ul>
										<g:link controller="proceso" action="create" params="['personaFisica.id': personaFisicaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'proceso.label', default: 'Proceso')])}</g:link>
	                                </td>
	                           	</tr>         
								<tr>
								</tr>
								<tr class="prop">
									<td valign="top" class="descripcion"><g:message code="persona.datosFamiliares" default="Datos Familiares:" /></td>
								</tr>	         
	                            <tr class="prop">
	                                <td valign="top" class="name"><label for="padre"><g:message code="persona.padre" default="Padre" /></label></td>
	                                <td valign="top" class="value ${hasErrors(bean: personaFisicaInstance, field: 'padre', 'errors')}">
	                                    <g:textField name="padre" value="${personaFisicaInstance?.padre}" /></td>
	                                <td valign="top" class="name"><label for="madre"><g:message code="persona.madre" default="Madre" /></label></td>
	                                <td valign="top" class="value ${hasErrors(bean: personaFisicaInstance, field: 'madre', 'errors')}">
	                                    <g:textField name="madre" value="${personaFisicaInstance?.madre}" /></td>
	                            </tr>
	                            <tr class="prop">
	                                <td valign="top" class="name"><label for="conyuge"><g:message code="persona.conyugue" default="Conyuge" /></label></td>
	                                <td valign="top" class="value ${hasErrors(bean: personaFisicaInstance, field: 'conyuge', 'errors')}">
	                                    <g:textField name="conyuge" value="${personaFisicaInstance?.conyuge}" /></td>
	                                <td valign="top" class="name"><label for="auxiliar"><g:message code="persona.auxiliar" default="Auxiliar" /></label></td>
	                                <td valign="top" class="value ${hasErrors(bean: personaFisicaInstance, field: 'auxiliar', 'errors')}">
	                                    <g:textField name="auxiliar" value="${personaFisicaInstance?.auxiliar}" />
	                                </td>
	                            </tr>
	                         </table>
	                        </td>
	                       </tr>
	                       <tr>
	                       	<td>
	                       		<table>
									<tr class="prop">
                                		<td valign="top" class="descripcion"><label for="observaciones"><g:message code="sapienter.observaciones" default="Observaciones" /></label></td>
                                		<td valign="top" class="value ${hasErrors(bean: personaFisicaInstance, field: 'observaciones', 'errors')}">
                                    		<g:textField name="observaciones" value="${personaFisicaInstance?.observaciones}" /></td>
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
