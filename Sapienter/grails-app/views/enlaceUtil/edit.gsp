

<%@ page import="sapienter.EnlaceUtil" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'enlaceUtil.label', default: 'EnlaceUtil')}" />
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
 	document.location.href='${createLink(controller:'enlaceUtil', action:'list')}'; 
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
        <div class="buttonSubMenu">
            <span><g:link class="list" action="list"><g:message code="sapienter.enlaceUtil" args="[entityName]" /></g:link></span>
        </div>
	 	<div class="buttonForm"> 
			<span><g:actionSubmit class="delete" action="delete" value="${message(code: 'sapienter.borrar', default: 'Delete')}"
					onclick="confirmarBorrado();return false;"  />
			</span>
		</div>          
        </div>
        <div class="body">
            <h1>Modificar enlace</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${enlaceUtilInstance}">
            <div class="errors">
                <g:renderErrors bean="${enlaceUtilInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${enlaceUtilInstance?.id}" />
                <g:hiddenField name="version" value="${enlaceUtilInstance?.version}" />
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
                                  <label for="descripcion"><g:message code="proceso.descripcion" default="Descripcion" /><mandatory> *</mandatory></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: enlaceUtilInstance, field: 'descripcion', 'errors')}">
                                    <g:textField class="textField" name="descripcion" value="${enlaceUtilInstance?.descripcion}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="direccion"><g:message code="enlaceUtil.enlace" default="Direccion" /><mandatory> *</mandatory></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: enlaceUtilInstance, field: 'direccion', 'errors')}">
                                    <g:textField class="textField"  name="direccion" value="${enlaceUtilInstance?.direccion}" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </g:form>
        </div>
    </body>
</html>
