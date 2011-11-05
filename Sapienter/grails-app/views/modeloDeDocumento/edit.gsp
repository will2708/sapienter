<%@ page import="sapienter.ModeloDeDocumento" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'modeloDeDocumento.label', default: 'ModeloDeDocumento')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
        <g:javascript library="prototype" />
        <g:javascript library="jquery" plugin="jquery" />
        <jqui:resources theme="ui-lightness" />
        <g:javascript library="application" />
    </head>
    <body>
<div id="dialog" title="Confirmaci&oacuten de borrado">
  Est&aacute seguro que desea borrar esta instancia?
</div>

<g:javascript>
$(document).ready(function() {
    $("#dialog").dialog({
      autoOpen: false,
	  resizable: false,
	  height:140,
      modal: true
    });
  });
 function success(){ 
 	document.location.href='${createLink(controller:'modeloDeDocumento', action:'list')}'; 
 }; 
 function failure(){ 
	document.location.reload(true); 
 }; 
  
  function confirmarBorrado() {
	var idObjeto = $("#id").val();

    $("#dialog").dialog({
      buttons : {
        "Si" : function() {
         ${remoteFunction(action:"delete", params:"'id=' + idObjeto", onSuccess:'success();', onFailure:'failure();')};
         $(this).dialog("close");
        },
        "No" : function() {
          $(this).dialog("close");
        }
      }
	});
	$("#dialog").dialog("open");
    }
</g:javascript>        
    	<div>
        <div class="buttonSubMenu">
            <span><g:link class="list" action="list"><g:message code="sapienter.modelosDeDocumento" args="[entityName]" /></g:link></span>
        </div>
           <g:form>
           <g:hiddenField name="id" value="${modeloDeDocumentoInstance?.id}" />
           		<div class="buttonForm">
                	<span><g:actionSubmit class="delete" action="delete" value="${message(code: 'sapienter.borrar', default: 'Delete')}" 
                		onclick="confirmarBorrado();return false;" /></span>
                </div>
            </g:form>
        </div>
        <div class="body">
        	<fckeditor:config CustomConfigurationsPath="${resource(dir:'js',file:'fkeditor.js')}"/>
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
                	<div class="margin">
	                <div class="buttonNewObjects">
	                    <span><g:actionSubmit class="save" action="update" value="${message(code: 'sapienter.guardar', default: 'Update')}" /></span>
	                </div>             
	                </div>  
                    <table class="tabla_calendario">
                        <tbody>
                        	<tr>
                        		<td>
                        		<table>
			                        <tr class="prop">
			                            <td valign="top" class="descripcion"><g:message code="sapienter.id" default="Id" /></td>
			                            <td valign="top" class="value">${fieldValue(bean: modeloDeDocumentoInstance, field: "id")}</td>
			                        </tr>
			                    	<tr><td><br></td></tr>                        
		                            <tr class="prop">
		                                <td valign="top" class="name">
		                                  <label for="nombre"><g:message code="documento.nombre" default="Nombre" /><mandatory> *</mandatory></label></td>
		                                <td valign="top" class="value ${hasErrors(bean: modeloDeDocumentoInstance, field: 'nombre', 'errors')}">
		                                    <g:textField name="nombre" value="${modeloDeDocumentoInstance?.nombre}" /></td>
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
										    		         id="nombreCategoria"
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
		                                    <g:select class="textField" optionKey="id"
		                                    		  optionValue="subTipoCategoria"
		                                    		  name="subCategoria.id" 
		                                                id="subTipoCategoria" 
		                                                value="${modeloDeDocumentoInstance?.subCategoria?.id}"                                    
		                                    ></g:select>
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
		                                <td valign="top" class="value ${hasErrors(bean: modeloDeDocumentoInstance, field: 'modeloDeDocumento', 'errors')}">
		                                    <fckeditor:editor 
		                                    	name="modeloDeDocumento"
		                                    	width="700px"
		                                    	heigh="200%"
		                                    	toolbar="Sapienter"
		                                    	body="disabled"
		                                    	value="${modeloDeDocumentoInstance?.modeloDeDocumento}">
		                                     	${modeloDeDocumentoInstance?.modeloDeDocumento}
		                                     </fckeditor:editor></td>
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
