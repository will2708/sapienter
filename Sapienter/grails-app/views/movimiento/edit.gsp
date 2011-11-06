

<%@ page import="sapienter.Movimiento" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'movimiento.label', default: 'Movimiento')}" />
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
	        <g:hiddenField name="id" value="${movimientoInstance?.id}" />
	        <g:hiddenField name="proceso" value="${documentoInstance?.proceso?.id}" />
	        		<div class="buttonForm">
	             	<span><g:actionSubmit class="delete" action="delete" value="${message(code: 'sapienter.borrar', default: 'Delete')}" 
	             		onclick="confirmarBorrado();return false;" /></span>
	             </div>
	         </g:form>    
        <div class="body">
	        <script src="${resource(dir:'js',file:'movimientos.js')}"></script>        
            <h1>Modificar Movimiento</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${movimientoInstance}">
            <div class="errors">
                <g:renderErrors bean="${movimientoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${movimientoInstance?.id}" />
                <g:hiddenField name="version" value="${movimientoInstance?.version}" />
                <div class="dialog">
					<div class="margin">
						<div class="buttonNewObjects">
							 <span><g:actionSubmit class="save" action="update" value="${message(code: 'sapienter.guardar', default: 'Update')}" /></span>
						</div>						
					</div>                    
                    <table class="tabla_edit">
                        <tbody>
                        	<tr><td><table>
	                    	<g:hiddenField name="proceso" value="${movimientoInstance?.proceso?.id}" />
	                        <tr class="prop">
	                            <td valign="top" class="descripcion"><g:message code="sapienter.id" default="Id" /></td>
	                            <td valign="top" class="value">${fieldValue(bean: movimientoInstance, field: "id")}</td>
	                            <td valign="top" class="descripcion">
	                                    <label for="proceso"><g:message code="proceso.proceso" default="Proceso" /></label></td>
								<td valign="top" class="value"><g:link controller="proceso" action="show" id="${movimientoInstance?.proceso?.id}">${movimientoInstance?.proceso?.encodeAsHTML()}</g:link></td> 
	                        </tr>
	                        <tr><td><br></td></tr>                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="descripcion"><g:message code="movimiento.descripcion.label" default="Descripcion" /><mandatory> *</mandatory></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: movimientoInstance, field: 'descripcion', 'errors')}">
                                    <g:textField class="textField" name="descripcion" value="${movimientoInstance?.descripcion}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="tipoDeMovimiento"><g:message code="movimiento.tipoDeMovimiento.label" default="Tipo De Movimiento" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: movimientoInstance, field: 'tipoDeMovimiento', 'errors')}">
                                    <g:select class="textField" name="tipoDeMovimiento" from="${movimientoInstance.constraints.tipoDeMovimiento.inList}" value="${movimientoInstance?.tipoDeMovimiento}" valueMessagePrefix="movimiento.tipoDeMovimiento"  />
                                </td>

                                <td valign="top" class="name">
                                  <label for="estado"><g:message code="movimiento.estado.label" default="Estado" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: movimientoInstance, field: 'estado', 'errors')}">
                                    <g:select  class="textField" name="estado" from="${movimientoInstance.constraints.estado.inList}" value="${movimientoInstance?.estado}" valueMessagePrefix="movimiento.estado"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="fechaDeCreacion"><g:message code="movimiento.fechaDeCreacion.label" default="Fecha De Creacion" /><mandatory> *</mandatory></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: movimientoInstance, field: 'fechaDeCreacion', 'errors')}">
                                    <g:textField class="textField" name="fechaDeCreacion" value="${movimientoInstance?.fechaDeCreacion}" onChange="diasChanged()"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="diasDeValidez"><g:message code="movimiento.diasDeValidez.label" default="Dias De Validez" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: movimientoInstance, field: 'diasDeValidez', 'errors')}">
                                    <g:select class="textField" name="diasDeValidez" 
                                    	      from="${1..365}" 
                                    	      value="${fieldValue(bean: movimientoInstance, field: 'diasDeValidez')}" 
                                    	      noSelection="['': '']"                                    	      
                                    		  valueMessagePrefix="movimiento.diasDeValidez" 
                                    		  onChange="diasChanged()" />

                                </td>
                                <td valign="top" class="name">
                                  <label for="fechaDeVencimiento"><g:message code="movimiento.fechaDeVencimiento.label" default="Fecha De Vencimiento" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: movimientoInstance, field: 'fechaDeVencimiento', 'errors')}">
									<g:textField class="textField" name="fechaDeVencimiento" value="${movimientoInstance?.fechaDeVencimiento}" default="none" noSelection="['': '']" />
                                </td>
                            </tr>
                            <tr class="prop">
	                            <td valign="top" class="name"><g:message code="movimiento.tareaAsociada" default="Tarea" /></td>
	                            <td><g:link controller="tarea" action="show" id="${movimientoInstance.tareaAsociada.id}">${fieldValue(bean: movimientoInstance, field: "tareaAsociada")}</g:link></td>
                        	</tr>
                        	</table></td></tr>
                        	<tr><td><table>
                            <tr class="prop">
                                <td valign="top" class="descripcion">
                                  <label for="comentario"><g:message code="movimiento.comentario.label" default="Comentario" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: movimientoInstance, field: 'comentario', 'errors')}">
                                    <g:textArea class="textField" name="comentario" value="${movimientoInstance?.comentario}" />
                                </td>
                            </tr>
                        	</table></td></tr>
                        
                        </tbody>
                    </table>
                </div>
            </g:form>
        </div>
		<jq:jquery>diasChanged();</jq:jquery>
    </body>
</html>
