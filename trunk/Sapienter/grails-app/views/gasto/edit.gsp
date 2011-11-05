

<%@ page import="sapienter.Gasto" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'gasto.label', default: 'Gasto')}" />
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
    	<div>
           <g:form>
           <g:hiddenField name="id" value="${gastoInstance?.id}" />
           		<div class="buttonForm">
                	<span><g:actionSubmit class="delete" action="delete" value="${message(code: 'sapienter.borrar', default: 'Delete')}" onclick="confirmarBorrado();return false;" /></span>
                </div>
            </g:form>
		</div>    
        <div class="body">
        	<script src="${resource(dir:'js',file:'gastos.js')}"></script>
            <h1>Modificar gasto</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${gastoInstance}">
            <div class="errors">
                <g:renderErrors bean="${gastoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post"  enctype="multipart/form-data">
                <g:hiddenField name="id" value="${gastoInstance?.id}" />
                <g:hiddenField name="version" value="${gastoInstance?.version}" />
                <div class="dialog">
					<div class="margin">
						<div class="buttonNewObjects">
							 <span><g:actionSubmit class="save" action="update" value="${message(code: 'sapienter.guardar', default: 'Update')}" /></span>
						</div>
					</div>                     
                    <table class="tabla_edit">
                        <tbody>
							<g:hiddenField name="proceso" value="${gastoInstance?.proceso?.id}" />
                            <tr class="prop">
                            	<td valign="top" class="descripcion"><g:message code="sapienter.id" default="Id" /></td>
                            	<td valign="top" class="value">${fieldValue(bean: gastoInstance, field: "id")}</td>                            
								<td valign="top" class="descripcion">
                                    <label for="proceso"><g:message code="proceso.proceso" default="Proceso" /></label></td>
								<td valign="top" class="value"><g:link controller="proceso" action="show" id="${gastoInstance?.proceso?.id}">${gastoInstance?.proceso?.encodeAsHTML()}</g:link></td>                            
                            </tr>        
                            <tr><td><br></td></tr>                      
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="concepto"><g:message code="gasto.concepto" default="Concepto" /><mandatory> *</mandatory></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gastoInstance, field: 'concepto', 'errors')}">
                                    <g:textField class="textField" name="concepto" value="${gastoInstance?.concepto}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="estado"><g:message code="proceso.estado" default="Estado" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gastoInstance, field: 'estado', 'errors')}">
                                    <g:select  class="textField" name="estado" from="${gastoInstance.constraints.estado.inList}" value="${gastoInstance?.estado}" valueMessagePrefix="gasto.estado"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="fecha"><g:message code="gasto.fecha.label" default="Fecha" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gastoInstance, field: 'fecha', 'errors')}">
                                    <g:textField class="textField" name="fecha" value="${gastoInstance?.fecha}"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="monto"><g:message code="gasto.monto" default="Monto" /><mandatory> *</mandatory></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gastoInstance, field: 'monto', 'errors')}">
                                    <g:textField class="textField" name="monto" value="${fieldValue(bean: gastoInstance, field: 'monto')}" />
                                </td>                        		
                                <td valign="top" class="name">
                                  <label for="moneda"><g:message code="gasto.moneda" default="Moneda" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gastoInstance, field: 'moneda', 'errors')}">
                                    <g:select class="textField" name="moneda" from="${gastoInstance.constraints.moneda.inList}" value="${gastoInstance?.moneda}" valueMessagePrefix="gasto.moneda"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="factura"><g:message code="gasto.factura" default="Factura" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gastoInstance, field: 'factura', 'errors')}">
                                    <input class="buttonIntoTable" type="file" id="factura" name="factura" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
            </g:form>
        </div>
    </body>
</html>
