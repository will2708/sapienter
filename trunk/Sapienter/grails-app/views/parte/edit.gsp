

<%@ page import="sapienter.Parte" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'parte.label', default: 'Parte')}" />
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
 		var idProceso = $("#proceso").val();
 	var direccion = '${createLink(controller:'proceso', action:'show');}';
 	direccion = direccion + '/' + idProceso
 	document.location.href=direccion;  
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
        <g:hiddenField name="id" value="${parteInstance?.id}" />
        <g:hiddenField name="proceso" value="${documentoInstance?.proceso?.id}" />
        		<div class="buttonForm">
             	<span><g:actionSubmit class="delete" action="delete" value="${message(code: 'sapienter.borrar', default: 'Delete')}" 
             		onclick="confirmarBorrado();return false;" /></span>
             </div>
         </g:form>    
        <div class="body">
            <h1>Modificar parte</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${parteInstance}">
            <div class="errors">
                <g:renderErrors bean="${parteInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${parteInstance?.id}" />
                <g:hiddenField name="version" value="${parteInstance?.version}" />
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
								<g:hiddenField name="proceso" value="${parteInstance?.proceso?.id}" />
	                            <tr class="prop">
									<td valign="top" class="descripcion"><g:message code="sapienter.id" default="Id" /></td>
                            		<td valign="top" class="value">${fieldValue(bean: parteInstance, field: "id")}</td>	                            
									<td valign="top" class="descripcion">
	                                    <label for="proceso"><g:message code="proceso.proceso" default="Proceso" /></label></td>
									<td valign="top" class="value"><g:link controller="proceso" action="show" id="${parteInstance?.proceso?.id}">${parteInstance?.proceso?.encodeAsHTML()}</g:link></td>                            
	                            </tr>          
	                            <tr><td><br></td></tr>                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="tipo"><g:message code="parte.tipo" default="Tipo" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: parteInstance, field: 'tipo', 'errors')}">
	                                    <g:select class="textField" name="tipo.id" from="${sapienter.TipoDeParte.list()}" optionKey="id" value="${parteInstance?.tipo?.id}"  />
	                                </td>
	                            </tr>
	                        </table>
	                        </td>
	                        </tr>
								<tr>
                        			<td>
                        			<h2>Ingrese una nueva parte o seleccione la misma desde la lista de personas</h2>
                        			</td>
                        		</tr>                        	
                        		<tr>	                        
                        	<tr>
                        	<td>
                        	<table class="tabla_parte">
                        		<td>
                        			<table>
                       				<tr class="prop">
                             				<td valign="top" class="name">
                                   		<label for="apellido"><g:message code="persona.apellido" default="Apellido" /></label>
                               			</td>
                               			<td valign="top" class="value ${hasErrors(bean: parteInstance, field: 'apellido', 'errors')}">
                                   		<g:textField class="textField" name="apellido" value="${parteInstance?.apellido}" />
                               			</td>
                               		</tr>
                               		<tr class="prop">
		                                <td valign="top" class="name">
		                                    <label for="nombre"><g:message code="persona.nombre" default="Nombre" /></label>
		                                </td>
		                                <td valign="top" class="value ${hasErrors(bean: parteInstance, field: 'nombre', 'errors')}">
		                                    <g:textField class="textField" name="nombre" value="${parteInstance?.nombre}" />
		                                </td>                               			
                               		</tr>     
                        			</table>	
                        		</td>           		
                        		<td>
                        			<table>
		                            <tr class="prop">		
                  
		                                <td valign="top" class="name">
		                                    <label for="persona"><g:message code="sapienter.persona" default="Persona" /></label>
		                                </td>
		                                <td valign="top" class="value ${hasErrors(bean: parteInstance, field: 'persona', 'errors')}">
		                                    <g:select class="textField" name="persona.id" from="${sapienter.Persona.list()}" optionKey="id" value="${parteInstance?.persona?.id}" noSelection="['null': '']" />
		                                </td>
		                            </tr>                   			
                        			</table>
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
