<%@ page import="sapienter.Persona" import="sapienter.PersonaFisica"
	import="sapienter.PersonaJuridica"%>
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="layout" content="main" />
		<g:set var="entityName"
			value="${message(code: 'persona.label', default: 'Persona')}" />
		<title><g:message code="default.create.label"
		args="[entityName]" /></title>
		<resource:tabView />
		<g:javascript library="application" />
		<g:javascript library="jquery" plugin="jquery" />
		<jqui:resources theme="ui-lightness" />

</head>
<body>
	<div>
	<div class="buttonSubMenu">
		<span><g:link class="list" action="list"><g:message code="persona.list" args="[entityName]" /></g:link></span>
	</div>
	</div>
	<div class="body">
		<script src="${resource(dir:'js',file:'persona.js')}"></script>
		<g:if test="${flash.message}">
			<div class="message">
				${flash.message}
			</div>
		</g:if>
		<g:hasErrors bean="${personaInstance}">
			<div class="errors">
				<g:renderErrors bean="${personaInstance}" as="list" />
			</div>
		</g:hasErrors>
		<g:hasErrors bean="${personaFisicaInstance}">
			<div class="errors">
				<g:renderErrors bean="${personaFisicaInstance}" as="list" />
			</div>
		</g:hasErrors>
		<g:hasErrors bean="${personaJuridicaInstance}">
			<div class="errors">
				<g:renderErrors bean="${personaJuridicaInstance}" as="list" />
			</div>
		</g:hasErrors>
			<div class="dialog">
				<br></br>
				<richui:tabView skin="custom" id="tabView">
					<richui:tabLabels >
						<richui:tabLabel selected="${selected1}" title="Persona Fisica"  />
						<richui:tabLabel selected="${selected2}" title="Persona Juridica" />
						</richui:tabLabels>
						<richui:tabContents  >		
						<richui:tabContent>
							<g:form  controller="personaFisica" action="save">
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
									<tr class="prop">
										<td valign="top" class="name"><label for="apellido"><g:message
													code="persona.apellido" default="Apellido" /><mandatory> *</mandatory>
										</label>
										</td>
										<td valign="top"
											class="value ${hasErrors(bean: personaFisicaInstance, field: 'apellido', 'errors')}">
											<g:textField class="textField" class="textField" name="apellido"
												value="${personaFisicaInstance?.apellido}" />
										</td>
										<td valign="top" class="name"><label
											for="fechaNacimiento"><g:message
													code="persona.fechaNacimiento"
													default="Fecha Nacimiento" /> <mandatory> *</mandatory></label>
										</td>
										<td valign="top"
											class="value ${hasErrors(bean: personaFisicaInstance, field: 'fechaNacimiento', 'errors')}">
											<g:textField class="textField"class="textField" name="fechaNacimiento" 
														value="${personaFisicaInstance?.fechaNacimiento}"/>
										</td>
									</tr>

									<tr class="prop">
										<td valign="top" class="name"><label for="nombre"><g:message
													code="persona.nombre" default="Nombre" /><mandatory> *</mandatory> </label>
										</td>
										<td valign="top"
											class="value ${hasErrors(bean: personaFisicaInstance, field: 'nombre', 'errors')}">
											<g:textField class="textField" class="textField" name="nombre"
												value="${personaFisicaInstance?.nombre}" />
										</td>
										<td valign="top" class="name"><label for="pais"><g:message
													code="sapienter.pais" default="Pais" /><mandatory> *</mandatory> </label>
										</td>
										<td valign="top"
											class="value ${hasErrors(bean: personaFisicaInstance, field: 'pais', 'errors')}">
											<g:countrySelect class="textField" class="textField" name="pais"
												value="${personaFisicaInstance?.pais}"
												noSelection="['' : 'Seleccione un Pais' ]" />
										</td>
									</tr>

									<tr class="prop">
										<td valign="top" class="name"><label for="dni"><g:message
													code="persona.dni" default="Dni" /><mandatory> *</mandatory> </label>
										</td>
										<td valign="top"
											class="value ${hasErrors(bean: personaFisicaInstance, field: 'dni', 'errors')}">
											<g:textField class="textField" name="dni" value="${personaFisicaInstance?.dni}" />
										</td>
		                                <td valign="top" class="name">
		                                    <label for="estadoCivil"><g:message code="persona.estadoCivil" default="Estado Civil" /></label>
		                                </td>
		                                <td valign="top" class="value ${hasErrors(bean: personaFisicaInstance, field: 'estadoCivil', 'errors')}">
		                                    <g:select class="textField" name="estadoCivil" onChange="estadoCivilChanged();" from="${personaFisicaInstance.constraints.estadoCivil.inList}" value="${personaFisicaInstance?.estadoCivil}" valueMessagePrefix="personaFisica.estadoCivil"  />
		                                </td>
		                            </tr>
									<tr class="prop">
										<td valign="top" class="name"><label for="email"><g:message
													code="sapienter.email" default="Email" /><mandatory> *</mandatory> </label>
										</td>
										<td valign="top"
											class="value ${hasErrors(bean: personaFisicaInstance, field: 'email', 'errors')}">
											<g:textField class="textField" name="email"
												value="${personaFisicaInstance?.email}" />
										</td>
										<td valign="top" class="name"><label for="telefono"><g:message
													code="sapienter.telefono" default="Telefono" />
										</label>
										</td>
										<td valign="top"
											class="value ${hasErrors(bean: personaFisicaInstance, field: 'telefono', 'errors')}">
											<g:textField class="textField" name="telefono"
												value="${personaFisicaInstance?.telefono}" />
										</td>
									</tr>									
									<tr class="prop">
										<td valign="top" class="name"><label for="domicilio"><g:message
													code="sapienter.domicilio" default="Domicilio" />
										</label>
										</td>
										<td valign="top"
											class="value ${hasErrors(bean: personaFisicaInstance, field: 'domicilio', 'errors')}">
											<g:textField class="textField" name="domicilio"
												value="${personaFisicaInstance?.domicilio}" />
										</td>
										<td valign="top" class="name"><label for="ciudad"><g:message
													code="persona.ciudad" default="Ciudad" /> </label>
										</td>
										<td valign="top"
											class="value ${hasErrors(bean: personaFisicaInstance, field: 'ciudad', 'errors')}">
											<g:textField class="textField" name="ciudad"
												value="${personaFisicaInstance?.ciudad}" />
										</td>
									</tr>
									<tr class="prop">
										<td valign="top" class="name"><label for="codPostal"><g:message
													code="persona.codPostal" default="Cod Postal" />
										</label>
										</td>
										<td valign="top"
											class="value ${hasErrors(bean: personaFisicaInstance, field: 'codPostal', 'errors')}">
											<g:textField class="textField" name="codPostal"
												value="${personaFisicaInstance?.codPostal}" />
										</td>
										<td valign="top" class="name"><label for="fax"><g:message
													code="sapienter.fax" default="Fax" /> </label>
										</td>
										<td valign="top"
											class="value ${hasErrors(bean: personaFisicaInstance, field: 'fax', 'errors')}">
											<g:textField class="textField" name="fax" value="${personaFisicaInstance?.fax}" />
										</td>
									</tr>				
									<tr class="prop">
										<td valign="top" class="name"><label for="profesion"><g:message
													code="persona.profesion" default="Profesion" />
										</label>
										</td>
										<td valign="top"
											class="value ${hasErrors(bean: personaFisicaInstance, field: 'profesion', 'errors')}">
											<g:textField class="textField" name="profesion"
												value="${personaFisicaInstance?.profesion}" />
										</td>
										<td valign="top" class="name"><label
											for="informacionTributaria"><g:message
													code="persona.informacionTributaria"
													default="Informacion Tributaria" /> </label>
										</td>
										<td valign="top"
											class="value ${hasErrors(bean: personaFisicaInstance, field: 'informacionTributaria', 'errors')}">
											<g:textField class="textField" name="informacionTributaria"
												value="${personaFisicaInstance?.informacionTributaria}" />
										</td>
									</tr>
									<tr><td><br></br></td></tr>
									<tr class="prop">
										<td valign="top" class="descripcion"><label for="madre"><g:message
													code="persona.datosFamiliares" default="Madre" /> </label>
										</td>
									</tr>		
									<tr class="prop">
										<td valign="top" class="name"><label for="padre"><g:message
													code="persona.padre" default="Padre" /> </label>
										</td>
										<td valign="top"
											class="value ${hasErrors(bean: personaFisicaInstance, field: 'padre', 'errors')}">
											<g:textField class="textField" name="padre"
												value="${personaFisicaInstance?.padre}" />
										</td>
										<td valign="top" class="name"><label for="madre"><g:message
													code="persona.madre" default="Madre" /> </label>
										</td>
										<td valign="top"
											class="value ${hasErrors(bean: personaFisicaInstance, field: 'madre', 'errors')}">
											<g:textField class="textField" name="madre"
												value="${personaFisicaInstance?.madre}" />
										</td>
									</tr>

									<tr class="prop" id="conyugueTr">
										<td valign="top" class="name"><label for="conyuge"><g:message
													code="persona.conyugue" default="Conyuge" /> </label>
										</td>
										<td valign="top"
											class="value ${hasErrors(bean: personaFisicaInstance, field: 'conyuge', 'errors')}">
											<g:textField class="textField" name="conyuge"
												value="${personaFisicaInstance?.conyuge}" />
										</td>
									</tr>
									<tr class="prop">
										<td valign="top" class="name"><label for="auxiliar"><g:message
													code="persona.auxiliar" default="Auxiliar" />
										</label>
										</td>
										<td valign="top"
											class="value ${hasErrors(bean: personaFisicaInstance, field: 'auxiliar', 'errors')}">
											<g:textField class="textField" name="auxiliar"
												value="${personaFisicaInstance?.auxiliar}" />
										</td>
									</tr>
									</table>
									</td>
								</tr>
								<tr>
									<td>
									<table>
									<tr class="prop">
										<td valign="top" class="descripcion"><label for="observaciones"><g:message
													code="personaFisica.observaciones.label"
													default="Observaciones" /> </label>
										</td>
										<td valign="top"
											class="value ${hasErrors(bean: personaFisicaInstance, field: 'observaciones', 'errors')}">
											<g:textArea class="textField" name="observaciones"
												value="${personaFisicaInstance?.observaciones}" />
										</td>
									</tr>
									</table>
									</td>
								</tr>	
								</tbody>
							</table>
							</g:form>
						</richui:tabContent>

						<richui:tabContent>
														
							<g:form controller="personaJuridica" action="save">
							<div class="margin">
							<div class="buttonNewObjects">
								<span><g:submitButton name="create" class="save" value="${message(code: 'sapienter.guardar', default: 'Create')}" />
							</span>
							</div>
							</div>
							
							<table class="tabla_edit">
								<tbody>
								<tr>
									<td>
									<table>
									<tr class="prop">
										<td valign="top" class="name"><label for="razonSocial"><g:message
													code="persona.razonSocial"
													default="Razon Social" /><mandatory> *</mandatory></label>
										</td>
										<td valign="top"
											class="value ${hasErrors(bean: personaJuridicaInstance, field: 'razonSocial', 'errors')}">
											<g:textField class="textField" name="razonSocial"
												value="${personaJuridicaInstance?.razonSocial}" />
										</td>
										<td valign="top" class="name"><label for="cuit"><g:message
													code="persona.cuit" default="Cuit" /><mandatory> *</mandatory></label>
										</td>
										<td valign="top"
											class="value ${hasErrors(bean: personaJuridicaInstance, field: 'cuit', 'errors')}">
											<g:textField class="textField" name="cuit"
												value="${personaJuridicaInstance?.cuit}" />
										</td>
									</tr>

									<tr class="prop">
										<td valign="top" class="name"><label
											for="fechaDeInicioActividades"><g:message
													code="persona.fechaDeInicioActividades"
													default="Fecha De Inicio Actividades" /> </label>
										</td>
										<td valign="top"
											class="value ${hasErrors(bean: personaJuridicaInstance, field: 'fechaDeInicioActividades', 'errors')}">
											<g:textField class="textField"class="textField" name="fechaDeInicioActividades" 
														value="${personaJuridicaInstance?.fechaDeInicioActividades}"/>
										</td>
										<td valign="top" class="name"><label for="auxiliares"><g:message
													code="persona.auxiliares"
													default="Auxiliares" /> </label>
										</td>
										<td valign="top"
											class="value ${hasErrors(bean: personaJuridicaInstance, field: 'auxiliares', 'errors')}">
											<g:textField class="textField" name="auxiliares"
												value="${personaJuridicaInstance?.auxiliares}" />
										</td>
									</tr>
									
									<tr class="prop">
										<td valign="top" class="name"><label for="email"><g:message
													code="sapienter.email" default="Email" /><mandatory> *</mandatory> </label>
										</td>
										<td valign="top"
											class="value ${hasErrors(bean: personaJuridicaInstance, field: 'email', 'errors')}">
											<g:textField class="textField" name="email"
												value="${personaJuridicaInstance?.email}" />
										</td>
										<td valign="top" class="name"><label
											for="telefonoDeContacto"><g:message
													code="persona.telefonoDeContacto"
													default="Telefono De Contacto" /> </label>
										</td>
										<td valign="top"
											class="value ${hasErrors(bean: personaJuridicaInstance, field: 'telefonoDeContacto', 'errors')}">
											<g:textField class="textField" name="telefonoDeContacto"
												value="${personaJuridicaInstance?.telefonoDeContacto}" />
										</td>
									</tr>



									<tr class="prop">
										<td valign="top" class="name"><label for="fax"><g:message
													code="sapienter.fax" default="Fax" /> </label>
										</td>
										<td valign="top"
											class="value ${hasErrors(bean: personaJuridicaInstance, field: 'fax', 'errors')}">
											<g:textField class="textField" name="fax"
												value="${personaJuridicaInstance?.fax}" />
										</td>
									</tr>
									</table>
									</td>
								</tr>
								<tr>
									<td>
									<table>
									<tr class="prop">
										<td valign="top" class="descripcion"><label for="observaciones"><g:message
													code="personaJuridica.observaciones.label"
													default="Observaciones" /> </label>
										</td>
										<td valign="top"
											class="value ${hasErrors(bean: personaJuridicaInstance, field: 'observaciones', 'errors')}">
											<g:textArea class="textField" name="observaciones"
												value="${personaJuridicaInstance?.observaciones}" />
										</td>
									</tr>
									</table>
									</td>
								</tr>
								</tbody>
							</table>
							<div class="buttons">


							</div>
							</g:form>
						</richui:tabContent>
					</richui:tabContents>
				</richui:tabView>
			</div>
	</div>
	<jq:jquery>estadoCivilChanged();</jq:jquery>
	<jq:jquery>diasChanged();</jq:jquery>
</body>
</html>
