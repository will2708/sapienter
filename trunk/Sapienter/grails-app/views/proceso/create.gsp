

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
	<div>
	<div class="buttonSubMenu">
		<span><g:link class="list" action="list"><g:message code="sapienter.proceso" args="[entityName]" /></g:link></span>
	</div>
	</div>
	<div class="body">
		<g:if test="${flash.message}">
			<div class="message">${flash.message}</div>
		</g:if>
		<g:hasErrors bean="${procesoInstance}">
			<div class="errors"><g:renderErrors bean="${procesoInstance}" as="list" /></div>
		</g:hasErrors>
		<g:form action="save">
			<div class="dialog">
				<div class="margin">
					<div class="buttonNewObjects">
						<span><g:submitButton name="create" class="save" value="${message(code: 'sapienter.guardar', default: 'Create')}" /></span>
					</div>
				</div>
				<table class="tabla">
					<tbody>
					<tr>
						<td>
						<table>
							<g:hiddenField name="persona" value="${procesoInstance?.persona?.id}" />
							<tr class="prop">
								<td valign="top" class="descripcion"><label for="persona"><g:message
											code="proceso.persona" default="Persona" />
								</label></td>
								<td valign="top"
									class="value ${hasErrors(bean: procesoInstance, field: 'persona', 'errors')}">
									${procesoInstance?.persona}
								</td>
							</tr>				
							<tr><td><br></td></tr>  
							<tr class="prop">
								<td valign="top" class="name"><label for="categoria"><g:message code="proceso.categoria" default="Categoria" /><mandatory> *</mandatory></label></td>
								<td valign="top" class="value ${hasErrors(bean: procesoInstance, field: 'categoria', 'errors')}">
									<g:select class="textField" optionKey="id"
										    					optionValue="nombreCategoria" 
									    		   				name="categoria.id"
												  		        from="${sapienter.Categoria.list()}"
														        noSelection="${[' ':'Seleccione Categoria']}"
														        value="${procesoInstance?.categoria?.id}" 
														        onchange="${remoteFunction(controller:'categoria', 
														  							 action:'ajaxGetSubcategorias',
											           								 params:'\'id=\' + escape(this.value)',
											        								 onComplete:'updateSubcategorias(e)')}"></g:select>
								</td>
								<td valign="top" class="name"><label for="subCategoria"><g:message code="proceso.subcategoria" default="Sub Categoria" /></label></td>
								<td valign="top" class="value ${hasErrors(bean: procesoInstance, field: 'subCategoria', 'errors')}">
									<g:select class="textField" name="subCategoria" id="subTipoCategoria" value="${procesoInstance?.subCategoria?.id}" ></g:select></td>							
							</tr>
							<tr class="prop">
								<td valign="top" class="name"><label for="caratula"><g:message code="proceso.caratula" default="Caratula" /><mandatory> *</mandatory></label></td>
								<td valign="top" class="value ${hasErrors(bean: procesoInstance, field: 'caratula', 'errors')}">
									<g:textField class="textField" name="caratula" value="${procesoInstance?.caratula}" /></td>
								<td valign="top" class="name"><label for="descripcion"><g:message code="proceso.descripcion" default="Descripcion" /><mandatory> *</mandatory></label></td>	
								<td valign="top" class="value ${hasErrors(bean: procesoInstance, field: 'descripcion', 'errors')}">
									<g:textField class="textField" name="descripcion" value="${procesoInstance?.descripcion}" /></td>
							</tr>
							<tr class="prop">
								<td valign="top" class="name"><label for="estado"><g:message code="proceso.estado" default="Estado" /></label></td>
								<td valign="top" class="value ${hasErrors(bean: procesoInstance, field: 'estado', 'errors')}">
									<g:select class="textField" name="estado" from="${procesoInstance.constraints.estado.inList}" value="${procesoInstance?.estado}" valueMessagePrefix="proceso.estado"  /></td>
								<td valign="top" class="name"><label for="etapaProcesal"><g:message code="proceso.etapaProcesal" default="Etapa Procesal" /></label></td>
								<td valign="top" class="value ${hasErrors(bean: procesoInstance, field: 'etapaProcesal', 'errors')}">
									<g:select class="textField" name="etapaProcesal" from="${procesoInstance.constraints.etapaProcesal.inList}" value="${procesoInstance?.etapaProcesal}" valueMessagePrefix="proceso.etapaProcesal"  />
							</tr>
							<tr class="prop">
								<td valign="top" class="name"><label for="juzgado"><g:message code="proceso.juzgado" default="Juzgado" /></label></td>
								<td valign="top" class="value ${hasErrors(bean: procesoInstance, field: 'juzgado', 'errors')}">
									<g:select class="textField" name="juzgado.id" from="${sapienter.Juzgado.list()}"
											  optionKey="id" value="${procesoInstance?.juzgado?.id}"
										  	  noSelection="['null': '']" /></td>
								<td valign="top" class="name"><label for="numeroDeProcesoEnJuzgado"><g:message
																	 code="proceso.numeroDeProcesoEnJuzgado"
											    					 default="Numero De Proceso En Juzgado" /></label></td>
								<td valign="top" class="value ${hasErrors(bean: procesoInstance, field: 'numeroDeProcesoEnJuzgado', 'errors')}">
									<g:textField class="textField" name="numeroDeProcesoEnJuzgado"
										value="${fieldValue(bean: procesoInstance, field: 'numeroDeProcesoEnJuzgado')}" /></td>
							</tr>
	
							<tr class="prop">
								<td valign="top" class="name"><label for="responsable"><g:message
											code="proceso.responsable" default="Responsable" /><mandatory> *</mandatory></label></td>
								<td valign="top" class="value ${hasErrors(bean: procesoInstance, field: 'responsable', 'errors')}">
									<g:select class="textField" name="responsable.id"
										from="${sapienter.Usuario.list()}" optionKey="id"
										value="${procesoInstance?.responsable?.id}"
										noSelection="['null': '']" /></td>
								<td valign="top" class="name"><label for="usuariosAutorizados"><g:message
																	 code="proceso.usuariosAutorizados"
											  						 default="Usuarios Autorizados" /></label></td>
								<td valign="top" class="value ${hasErrors(bean: procesoInstance, field: 'usuariosAutorizados', 'errors')}">
									<g:select  class="textField" name="usuariosAutorizados.id" from="${sapienter.Usuario.list()}" optionKey="id"
										value="${procesoInstance?.usuariosAutorizados?.id}" /></td>
							</tr>							
							<tr class="prop">
								<td valign="top" class="name"><label for="ultimoModificador"><g:message
											code="proceso.ultimoModificador"
											default="Ultimo Modificador" /></label></td>
								<td valign="top"
									class="value ${hasErrors(bean: procesoInstance, field: 'ultimoModificador', 'errors')}">
									<g:select  class="textField"  name="ultimoModificador.id"
																  from="${sapienter.Usuario.list()}" optionKey="id"
																  value="${procesoInstance?.ultimoModificador?.id}" /></td>
							</tr>
						</table>
						</td>
					</tr>
					<tr>
						<td>
						<table>	
							<tr class="prop">
								<td valign="top" class="descripcion"><label for="observaciones"><g:message
										code="sapienter.observaciones" default="Observaciones" /></label></td>
								<td valign="top" class="value ${hasErrors(bean: procesoInstance, field: 'observaciones', 'errors')}">
									<g:textArea class="textField"  name="observaciones" value="${procesoInstance?.observaciones}" /></td>
							</tr>
						</table>
						</td>
					</tr>
					</tbody>
				</table>
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