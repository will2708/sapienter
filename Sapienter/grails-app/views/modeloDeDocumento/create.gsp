

<%@ page import="sapienter.ModeloDeDocumento" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'modeloDeDocumento.label', default: 'ModeloDeDocumento')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    	<g:javascript library="prototype" />
    </head>
    <body>
    	<div>
        <div class = "buttonSubMenu">
            <span><g:link class="list" action="list"><g:message code="sapienter.modelosDeDocumento" args="[entityName]" /></g:link></span>
        </div>
        </div>	
        <div class="body">
        	<fckeditor:config CustomConfigurationsPath="${resource(dir:'js',file:'fkeditor.js')}"/>
        	<h1>Crear modelos de documento</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${modeloDeDocumentoInstance}">
            <div class="errors">
                <g:renderErrors bean="${modeloDeDocumentoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                	<div class="margin">
			    	<div class="buttonNewObjects">
                    	<span><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                	</div>
                	</div>
                    <table class="tabla_calendario">
                        <tbody>
                        <tr>
                        	<td>
                        	<table>
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="nombre"><g:message code="documento.nombre" default="Nombre" /><mandatory> *</mandatory></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: modeloDeDocumentoInstance, field: 'nombre', 'errors')}">
	                                    <g:textField class="textField" name="nombre" value="${modeloDeDocumentoInstance?.nombre}" />
	                                </td>
	                                <td valign="top" class="name">
	                                    <label for="descripcion"><g:message code="proceso.descripcion" default="Descripcion" /><mandatory> *</mandatory></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: modeloDeDocumentoInstance, field: 'descripcion', 'errors')}">
	                                    <g:textField class="textField" name="descripcion" value="${modeloDeDocumentoInstance?.descripcion}" />
	                                </td>
	                            </tr>
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="categoria"><g:message code="proceso.categoria" default="Categoria" /><mandatory> *</mandatory></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: modeloDeDocumentoInstance, field: 'categoria', 'errors')}">
	                                    <g:select class="textField" optionKey="id"
										    optionValue="nombreCategoria" 
									    		   name="categoria.id"
											      from="${sapienter.Categoria.list()}"
											      noSelection="${[' ':'Seleccione Categoria']}"
											      value="${modeloDeDocumentoInstance?.categoria?.id}" 
											  onchange="${remoteFunction(controller:'categoria', 
											  							 action:'ajaxGetSubcategorias',
								           								 params:'\'id=\' + escape(this.value)',
								        								 onComplete:'updateSubcategorias(e)')}"
								     ></g:select></td>
	                                <td valign="top" class="name">
	                                    <label for="subCategoria"><g:message code="proceso.subCategoria" default="Sub Categoria" /><mandatory> *</mandatory></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: modeloDeDocumentoInstance, field: 'subCategoria', 'errors')}">
	                                    <g:select class="textField" name="subCategoria" id="subTipoCategoria" value="${modeloDeDocumentoInstance?.subCategoria?.id}"></g:select>
	                                </td>
	                            </tr>
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="estado"><g:message code="proceso.estado" default="Estado" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: modeloDeDocumentoInstance, field: 'estado', 'errors')}">
	                                    <g:select class="textField" name="estado" from="${modeloDeDocumentoInstance.constraints.estado.inList}" value="${modeloDeDocumentoInstance?.estado}" valueMessagePrefix="modeloDeDocumento.estado"  />
	                                </td>
	                            </tr>
	                            </table>
	                            </td>
	                      </tr>
	                      <tr>
	                      	<td>
	                      	<table>
	                            <tr class="prop">
	                                <td valign="top" class="descripcion" >
	                                    <label>Ingrese las variables con el formato ::Descripcion:: <br></label></td>
	                            </tr>
                             </table>
                            </td>
                         </tr>
                         <tr>
                             <td>
                             <table>
		                     	<tr class="prop">
		                           <td valign="top" class="value ${hasErrors(bean: modeloDeDocumentoInstance, field: 'modeloDeDocumento', 'errors')}">
		                                    <fckeditor:editor 
		                                    	name="modeloDeDocumento"
		                                    	width="700px"
		                                    	heigh="200%"
		                                    	toolbar="Sapienter"
		                                    	body="disabled"
		                                    	value="${modeloDeDocumentoInstance?.modeloDeDocumento}">
		                                     	${modeloDeDocumentoInstance?.modeloDeDocumento}
		                                     </fckeditor:editor> 
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
    </body>
</html>
