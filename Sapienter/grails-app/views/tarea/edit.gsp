
<%@ page import="sapienter.Tarea" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'tarea.label', default: 'Tarea')}" />
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
    
    	<div class="SubMenu">
		<div class="buttonCalendario">
	     <span><g:link class="calendario" controller="calendario" action="show" id="1"><img src="${createLinkTo(dir: 'images/', file: 'calendario2.gif')}"/></g:link></span>
	    </div>        
		<g:form> 
        <g:hiddenField name="id" value="${tareaInstance?.id}" />
        		<div class="buttonForm">
             	<span><g:actionSubmit class="delete" action="delete" value="${message(code: 'sapienter.borrar', default: 'Delete')}" 
             		onclick="confirmarBorrado();return false;" /></span>
             </div>
         </g:form>  
         </div>  
        <div class="body">
            <h1>Modificar Tarea</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${tareaInstance}">
            <div class="errors">
                <g:renderErrors bean="${tareaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${tareaInstance?.id}" />
                <g:hiddenField name="version" value="${tareaInstance?.version}" />
                <div class="dialog">
					<div class="margin">
						<div class="buttonNewObjects">
							 <span><g:actionSubmit class="save" action="update" value="${message(code: 'sapienter.guardar', default: 'Update')}" /></span>
						</div>						
					</div>                    
                    <table class="tabla_edit">
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="fechaInicio"><g:message code="tarea.fechaInicio.label" default="Fecha Inicio" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tareaInstance, field: 'fechaInicio', 'errors')}">
 								<g:datePicker class="textField" name="fechaInicio" precision="minute" value="${tareaInstance?.fechaInicio}" />                                    
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="fechaFin"><g:message code="tarea.fechaFin.label" default="Fecha Fin" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tareaInstance, field: 'fechaFin', 'errors')}">
								<g:datePicker class="textField" name="fechaFin" precision="minute" value="${tareaInstance?.fechaFin}" default="none" noSelection="['':'']"/>                                    
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="descripcion">
                                  <label for="observacion"><g:message code="tarea.observacion.label" default="Observacion" /><mandatory> *</mandatory></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tareaInstance, field: 'observacion', 'errors')}">
                                    <g:textArea class="textField"  name="observacion" value="${tareaInstance?.observacion}" />
                                </td>
                            </tr>
                        
                        
                        </tbody>
                    </table>
                </div>
            </g:form>
        </div>
    </body>
</html>
