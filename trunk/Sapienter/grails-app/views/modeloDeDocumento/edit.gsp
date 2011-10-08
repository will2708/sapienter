

<%@ page import="sapienter.ModeloDeDocumento" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'modeloDeDocumento.label', default: 'ModeloDeDocumento')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
        <g:javascript library="prototype" />
        <g:javascript library="jquery" plugin="jquery" />
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${modeloDeDocumentoInstance}">
            <div class="errors">
                <g:renderErrors bean="${modeloDeDocumentoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" id="id" value="${modeloDeDocumentoInstance?.id}" />
                <g:hiddenField name="version" value="${modeloDeDocumentoInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nombre"><g:message code="modeloDeDocumento.nombre.label" default="Nombre" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: modeloDeDocumentoInstance, field: 'nombre', 'errors')}">
                                    <g:textField name="nombre" value="${modeloDeDocumentoInstance?.nombre}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="descripcion"><g:message code="modeloDeDocumento.descripcion.label" default="Descripcion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: modeloDeDocumentoInstance, field: 'descripcion', 'errors')}">
                                    <g:textField name="descripcion" value="${modeloDeDocumentoInstance?.descripcion}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="categoria"><g:message code="modeloDeDocumento.categoria.label" default="Categoria" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: modeloDeDocumentoInstance, field: 'categoria', 'errors')}">
                                    <g:select optionKey="id"
									        optionValue="nombreCategoria" 
								    		       name="categoria.id"
								    		         id="nombreCategoria"
										           from="${sapienter.Categoria.list()}"
										    noSelection="${[' ':'Seleccione Categoria']}"
										          value="${modeloDeDocumentoInstance?.categoria?.id}" 
										       onchange="${remoteFunction(controller:'categoria', 
										  							 action:'ajaxGetSubcategorias',
							           								 params:'\'id=\' + escape(this.value)',
							        								 onComplete:'updateSubcategorias(e)')}"
							        ></g:select>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="subCategoria"><g:message code="modeloDeDocumento.subCategoria.label" default="Sub Categoria" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: modeloDeDocumentoInstance, field: 'subCategoria', 'errors')}">
                                    <g:select optionKey="id"
                                    		  optionValue="subTipoCategoria"
                                    		  name="subCategoria.id" 
                                                id="subTipoCategoria" 
                                                value="${modeloDeDocumentoInstance?.subCategoria?.id}"                                    
                                    ></g:select>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="estado"><g:message code="modeloDeDocumento.estado.label" default="Estado" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: modeloDeDocumentoInstance, field: 'estado', 'errors')}">
                                    <g:textField name="estado" value="${modeloDeDocumentoInstance?.estado}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="modeloDeDocumento"><g:message code="modeloDeDocumento.modeloDeDocumento.label" default="Modelo De Documento" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: modeloDeDocumentoInstance, field: 'modeloDeDocumento', 'errors')}">
                                    <fckeditor:editor 
                                    	name="modeloDeDocumento"
                                    	width="100%"
                                    	body="disabled"
                                    	value="${modeloDeDocumentoInstance?.modeloDeDocumento}">
                                     	${modeloDeDocumentoInstance?.modeloDeDocumento}
                                     </fckeditor:editor>                                 </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
								<g:javascript>
      								$(function() {
										
										var idmod = document.getElementById('id');
																														
										var zselect = document.getElementById('nombreCategoria');

										var zopt = zselect.options[zselect.selectedIndex];

										${remoteFunction(controller:"categoria", action:"ajaxGetSubcategorias", params:"'id=' + zopt.value + '&modelo=' + idmod.value", onComplete:"updateSubcategorias(e)")}								
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
