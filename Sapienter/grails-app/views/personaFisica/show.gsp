
<%@ page import="sapienter.PersonaFisica"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<g:set var="entityName"
	value="${message(code: 'personaFisica.label', default: 'PersonaFisica')}" />
<title><g:message code="default.show.label" args="[entityName]" />
</title>
</head>
<body>
	<div class = "buttonSubMenu">
	 <span><g:link class="list" controller="persona" action="list"><g:message code="persona.list" args="[entityName]"/></g:link></span>
	</div>
	<div class = "buttonSubMenu"> 
		 <span><g:link class="create" action="create"><g:message code="sapienter.crear" args="[entityName]" /></g:link></span>
	</div>
	<g:form>
	<g:hiddenField name="id" value="${personaFisicaInstance?.id}" />
		<div class="buttonForm">
			<span><g:actionSubmit class="edit" action="edit" value="${message(code: 'sapienter.modificar', default: 'Edit')}" /></span>
	 	</div>
	 	<div class="buttonForm"> 
			<span><g:actionSubmit class="delete" action="delete" value="${message(code: 'sapienter.borrar', default: 'Delete')}"
					onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
			</span>
		</div>
	</g:form>
	<div class="body">
		<!-- <h1>
			<g:message code="default.show.label" args="[entityName]" /> 			
		</h1>
		-->		
		<g:if test="${flash.message}">
			<div class="message"> ${flash.message} </div>
		</g:if>
		<div class="dialog">		
			<div class="margin">
			<g:form>
			<g:hiddenField name="id" value="${personaFisicaInstance?.id}" />	        	    		
			  <div class="buttonNewObjects">		
				<span><g:actionSubmit class="create" action="crearProceso" value="${message(code: 'sapienter.crearProceso', default:'Crear Proceso')}"/>
				</span>
	          </div>        
	        </g:form> 		
	        </div>
			<table class="tabla">
				<tbody>	
				<tr>
					<td>
						<table>			
							<tr class="prop">
								<td valign="top" class="descripcion"><g:message code="sapienter.id" default="Identificador:" /></td>
								<td valign="top" class="value"> ${fieldValue(bean: personaFisicaInstance, field: "id")}</td>		
							</tr>	
							<tr class="prop">
								<td valign="top" class="name"><g:message code="persona.apellido" default="Apellido"/></td>
								<td valign="top" class="value"> ${fieldValue(bean: personaFisicaInstance, field: "apellido")}</td>								
								<td valign="top" class="name"><g:message code="persona.fechaNacimiento" default="Fecha Nacimiento" /></td>
								<td valign="top" class="value"><g:formatDate format="dd/MM/yyyy" date="${personaFisicaInstance?.fechaNacimiento}" /></td>		
							</tr>		
							<tr class="prop">
								<td valign="top" class="name"><g:message code="persona.nombre" default="Nombre" /></td>
								<td valign="top" class="value"> ${fieldValue(bean: personaFisicaInstance, field: "nombre")} </td>
								<td valign="top" class="name"><g:message code="sapienter.pais" default="Pais" /></td>
								<td valign="top" class="value"><g:country code="${personaFisicaInstance?.pais}" /></td>
							</tr>		
							<tr class="prop">
								<td valign="top" class="name"><g:message code="persona.dni" default="Dni" /></td>		
								<td valign="top" class="value">${fieldValue(bean: personaFisicaInstance, field: "dni")}</td>
								<td valign="top" class="name"><g:message code="persona.estadoCivil" default="Estado Civil" /></td>		
								<td valign="top" class="value"> ${fieldValue(bean: personaFisicaInstance, field: "estadoCivil")}</td>
							</tr>		
							<tr class="prop">
								<td valign="top" class="name"><g:message code="sapienter.email" default="Email" /></td>
								<td valign="top" class="value">	${fieldValue(bean: personaFisicaInstance, field: "email")}</td>
								<td valign="top" class="name"><g:message code="sapienter.telefono" default="Telefono" /></td>
								<td valign="top" class="value">	${fieldValue(bean: personaFisicaInstance, field: "telefono")}</td>
							</tr>									
								<tr class="prop">
									<td valign="top" class="name"><g:message code="sapienter.domicilio" default="Domicilio" /></td>			
									<td valign="top" class="value">${fieldValue(bean: personaFisicaInstance, field: "domicilio")}</td>
									<td valign="top" class="name"><g:message code="persona.ciudad" default="Ciudad" /></td>
									<td valign="top" class="value">${fieldValue(bean: personaFisicaInstance, field: "ciudad")}</td>
								</tr>
								<tr class="prop">
									<td valign="top" class="name"><g:message code="persona.codPostal" default="Cod Postal" /></td>
									<td valign="top" class="value">${fieldValue(bean: personaFisicaInstance, field: "codPostal")}</td>
									<td valign="top" class="name"><g:message code="sapienter.fax" default="Fax" /></td>
									<td valign="top" class="value">${fieldValue(bean: personaFisicaInstance, field: "fax")}</td>
								</tr>
								<tr class="prop">
									<td valign="top" class="name"><g:message code="personaFisica.profesion.label" default="Profesion" /></td>
									<td valign="top" class="value">${fieldValue(bean: personaFisicaInstance, field: "profesion")}</td>
									<td valign="top" class="name"><g:message code="personaFisica.informacionTributaria" /></td>
									<td valign="top" class="value">${fieldValue(bean: personaFisicaInstance, field: "informacionTributaria")}</td>
								</tr>
								
								<tr class="prop">
									<td valign="top" class="descripcion"><br><g:message code="personaFisica.proceso.label" default="Procesos:" /></td>
									<td valign="top" style="text-align: left;" class="value"><br>
										<ul>
											<g:each in="${personaFisicaInstance.proceso}" var="p">
												<li><g:link controller="proceso" action="show" id="${p.id}"> ${p?.encodeAsHTML()}</g:link></li>
											</g:each>
										</ul>
									</td>
								</tr>
								<tr>
								</tr>
								<tr class="prop">
									<td valign="top" class="descripcion"><g:message code="personaFisica.padre.label" default="Datos Familiares:" /></td>
								</tr>					
								<tr class="prop">
									<td valign="top" class="name"><g:message code="personaFisica.padre.label" default="Padre" /></td>
									<td valign="top" class="value">${fieldValue(bean: personaFisicaInstance, field: "padre")}</td>
									<td valign="top" class="name"><g:message code="personaFisica.madre.label" default="Madre" /></td>
									<td valign="top" class="value">${fieldValue(bean: personaFisicaInstance, field: "madre")}</td>
								</tr>			
								<tr class="prop">
									<td valign="top" class="name"><g:message code="personaFisica.conyuge.label" default="Conyuge" /></td>			
									<td valign="top" class="value">${fieldValue(bean: personaFisicaInstance, field: "conyuge")}</td>
									<td valign="top" class="name"><g:message code="personaFisica.auxiliar.label" default="Auxiliar" /></td>		
									<td valign="top" class="value">${fieldValue(bean: personaFisicaInstance, field: "auxiliar")}</td>
								</tr>
							</table>
					</td>
				</tr>
				<tr>
					<td>
							<table>
								<tr class="prop">
									<td valign="top" class="descripcion"> <g:message code="personaFisica.observaciones.label" default="Observaciones:" /></td>			
									<td valign="top" class="value">${fieldValue(bean: personaFisicaInstance, field: "observaciones")}</td>								
								</tr>	
							</table>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
</div>
</body>
</html>
