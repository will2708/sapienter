

<%@ page import="sapienter.Persona" import="sapienter.PersonaFisica"
	import="sapienter.PersonaJuridica"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<g:set var="entityName"
	value="${message(code: 'persona.label', default: 'Persona')}" />
<title><g:message code="default.create.label"
		args="[entityName]" />
</title>
<resource:tabView />
<z:head zul="/sapienter/pantallas/create.zul" />
</head>
<body>
	<div class="body">
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
		<z:body zul="/sapienter/pantallas/test.zul" />
		<g:form action="save">
			<div class="dialog">

				<richui:tabView id="tabView">
					<richui:tabLabels>
						<richui:tabLabel selected="true" title="Persona Fisica" />
						<richui:tabLabel title="Persona Juridica" />
					</richui:tabLabels>
					<richui:tabContents>
						<richui:tabContent>

							<table>
								<tbody>

									<tr class="prop">
										<td valign="top" class="name"><label for="apellido"><g:message
													code="personaFisica.apellido.label" default="Apellido" />
										</label></td>
										<td valign="top"
											class="value ${hasErrors(bean: personaFisicaInstance, field: 'apellido', 'errors')}">
											<g:textField name="apellido"
												value="${personaFisicaInstance?.apellido}" /></td>
									</tr>

									<tr class="prop">
										<td valign="top" class="name"><label for="nombre"><g:message
													code="personaFisica.nombre.label" default="Nombre" /> </label></td>
										<td valign="top"
											class="value ${hasErrors(bean: personaFisicaInstance, field: 'nombre', 'errors')}">
											<g:textField name="nombre"
												value="${personaFisicaInstance?.nombre}" /></td>
									</tr>
									<tr class="prop">
										<td valign="top" class="name"><label for="estadoCivil"><g:message
													code="personaFisica.estadoCivil.label"
													default="Estado Civil" /> </label>
										</td>
										<td valign="top"
											class="value ${hasErrors(bean: personaFisicaInstance, field: 'estadoCivil', 'errors')}">
											<g:select name="estadoCivil"
												from="${personaFisicaInstance.constraints.estadoCivil.inList}"
												value="${personaFisicaInstance?.estadoCivil}"
												valueMessagePrefix="personaFisica.estadoCivil" />
										</td>
									</tr>

									<tr class="prop">
										<td valign="top" class="name"><label for="observaciones"><g:message
													code="personaFisica.observaciones.label"
													default="Observaciones" /> </label></td>
										<td valign="top"
											class="value ${hasErrors(bean: personaFisicaInstance, field: 'observaciones', 'errors')}">
											<g:textArea name="observaciones"
												value="${personaFisicaInstance?.observaciones}" /></td>
									</tr>

									<tr class="prop">
										<td valign="top" class="name"><label for="pais"><g:message
													code="personaFisica.pais.label" default="Pais" /> </label></td>
										<td valign="top"
											class="value ${hasErrors(bean: personaFisicaInstance, field: 'pais', 'errors')}">
											<g:countrySelect name="pais"
												value="${personaFisicaInstance?.pais}"
												noSelection="['' : 'Seleccione un Pais' ]" /></td>
									</tr>


									<tr class="prop">
										<td valign="top" class="name"><label for="dni"><g:message
													code="personaFisica.dni.label" default="Dni" /> </label></td>
										<td valign="top"
											class="value ${hasErrors(bean: personaFisicaInstance, field: 'dni', 'errors')}">
											<g:textField name="dni" value="${personaFisicaInstance?.dni}" />
										</td>
									</tr>

									<tr class="prop">
										<td valign="top" class="name"><label
											for="fechaNacimiento"><g:message
													code="personaFisica.fechaNacimiento.label"
													default="Fecha Nacimiento" /> </label></td>
										<td valign="top"
											class="value ${hasErrors(bean: personaFisicaInstance, field: 'fechaNacimiento', 'errors')}">
											<g:datePicker name="fechaNacimiento" precision="day"
												value="${personaFisicaInstance?.fechaNacimiento}" /></td>
									</tr>

									<tr class="prop">
										<td valign="top" class="name"><label for="padre"><g:message
													code="personaFisica.padre.label" default="Padre" /> </label></td>
										<td valign="top"
											class="value ${hasErrors(bean: personaFisicaInstance, field: 'padre', 'errors')}">
											<g:textField name="padre"
												value="${personaFisicaInstance?.padre}" /></td>
									</tr>

									<tr class="prop">
										<td valign="top" class="name"><label for="madre"><g:message
													code="personaFisica.madre.label" default="Madre" /> </label></td>
										<td valign="top"
											class="value ${hasErrors(bean: personaFisicaInstance, field: 'madre', 'errors')}">
											<g:textField name="madre"
												value="${personaFisicaInstance?.madre}" /></td>
									</tr>

									<tr class="prop">
										<td valign="top" class="name"><label for="conyuge"><g:message
													code="personaFisica.conyuge.label" default="Conyuge" /> </label></td>
										<td valign="top"
											class="value ${hasErrors(bean: personaFisicaInstance, field: 'conyuge', 'errors')}">
											<g:textField name="conyuge"
												value="${personaFisicaInstance?.conyuge}" /></td>
									</tr>

									<tr class="prop">
										<td valign="top" class="name"><label for="email"><g:message
													code="personaFisica.email.label" default="Email" /> </label></td>
										<td valign="top"
											class="value ${hasErrors(bean: personaFisicaInstance, field: 'email', 'errors')}">
											<g:textField name="email"
												value="${personaFisicaInstance?.email}" /></td>
									</tr>

									<tr class="prop">
										<td valign="top" class="name"><label for="auxiliar"><g:message
													code="personaFisica.auxiliar.label" default="Auxiliar" />
										</label></td>
										<td valign="top"
											class="value ${hasErrors(bean: personaFisicaInstance, field: 'auxiliar', 'errors')}">
											<g:textField name="auxiliar"
												value="${personaFisicaInstance?.auxiliar}" /></td>
									</tr>

									<tr class="prop">
										<td valign="top" class="name"><label for="ciudad"><g:message
													code="personaFisica.ciudad.label" default="Ciudad" /> </label></td>
										<td valign="top"
											class="value ${hasErrors(bean: personaFisicaInstance, field: 'ciudad', 'errors')}">
											<g:textField name="ciudad"
												value="${personaFisicaInstance?.ciudad}" /></td>
									</tr>

									<tr class="prop">
										<td valign="top" class="name"><label for="codPostal"><g:message
													code="personaFisica.codPostal.label" default="Cod Postal" />
										</label></td>
										<td valign="top"
											class="value ${hasErrors(bean: personaFisicaInstance, field: 'codPostal', 'errors')}">
											<g:textField name="codPostal"
												value="${personaFisicaInstance?.codPostal}" /></td>
									</tr>

									<tr class="prop">
										<td valign="top" class="name"><label for="domicilio"><g:message
													code="personaFisica.domicilio.label" default="Domicilio" />
										</label></td>
										<td valign="top"
											class="value ${hasErrors(bean: personaFisicaInstance, field: 'domicilio', 'errors')}">
											<g:textField name="domicilio"
												value="${personaFisicaInstance?.domicilio}" /></td>
									</tr>

									<tr class="prop">
										<td valign="top" class="name"><label for="fax"><g:message
													code="personaFisica.fax.label" default="Fax" /> </label></td>
										<td valign="top"
											class="value ${hasErrors(bean: personaFisicaInstance, field: 'fax', 'errors')}">
											<g:textField name="fax" value="${personaFisicaInstance?.fax}" />
										</td>
									</tr>

									<tr class="prop">
										<td valign="top" class="name"><label
											for="informacionTributaria"><g:message
													code="personaFisica.informacionTributaria.label"
													default="Informacion Tributaria" /> </label></td>
										<td valign="top"
											class="value ${hasErrors(bean: personaFisicaInstance, field: 'informacionTributaria', 'errors')}">
											<g:textField name="informacionTributaria"
												value="${personaFisicaInstance?.informacionTributaria}" />
										</td>
									</tr>

									<tr class="prop">
										<td valign="top" class="name"><label for="profesion"><g:message
													code="personaFisica.profesion.label" default="Profesion" />
										</label></td>
										<td valign="top"
											class="value ${hasErrors(bean: personaFisicaInstance, field: 'profesion', 'errors')}">
											<g:textField name="profesion"
												value="${personaFisicaInstance?.profesion}" /></td>
									</tr>

									<tr class="prop">
										<td valign="top" class="name"><label for="telefono"><g:message
													code="personaFisica.telefono.label" default="Telefono" />
										</label></td>
										<td valign="top"
											class="value ${hasErrors(bean: personaFisicaInstance, field: 'telefono', 'errors')}">
											<g:textField name="telefono"
												value="${personaFisicaInstance?.telefono}" /></td>
									</tr>
								</tbody>
							</table>
							<div class="buttons">
								<span class="button"><g:submitButton name="create"
										class="save"
										value="${message(code: 'default.button.create.label', default: 'Create')}" />
								</span>
							</div>

						</richui:tabContent>
						<richui:tabContent>
							<table>
								<tbody>

									<tr class="prop">
										<td valign="top" class="name"><label for="razonSocial"><g:message
													code="personaJuridica.razonSocial.label"
													default="Razon Social" /> </label></td>
										<td valign="top"
											class="value ${hasErrors(bean: personaJuridicaInstance, field: 'razonSocial', 'errors')}">
											<g:textField name="razonSocial"
												value="${personaJuridicaInstance?.razonSocial}" /></td>
									</tr>

									<tr class="prop">
										<td valign="top" class="name"><label for="cuit"><g:message
													code="personaJuridica.cuit.label" default="Cuit" /> </label></td>
										<td valign="top"
											class="value ${hasErrors(bean: personaJuridicaInstance, field: 'cuit', 'errors')}">
											<g:textField name="cuit"
												value="${personaJuridicaInstance?.cuit}" /></td>
									</tr>

									<tr class="prop">
										<td valign="top" class="name"><label
											for="fechaDeInicioActividades"><g:message
													code="personaJuridica.fechaDeInicioActividades.label"
													default="Fecha De Inicio Actividades" /> </label></td>
										<td valign="top"
											class="value ${hasErrors(bean: personaJuridicaInstance, field: 'fechaDeInicioActividades', 'errors')}">
											<g:datePicker name="fechaDeInicioActividades" precision="day"
												value="${personaJuridicaInstance?.fechaDeInicioActividades}"
												default="none" noSelection="['': '']" /></td>
									</tr>

									<tr class="prop">
										<td valign="top" class="name"><label
											for="telefonoDeContacto"><g:message
													code="personaJuridica.telefonoDeContacto.label"
													default="Telefono De Contacto" /> </label></td>
										<td valign="top"
											class="value ${hasErrors(bean: personaJuridicaInstance, field: 'telefonoDeContacto', 'errors')}">
											<g:textField name="telefonoDeContacto"
												value="${personaJuridicaInstance?.telefonoDeContacto}" /></td>
									</tr>

									<tr class="prop">
										<td valign="top" class="name"><label for="email"><g:message
													code="personaJuridica.email.label" default="Email" /> </label></td>
										<td valign="top"
											class="value ${hasErrors(bean: personaJuridicaInstance, field: 'email', 'errors')}">
											<g:textField name="email"
												value="${personaJuridicaInstance?.email}" /></td>
									</tr>

									<tr class="prop">
										<td valign="top" class="name"><label for="fax"><g:message
													code="personaJuridica.fax.label" default="Fax" /> </label></td>
										<td valign="top"
											class="value ${hasErrors(bean: personaJuridicaInstance, field: 'fax', 'errors')}">
											<g:textField name="fax"
												value="${personaJuridicaInstance?.fax}" /></td>
									</tr>

									<tr class="prop">
										<td valign="top" class="name"><label for="auxiliares"><g:message
													code="personaJuridica.auxiliares.label"
													default="Auxiliares" /> </label></td>
										<td valign="top"
											class="value ${hasErrors(bean: personaJuridicaInstance, field: 'auxiliares', 'errors')}">
											<g:textField name="auxiliares"
												value="${personaJuridicaInstance?.auxiliares}" /></td>
									</tr>

									<tr class="prop">
										<td valign="top" class="name"><label for="observaciones"><g:message
													code="personaJuridica.observaciones.label"
													default="Observaciones" /> </label></td>
										<td valign="top"
											class="value ${hasErrors(bean: personaJuridicaInstance, field: 'observaciones', 'errors')}">
											<g:textArea name="observaciones"
												value="${personaJuridicaInstance?.observaciones}" /></td>
									</tr>

								</tbody>
							</table>
							<div class="buttons">
								<span class="button"><g:submitButton name="create"
										class="save"
										value="${message(code: 'default.button.create.label', default: 'Create')}" />
								</span>
							</div>
						</richui:tabContent>
					</richui:tabContents>
				</richui:tabView>

			</div>
		</g:form>
	</div>
</body>
</html>
