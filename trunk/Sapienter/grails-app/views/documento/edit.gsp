

<%@ page import="sapienter.Documento" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'documento.label', default: 'Documento')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
        <g:javascript library="application" />
		<g:javascript library="jquery" plugin="jquery" />
		<jqui:resources theme="ui-lightness" />        
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
 	document.location.href='${createLink(controller:'persona', action:'list')}'; 
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
        <g:form>
        <g:hiddenField name="id" value="${documentoInstance?.id}" />
        		<div class="buttonForm">
             	<span><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="confirmarBorrado();return false;"  /></span>
             </div>
         </g:form>
        <div class="body">
            <h1>Modificar Documento</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${documentoInstance}">
            <div class="errors">
                <g:renderErrors bean="${documentoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${documentoInstance?.id}" />
                <g:hiddenField name="version" value="${documentoInstance?.version}" />
                <div class="dialog">
					<div class="margin">
						<div class="buttonNewObjects">
                    		<span><g:actionSubmit class="save" action="update" value="${message(code: 'sapienter.guardar', default: 'Update')}" /></span>
                    	</div>											
					</div>                          
                    <table class="tabla_edit">
                        <tbody>
                        <tr>
                        	<td>
                        	<table>		
	                        <tr class="prop">
	                            <td valign="top" class="descripcion"><g:message code="sapienter.id" default="Id" /></td>	                            
	                            <td valign="top" class="value">${fieldValue(bean: documentoInstance, field: "id")}</td>
 								<td valign="top" class="descripcion">
                                    <label for="proceso"><g:message code="proceso.proceso" default="Proceso" /></label></td>
								<td valign="top" class="value"><g:link controller="proceso" action="show" id="${documentoInstance?.proceso?.id}">${documentoInstance?.proceso?.encodeAsHTML()}</g:link></td>                            
	                        </tr>  
	                        <tr><td><br></td></tr>                      
							<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nombre"><g:message code="documento.nombre" default="Nombre" /><mandatory> *</mandatory></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: documentoInstance, field: 'nombre', 'errors')}">
                                    <g:textField class="textField"  name="nombre" value="${documentoInstance?.nombre}" />
                                </td>
                                <td valign="top" class="name">
                                  <label for="descripcion"><g:message code="proceso.descripcion" default="Descripcion" /><mandatory> *</mandatory></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: documentoInstance, field: 'descripcion', 'errors')}">
                                    <g:textField class="textField"  name="descripcion" value="${documentoInstance?.descripcion}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="estado"><g:message code="proceso.estado" default="Estado" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: documentoInstance, field: 'estado', 'errors')}">
                                    <g:select class="textField"  name="estado" from="${documentoInstance.constraints.estado.inList}" value="${documentoInstance?.estado}" valueMessagePrefix="documento.estado"  />
                                </td>
                                <td valign="top" class="name">
                                  <label for="tipoDeDocumento"><g:message code="documento.tipoDeDocumento" default="Tipo De Documento" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: documentoInstance, field: 'tipoDeDocumento', 'errors')}">
                                    <g:select class="textField" name="tipoDeDocumento" from="${documentoInstance.constraints.tipoDeDocumento.inList}" value="${documentoInstance?.tipoDeDocumento}" valueMessagePrefix="documento.tipoDeDocumento"  />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="usuarioResponsable"><g:message code="documento.usuarioResponsable.label" default="Usuario Responsable" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: documentoInstance, field: 'usuarioResponsable', 'errors')}">
                                    <g:select class="textField" name="usuarioResponsable.id" from="${sapienter.Usuario.list()}" optionKey="id" value="${documentoInstance?.usuarioResponsable?.id}"  />
                                </td>
                            </tr>
                        	</table>
                        	</td>
                        </tr>
                        <tr>
                        	<td>
                        	<table>
                            <tr class="prop">
                                <td valign="top" class="value ${hasErrors(bean: documentoInstance, field: 'contenidoDocumento', 'errors')}">
                                   <fckeditor:editor 
                                    	name="contenidoDocumento"
                                    	width="200%"
                                    	body="disabled"
                                    	value="${documentoInstance?.contenidoDocumento}">
                                     	${documentoInstance?.contenidoDocumento}
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
    </body>
</html>
