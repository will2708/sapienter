

<%@ page import="sapienter.PersonaFisica" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'personaFisica.label', default: 'PersonaFisica')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
    	<div>
        <div class="buttonSubMenu">
            <!--<span><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span> -->
            <span><g:link class="list" action="list"><g:message code="persona.list" args="[entityName]" /></g:link></span>
        </div>
        </div>
        <div class="body">
            <!-- <h1><g:message code="default.create.label" args="[entityName]" /></h1> -->
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${personaFisicaInstance}">
            <div class="errors">
                <g:renderErrors bean="${personaFisicaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table class="tabla_edit">
                        <tbody>
                             		<tr class="prop">
                                		<td valign="top" class="name"><label for="apellido"><g:message code="personaFisica.apellido.label" default="Apellido" /></label></td>
		                                <td valign="top" class="value ${hasErrors(bean: personaFisicaInstance, field: 'apellido', 'errors')}">
        		                            <g:textField class="textField" name="apellido" value="${personaFisicaInstance?.apellido}" /></td>
                            	</tr>
	                            <tr class="prop">
    	                            <td valign="top" class="name"><label for="nombre"><g:message code="personaFisica.nombre.label" default="Nombre" /></label></td>
        	                        <td valign="top" class="value ${hasErrors(bean: personaFisicaInstance, field: 'nombre', 'errors')}">
            	                        <g:textField class="textField" name="nombre" value="${personaFisicaInstance?.nombre}" /></td>
                            	</tr>
                            	<tr class="prop">
                                	<td valign="top" class="name"><label for="observaciones"><g:message code="personaFisica.observaciones.label" default="Observaciones" /></label></td>
    	                            <td valign="top" class="value ${hasErrors(bean: personaFisicaInstance, field: 'observaciones', 'errors')}">
        	                            <g:textField class="textField" name="observaciones" value="${personaFisicaInstance?.observaciones}" /></td>
	                            </tr>
            	                <tr class="prop">
                	                <td valign="top" class="name"><label for="pais"><g:message code="personaFisica.pais.label" default="Pais" /></label></td>
                    	            <td valign="top" class="value ${hasErrors(bean: personaFisicaInstance, field: 'pais', 'errors')}">
                        	            <g:countrySelect class="textField" name="pais" value="${personaFisicaInstance?.pais}" noSelection="['' : 'Seleccione un Pais' ]"/>
                            	    </td>
                            	</tr>
                            	<tr class="prop">
                                	<td valign="top" class="name"><label for="dni"><g:message code="personaFisica.dni.label" default="Dni" /></label></td>
                                	<td valign="top" class="value ${hasErrors(bean: personaFisicaInstance, field: 'dni', 'errors')}">
                                    	<g:textField class="textField" name="dni" value="${personaFisicaInstance?.dni}" /></td>
                            	</tr>
                            	<tr class="prop">
                                	<td valign="top" class="name"><label for="fechaNacimiento"><g:message code="personaFisica.fechaNacimiento.label" default="Fecha Nacimiento" /></label></td>
	                                <td valign="top" class="value ${hasErrors(bean: personaFisicaInstance, field: 'fechaNacimiento', 'errors')}">
    	                                <g:datePicker class="textField" name="fechaNacimiento" precision="day" value="${personaFisicaInstance?.fechaNacimiento}"  />
                                	</td>
                            	</tr>
                            	<tr class="prop">
                                	<td valign="top" class="name"><label for="estadoCivil"><g:message code="personaFisica.estadoCivil.label" default="Estado Civil" /></label></td>
                                	<td valign="top" class="value ${hasErrors(bean: personaFisicaInstance, field: 'estadoCivil', 'errors')}">
                                    	<g:select class="textField" name="estadoCivil" from="${personaFisicaInstance.constraints.estadoCivil.inList}" value="${personaFisicaInstance?.estadoCivil}" valueMessagePrefix="personaFisica.estadoCivil"  />
                                	</td>
                            	</tr>
                            	<tr class="prop">
                                	<td valign="top" class="name"><label for="padre"><g:message code="personaFisica.padre.label" default="Padre" /></label></td>
                                	<td valign="top" class="value ${hasErrors(bean: personaFisicaInstance, field: 'padre', 'errors')}">
                                    	<g:textField class="textField" name="padre" value="${personaFisicaInstance?.padre}" />
                                	</td>
                            	</tr>
                            	<tr class="prop">
                                	<td valign="top" class="name"><label for="madre"><g:message code="personaFisica.madre.label" default="Madre" /></label></td>
                                	<td valign="top" class="value ${hasErrors(bean: personaFisicaInstance, field: 'madre', 'errors')}">
                                    	<g:textField class="textField" name="madre" value="${personaFisicaInstance?.madre}" />
                                	</td>
                            	</tr>
                            	<tr class="prop">
                                	<td valign="top" class="name"><label for="conyuge"><g:message code="personaFisica.conyuge.label" default="Conyuge" /></label></td>
                                	<td valign="top" class="value ${hasErrors(bean: personaFisicaInstance, field: 'conyuge', 'errors')}">
                                    	<g:textField class="textField" name="conyuge" value="${personaFisicaInstance?.conyuge}" /></td>
                            	</tr>
                            	<tr class="prop">
                                	<td valign="top" class="name"><label for="email"><g:message code="personaFisica.email.label" default="Email" /></label></td>
                                	<td valign="top" class="value ${hasErrors(bean: personaFisicaInstance, field: 'email', 'errors')}">
                                    	<g:textField class="textField" name="email" value="${personaFisicaInstance?.email}" />
                                	</td>
                            	</tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="auxiliar"><g:message code="personaFisica.auxiliar.label" default="Auxiliar" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personaFisicaInstance, field: 'auxiliar', 'errors')}">
                                    <g:textField name="auxiliar" value="${personaFisicaInstance?.auxiliar}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="ciudad"><g:message code="personaFisica.ciudad.label" default="Ciudad" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personaFisicaInstance, field: 'ciudad', 'errors')}">
                                    <g:textField name="ciudad" value="${personaFisicaInstance?.ciudad}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="codPostal"><g:message code="personaFisica.codPostal.label" default="Cod Postal" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personaFisicaInstance, field: 'codPostal', 'errors')}">
                                    <g:textField name="codPostal" value="${personaFisicaInstance?.codPostal}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="domicilio"><g:message code="personaFisica.domicilio.label" default="Domicilio" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personaFisicaInstance, field: 'domicilio', 'errors')}">
                                    <g:textField name="domicilio" value="${personaFisicaInstance?.domicilio}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="estudio"><g:message code="personaFisica.estudio.label" default="Estudio" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personaFisicaInstance, field: 'estudio', 'errors')}">
                                    <g:select name="estudio.id" from="${sapienter.Estudio.list()}" optionKey="id" value="${personaFisicaInstance?.estudio?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fax"><g:message code="personaFisica.fax.label" default="Fax" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personaFisicaInstance, field: 'fax', 'errors')}">
                                    <g:textField name="fax" value="${personaFisicaInstance?.fax}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="informacionTributaria"><g:message code="personaFisica.informacionTributaria.label" default="Informacion Tributaria" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personaFisicaInstance, field: 'informacionTributaria', 'errors')}">
                                    <g:textField name="informacionTributaria" value="${personaFisicaInstance?.informacionTributaria}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="profesion"><g:message code="personaFisica.profesion.label" default="Profesion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personaFisicaInstance, field: 'profesion', 'errors')}">
                                    <g:textField name="profesion" value="${personaFisicaInstance?.profesion}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="telefono"><g:message code="personaFisica.telefono.label" default="Telefono" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: personaFisicaInstance, field: 'telefono', 'errors')}">
                                    <g:textField name="telefono" value="${personaFisicaInstance?.telefono}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
