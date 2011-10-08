

<%@ page import="sapienter.Proceso"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<g:set var="entityName"
	value="${message(code: 'proceso.label', default: 'Proceso')}" />
<title><g:message code="default.create.label"
		args="[entityName]" />
</title>
<g:javascript library="prototype" />
</head>
<body>
	<div class="nav">
		<span class="menuButton"><a class="home"
			href="${createLink(uri: '/')}"><g:message
					code="default.home.label" />
		</a>
		</span> <span class="menuButton"><g:link class="list" action="list">
				<g:message code="default.list.label" args="[entityName]" />
			</g:link>
		</span>
	</div>
	<div class="body">
		<h1>
			<g:message code="default.create.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message">
				${flash.message}
			</div>
		</g:if>
		<g:hasErrors bean="${procesoInstance}">
			<div class="errors">
				<g:renderErrors bean="${procesoInstance}" as="list" />
			</div>
		</g:hasErrors>
		<g:form action="save">
			<div class="dialog">
				<table>
					<tbody>

						<tr class="prop">
							<td valign="top" class="name"><label for="categoria"><g:message
										code="proceso.categoria.label" default="Categoria" />
							</label></td>
							<td valign="top"
								class="value ${hasErrors(bean: procesoInstance, field: 'categoria', 'errors')}">
								<g:select optionKey="id"
									    optionValue="nombreCategoria" 
								    		   name="categoria.id"
										      from="${sapienter.Categoria.list()}"
										      noSelection="${[' ':'Seleccione Categoria']}"
										      value="${procesoInstance?.categoria?.id}" 
										  onchange="${remoteFunction(controller:'categoria', 
										  							 action:'ajaxGetSubcategorias',
							           								 params:'\'id=\' + escape(this.value)',
							        								 onComplete:'updateSubcategorias(e)')}"
							     ></g:select>
							</td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="subCategoria"><g:message
										code="proceso.subcategoria.label" default="Sub Categoria" />
							</label></td>
							<td valign="top"
								class="value ${hasErrors(bean: procesoInstance, field: 'subCategoria', 'errors')}">
								<g:select name="subCategoria" id="subTipoCategoria" value="${procesoInstance?.subCategoria?.id}"></g:select>
							</td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="caratula"><g:message
										code="proceso.caratula.label" default="Caratula" />
							</label></td>
							<td valign="top"
								class="value ${hasErrors(bean: procesoInstance, field: 'caratula', 'errors')}">
								<g:textField name="caratula"
									value="${procesoInstance?.caratula}" /></td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="descripcion"><g:message
										code="proceso.descripcion.label" default="Descripcion" />
							</label></td>
							<td valign="top"
								class="value ${hasErrors(bean: procesoInstance, field: 'descripcion', 'errors')}">
								<g:textField name="descripcion"
									value="${procesoInstance?.descripcion}" /></td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="estado"><g:message
										code="proceso.estado.label" default="Estado" />
							</label></td>
							<td valign="top"
								class="value ${hasErrors(bean: procesoInstance, field: 'estado', 'errors')}">
								<g:select name="estado" from="${procesoInstance.constraints.estado.inList}" value="${procesoInstance?.estado}" valueMessagePrefix="proceso.estado"  />
							</td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="etapaProcesal"><g:message
										code="proceso.etapaProcesal.label" default="Etapa Procesal" />
							</label></td>
							<td valign="top"
								class="value ${hasErrors(bean: procesoInstance, field: 'etapaProcesal', 'errors')}">
								<g:select name="etapaProcesal" from="${procesoInstance.constraints.etapaProcesal.inList}" value="${procesoInstance?.etapaProcesal}" valueMessagePrefix="proceso.etapaProcesal"  />
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="juzgado"><g:message
										code="proceso.juzgado.label" default="Juzgado" />
							</label></td>
							<td valign="top"
								class="value ${hasErrors(bean: procesoInstance, field: 'juzgado', 'errors')}">
								<g:select name="juzgado.id" from="${sapienter.Juzgado.list()}"
									optionKey="id" value="${procesoInstance?.juzgado?.id}"
									noSelection="['null': '']" /></td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label
								for="numeroDeProcesoEnJuzgado"><g:message
										code="proceso.numeroDeProcesoEnJuzgado.label"
										default="Numero De Proceso En Juzgado" />
							</label></td>
							<td valign="top"
								class="value ${hasErrors(bean: procesoInstance, field: 'numeroDeProcesoEnJuzgado', 'errors')}">
								<g:textField name="numeroDeProcesoEnJuzgado"
									value="${fieldValue(bean: procesoInstance, field: 'numeroDeProcesoEnJuzgado')}" />
							</td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="observaciones"><g:message
										code="proceso.observaciones.label" default="Observaciones" />
							</label></td>
							<td valign="top"
								class="value ${hasErrors(bean: procesoInstance, field: 'observaciones', 'errors')}">
								<g:textField name="observaciones"
									value="${procesoInstance?.observaciones}" /></td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="responsable"><g:message
										code="proceso.responsable.label" default="Responsable" />
							</label></td>
							<td valign="top"
								class="value ${hasErrors(bean: procesoInstance, field: 'responsable', 'errors')}">
								<g:select name="responsable.id"
									from="${sapienter.Usuario.list()}" optionKey="id"
									value="${procesoInstance?.responsable?.id}"
									noSelection="['null': '']" /></td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="persona"><g:message
										code="proceso.persona.label" default="Persona" />
							</label></td>
							<td valign="top"
								class="value ${hasErrors(bean: procesoInstance, field: 'persona', 'errors')}">
								${procesoInstance?.persona}
							</td>
						</tr>
						<g:hiddenField name="persona" value="${procesoInstance?.persona?.id}" />
						<tr class="prop">
							<td valign="top" class="name"><label for="ultimoModificador"><g:message
										code="proceso.ultimoModificador.label"
										default="Ultimo Modificador" />
							</label></td>
							<td valign="top"
								class="value ${hasErrors(bean: procesoInstance, field: 'ultimoModificador', 'errors')}">
								<g:select name="ultimoModificador.id"
									from="${sapienter.Usuario.list()}" optionKey="id"
									value="${procesoInstance?.ultimoModificador?.id}" /></td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label
								for="usuariosAutorizados"><g:message
										code="proceso.usuariosAutorizados.label"
										default="Usuarios Autorizados" />
							</label></td>
							<td valign="top"
								class="value ${hasErrors(bean: procesoInstance, field: 'usuariosAutorizados', 'errors')}">
								<g:select name="usuariosAutorizados.id"
									from="${sapienter.Usuario.list()}" optionKey="id"
									value="${procesoInstance?.usuariosAutorizados?.id}" /></td>
						</tr>

					</tbody>
				</table>
			</div>
			<div class="buttons">
				<span class="button"><g:submitButton name="create"
						class="save"
						value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</span>
			</div>
		</g:form>
								<g:javascript>
									function updateSubcategorias(e) { 
									    var subTipoCategorias = eval("(" + e.responseText + ")")
									    if (subTipoCategorias) { 
									    	var rselect = document.getElementById('subTipoCategoria')
									
									    	// Clear all previous options
									    	var l = rselect.length
									
									    	while (l > 0) { 
									    		l--; 
									    		rselect.remove(l); 
									    	}
									
									    	// Rebuild the select
									    	for (var i=0; i < subTipoCategorias.length; i++) { 
									    		var subCategoria = subTipoCategorias[i];
									    		var opt = document.createElement('option'); 
									    		opt.text = subCategoria.subTipoCategoria;
									    		opt.value = subCategoria.id;
									    		try { 
									    			rselect.add(opt, null); // standard compliant; doesn't work in IE
									    		}
									    		catch(ex) { 
									    			rselect.add(opt); // IE only
									    		}
									    	}
									    }
									}
								</g:javascript>						     		
	</div>
</body>
</html>
<g:javascript src="sapienter.js">
</g:javascript>