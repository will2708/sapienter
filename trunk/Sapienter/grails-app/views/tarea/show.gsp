
<%@ page import="sapienter.Tarea" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'tarea.label', default: 'Tarea')}" />
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
 	document.location.href='${createLink(controller:'calendario', action:'show')}'; 
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
    
    <div class="SubMenu">
    <div class="buttonCalendario">
     <span><g:link class="calendario" controller="calendario" action="show" id="1"><img src="${createLinkTo(dir: 'images/', file: 'calendario2.gif')}"/></g:link></span>
    </div>
<!-- 	<div class = "buttonSubMenu"> 
		 <span><g:link class="create" action="create"><g:message code="sapienter.crear" args="[entityName]" /></g:link></span>
	</div> -->
	<g:form>
	<g:hiddenField name="id" value="${tareaInstance?.id}" />
		<div class="buttonForm">
			<span><g:actionSubmit class="edit" action="edit" value="${message(code: 'sapienter.modificar', default: 'Edit')}" /></span>
	 	</div>
	 	<div class="buttonForm"> 
			<span><g:actionSubmit class="delete" action="delete" value="${message(code: 'sapienter.borrar', default: 'Delete')}"
					onclick="confirmarBorrado();return false;" />
			</span>
		</div>
	</g:form>
	</div>
        <div class="body">
            <h1>Tarea</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table class="tabla">
                    <tbody>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="tarea.fechaInicio.label" default="Fecha Inicio" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: tareaInstance, field: "fechaInicio")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="tarea.fechaFin.label" default="Fecha Fin" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: tareaInstance, field: "fechaFin")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="descripcion"><g:message code="tarea.observacion.label" default="Observacion" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: tareaInstance, field: "observacion")}</td>
                            
                        </tr>
                            <tr class="prop">
	                            <td valign="top" class="name"><g:message code="movimiento.tareaAsociada" default="Movimiento" /></td>
	                            <td><g:link controller="movimiento" action="show" id="${movimiento.tareaAsociada.id}">${fieldValue(bean: movimiento, field: "tareaAsociada")}</g:link></td>
                        	</tr>    
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
