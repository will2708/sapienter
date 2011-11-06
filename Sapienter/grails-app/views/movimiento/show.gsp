
<%@ page import="sapienter.Movimiento" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'movimiento.label', default: 'Movimiento')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
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
 	document.location.href='${createLink(controller:'movimiento', action:'list')}'; 
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
           		<div class="buttonForm">
           			<span ><g:actionSubmit class="edit" action="edit" value="${message(code: 'sapienter.modificar', default: 'Edit')}" /></span>
           		</div>
           		<div class="buttonForm">
                	<span><g:actionSubmit class="delete" action="delete" value="${message(code: 'sapienter.borrar', default: 'Delete')}" 
                		onclick="confirmarBorrado();return false;" /></span>
                </div>
            </g:form>   
        <div class="body">
            <h1>Movimiento</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table class="tabla">
                    <tbody>
                    	<g:hiddenField name="proceso" value="${gastoInstance?.proceso?.id}" />
                        <tr class="prop">
                            <td valign="top" class="descripcion"><g:message code="sapienter.id" default="Id" /></td>
                            <td valign="top" class="value">${fieldValue(bean: movimientoInstance, field: "id")}</td>
                            <td valign="top" class="descripcion">
                                    <label for="proceso"><g:message code="proceso.proceso" default="Proceso" /></label></td>
							<td valign="top" class="value"><g:link controller="proceso" action="show" id="${movimientoInstance?.proceso?.id}">${movimientoInstance?.proceso?.encodeAsHTML()}</g:link></td> 
                        </tr>
                        <tr><td><br></td></tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="proceso.descripcion" default="Descripcion" /></td>
                            <td valign="top" class="value">${fieldValue(bean: movimientoInstance, field: "descripcion")}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="movimiento.tipoDeMovimiento" default="Tipo De Movimiento" /></td>
                            <td valign="top" class="value">${fieldValue(bean: movimientoInstance, field: "tipoDeMovimiento")}</td>
                            <td valign="top" class="name"><g:message code="movimiento.estado" default="Estado" /></td>
                            <td valign="top" class="value">${fieldValue(bean: movimientoInstance, field: "estado")}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="movimiento.fechaDeCreacion" default="Fecha De Creacion" /></td>
                            <td valign="top" class="value"><g:formatDate date="${movimientoInstance?.fechaDeCreacion}" /></td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="movimiento.diasDeValidez" default="Dias De Validez" /></td>
                            <td valign="top" class="value">${fieldValue(bean: movimientoInstance, field: "diasDeValidez")}</td>
                            <td valign="top" class="name"><g:message code="movimiento.fechaDeVencimientos" default="Fecha De Vencimiento" /></td>                            
                            <td valign="top" class="value"><g:formatDate date="${movimientoInstance?.fechaDeVencimiento}" /></td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="movimiento.tareaAsociada" default="Tarea" /></td>
                            <td><g:link controller="tarea" action="show" id="${movimientoInstance.tareaAsociada.id}">${fieldValue(bean: movimientoInstance, field: "tareaAsociada")}</g:link></td>
                        </tr>                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="movimiento.comentario.label" default="Comentario" /></td>
                            <td valign="top" class="value">${fieldValue(bean: movimientoInstance, field: "comentario")}</td>
                        </tr>                        
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
