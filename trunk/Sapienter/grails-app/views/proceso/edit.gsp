

<%@ page import="sapienter.Proceso" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'proceso.label', default: 'Proceso')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
        <g:javascript library="prototype" />
        <g:javascript library="jquery" plugin="jquery" />
    </head>
    <body>
    	<div>
        <div class="buttonSubMenu">            
            <span><g:link class="list" action="list"><g:message code="sapienter.proceso" args="[entityName]" /></g:link></span>
        </div>
	 	<div class="buttonForm"> 
			<span><g:actionSubmit class="delete" action="delete" value="${message(code: 'sapienter.borrar', default: 'Delete')}"
					onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
			</span>
		</div>        
<!--         <div class="buttonSubMenu">
            <span><g:link class="create" action="create"><g:message code="sapienter.crear" args="[entityName]" /></g:link></span>
        </div> -->        
        </div>
        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${procesoInstance}">
            <div class="errors">
                <g:renderErrors bean="${procesoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" id="id" value="${procesoInstance?.id}" />
                <g:hiddenField name="version" value="${procesoInstance?.version}" />
                <div class="dialog">
                	<div class="margin">
                		<g:form>
                		<div class="buttonNewObjects">
                    		<span><g:actionSubmit class="save" action="update" value="${message(code: 'sapienter.guardar', default: 'Update')}" /></span>
                    	</div>
                		</g:form>
                		<g:form>
                		<div class="buttonNewObjects">     
                			<g:hiddenField name="id" value="${procesoInstance?.id}" />               		
                   			<span><g:actionSubmit class="create" action="crearDocumento" value="${message(code: 'proceso.crearDocumento', default: 'Update')}" /></span>                   			 
                    	</div>
                    	</g:form>
                    	<div class="buttonNewObjects">
                    	    <g:hiddenField name="id" value="${procesoInstance?.id}" />  
							<span><g:actionSubmit class="create" action="crearGasto" value="${message(code: 'proceso.crearGasto', default: 'Update')}" /></span>                  		
                		</div>
                		<div class="buttonNewObjects">
							<g:hiddenField name="id" value="${procesoInstance?.id}" />  
							<span><g:actionSubmit class="create" action="crearMovimiento" value="${message(code: 'proceso.crearMovimiento', default: 'Update')}" /></span>                		
                		</div>
                		<div class="buttonNewObjects">
                			<g:hiddenField name="id" value="${procesoInstance?.id}" />  							
							<span><g:actionSubmit class="create" action="crearParte" value="${message(code: 'proceso.crearParte', default: 'Update')}" /></span>							
						</div>						
                	</div>
                    <table class="tabla_edit">
                        <tbody>
                        <tr>
                        	<td>
                        	<table>
                            	<tr class="prop">
                                	<td valign="top" class="descripcion">
                                  		<label for="persona"><g:message code="sapienter.persona" default="Persona" /></label></td>
										<td valign="top" class="value"><g:link controller="persona" action="show" id="${procesoInstance?.persona?.id}">
											${procesoInstance?.persona?.encodeAsHTML()}</g:link></td>
									<td valign="top" class="descripcion"><g:message code="sapienter.id" default="Identificador:" /></td>
									<td valign="top" class="value"> ${fieldValue(bean: procesoInstance, field: "id")}</td>		                                    		
                            	</tr>                        	
	                              <tr><td><br></td></tr>                            	
                            	<tr class="prop">
                                	<td valign="top" class="name">
                                  		<label for="categoria"><g:message code="proceso.categoria" default="Categoria" /><mandatory> *</mandatory></label></td>
                                	<td valign="top" class="value ${hasErrors(bean: procesoInstance, field: 'categoria', 'errors')}">
                                   	<g:select class="textField" optionKey="id"
									       optionValue="nombreCategoria" 
								    		      name="categoria.id"
								    		        id="nombreCategoria"
										          from="${sapienter.Categoria.list()}"
										   noSelection="${[' ':'Seleccione Categoria']}" 
										         value="${procesoInstance?.categoria?.id}"										      
										      onchange="${remoteFunction(controller:'categoria', 
										  							 action:'ajaxGetSubcategorias',
							           								 params:'\'id=\' + escape(this.value)',
							        								 onComplete:'updateSubcategorias(e)')}"></g:select></td>
                                	<td valign="top" class="name">
                                  		<label for="subCategoria"><g:message code="proceso.subCategoria" default="Sub Categoria" /></label></td>
                                	<td valign="top" class="value ${hasErrors(bean: procesoInstance, field: 'subCategoria', 'errors')}">
<%--                                    <g:select name="subCategoria.id" from="${sapienter.Subcategoria.list()}" optionKey="id" value="${procesoInstance?.subCategoria?.id}" noSelection="['null': '']" /> --%>
										<g:select class="textField" optionKey="id"
									    	    optionValue="subTipoCategoria" 
										               name="subCategoria.id" 
										                 id="subTipoCategoria" 
										              value="${procesoInstance?.subCategoria?.id}"></g:select></td>
                            	</tr>
                            	<tr class="prop">
                                	<td valign="top" class="name">
                                  		<label for="caratula"><g:message code="proceso.caratula" default="Caratula" /><mandatory> *</mandatory></label></td>
                                	<td valign="top" class="value ${hasErrors(bean: procesoInstance, field: 'caratula', 'errors')}">
                                    	<g:textField class="textField" name="caratula" value="${procesoInstance?.caratula}" /></td>
                                	<td valign="top" class="name">
                                  		<label for="descripcion"><g:message code="proceso.descripcion" default="Descripcion" /><mandatory> *</mandatory></label></td>
                                	<td valign="top" class="value ${hasErrors(bean: procesoInstance, field: 'descripcion', 'errors')}">
                                    	<g:textField class="textField" name="descripcion" value="${procesoInstance?.descripcion}" /></td>
                            	</tr>
                            	<tr class="prop">
                                	<td valign="top" class="name">
                                  		<label for="estado"><g:message code="proceso.estado" default="Estado" /></label></td>
                                	<td valign="top" class="value ${hasErrors(bean: procesoInstance, field: 'estado', 'errors')}">
                                    	<g:textField class="textField" name="estado" value="${procesoInstance?.estado}" /></td>
                                	<td valign="top" class="name">
                                  		<label for="etapaProcesal"><g:message code="proceso.etapaProcesal" default="Etapa Procesal" /></label></td>
                                	<td valign="top" class="value ${hasErrors(bean: procesoInstance, field: 'etapaProcesal', 'errors')}">	
                                    	<g:textField class="textField" name="etapaProcesal" value="${procesoInstance?.etapaProcesal}" /></td>
                            	</tr>                        
                            	<tr class="prop">
                                	<td valign="top" class="name">
                                  		<label for="juzgado"><g:message code="proceso.juzgado" default="Juzgado" /></label></td>
                                	<td valign="top" class="value ${hasErrors(bean: procesoInstance, field: 'juzgado', 'errors')}">
                                    	<g:select class="textField" name="juzgado.id" from="${sapienter.Juzgado.list()}" optionKey="id" value="${procesoInstance?.juzgado?.id}" noSelection="['null': '']" /></td>
    	                            <td valign="top" class="name">
        	                        	<label for="numeroDeProcesoEnJuzgado"><g:message code="proceso.numeroDeProcesoEnJuzgado" default="Numero De Proceso En Juzgado" /></label></td>
	                                <td valign="top" class="value ${hasErrors(bean: procesoInstance, field: 'numeroDeProcesoEnJuzgado', 'errors')}">
    	                                <g:textField class="textField" name="numeroDeProcesoEnJuzgado" value="${fieldValue(bean: procesoInstance, field: 'numeroDeProcesoEnJuzgado')}" /></td>
                            	</tr>                                                  
                            	<tr class="prop">
                                	<td valign="top" class="name">
                                  		<label for="responsable"><g:message code="proceso.responsable" default="Responsable" /><mandatory> *</mandatory></label></td>
                                	<td valign="top" class="value ${hasErrors(bean: procesoInstance, field: 'responsable', 'errors')}">
                                    	<g:select class="textField" name="responsable.id" from="${sapienter.Usuario.list()}" optionKey="id" value="${procesoInstance?.responsable?.id}" noSelection="['null': '']" /></td>
                                	<td valign="top" class="name">
                                  		<label for="usuariosAutorizados"><g:message code="proceso.usuariosAutorizados" default="Usuarios Autorizados" /></label></td>
                                	<td valign="top" class="value ${hasErrors(bean: procesoInstance, field: 'usuariosAutorizados', 'errors')}">
                                    	<g:select class="textField" name="usuariosAutorizados.id" from="${sapienter.Usuario.list()}" optionKey="id" value="${procesoInstance?.usuariosAutorizados*.id}"  multiple="true"/></td>                                    	
	                              </tr>
								  <tr><td><br></td></tr>
		                          <tr class="prop">  
	                                <td valign="top" class="descripcion">
    	                              <label for="documentos"><g:message code="proceso.documentos" default="Documentos" /></label></td>
                                	<td valign="top" class="textField" class="value ${hasErrors(bean: procesoInstance, field: 'documentos', 'errors')}">
									<ul>
										<g:each in="${procesoInstance?.documentos?}" var="d">
										    <li><g:link controller="documento" action="show" id="${d.id}"> ${d?.encodeAsHTML()} </g:link></li>
										</g:each>
									</ul></td>
<!--  							<g:link controller="documento" action="create" params="['proceso.id': procesoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'documento.label', default: 'Documento')])}</g:link> -->                              
                                <td valign="top" class="descripcion">
                                  <label for="gastos"><g:message code="sapienter.gastos" default="Gastos" /></label></td>
                                <td valign="top" class="textField" class="value ${hasErrors(bean: procesoInstance, field: 'gastos', 'errors')}">                                    
								<ul>
									<g:each in="${procesoInstance?.gastos?}" var="g">
									    <li><g:link controller="gasto" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></li>
									</g:each>
								</ul></td>                               
                            </tr>            
							<tr><td><br></td></tr>                                        
                            <tr class="prop">
                                <td valign="top" class="descripcion">
                                  <label for="movimientos"><g:message code="sapienter.movimientos" default="Movimientos" /></label></td>
                                <td valign="top" class="textField" class="value ${hasErrors(bean: procesoInstance, field: 'movimientos', 'errors')}">                                   
								<ul>
									<g:each in="${procesoInstance?.movimientos?}" var="m">
									    <li><g:link controller="movimiento" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
									</g:each>
								</ul></td>
                                <td valign="top" class="descripcion">
                                  <label for="partes"><g:message code="sapienter.partes" default="Partes" /></label></td>
                                <td valign="top" class="textField" class="value ${hasErrors(bean: procesoInstance, field: 'partes', 'errors')}">
								<ul>
									<g:each in="${procesoInstance?.partes?}" var="p">
									    <li><g:link controller="parte" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
									</g:each>
								</ul></td>                               
                            </tr>
							<tr><td><br></td></tr>
<!--                            <tr class="prop">
                                <td valign="top" class="descripcion">
                                  <label for="procesosRelacionados"><g:message code="proceso.procesosRelacionados" default="Procesos Relacionados" default="none"/></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: procesoInstance, field: 'procesosRelacionados', 'errors')}">
                                    <g:select class="textField" name="procesosRelacionados" from="${sapienter.Proceso.list()}" multiple="yes" optionKey="id" size="5" value="${procesoInstance?.procesosRelacionados*.id}" />
                                </td>
                            </tr> -->                                                    
<!--                              <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="ultimoModificador"><g:message code="proceso.ultimoModificador.label" default="Ultimo Modificador" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: procesoInstance, field: 'ultimoModificador', 'errors')}">
                                    <g:select name="ultimoModificador.id" from="${sapienter.Usuario.list()}" optionKey="id" value="${procesoInstance?.ultimoModificador?.id}"  />
                                </td>
                            </tr>
-->                        
                            </table>
                            </td>
                         </tr>
                         <tr>
                         	<td>
                         	<table>	
                            	<tr class="prop">
                               		<td valign="top" class="descripcion">
                                  		<label for="observaciones"><g:message code="sapienter.observaciones" default="Observaciones" /></label></td>
                                	<td valign="top" class="value ${hasErrors(bean: procesoInstance, field: 'observaciones', 'errors')}">
                                    	<g:textArea class="textField" name="observaciones" value="${procesoInstance?.observaciones}" /></td>
                            	</tr>
                            </table>
                            </td>
                          </tr>     
                        </tbody>
                    </table>
                </div>
            </g:form>
      								<g:javascript>
      								$(function() {
										
										var idProceso = document.getElementById('id');
																														
										var zselect = document.getElementById('nombreCategoria');

										var zopt = zselect.options[zselect.selectedIndex];

										${remoteFunction(controller:"categoria", action:"ajaxGetSubcategorias", params:"'id=' + zopt.value + '&proceso=' + idProceso.value", onComplete:"updateSubcategorias(e)")}								
									});
									
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
