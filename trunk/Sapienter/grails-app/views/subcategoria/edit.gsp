

<%@ page import="sapienter.Subcategoria" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'subcategoria.label', default: 'Subcategoria')}" />
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
 	document.location.href='${createLink(controller:'categoría', action:'list')}'; 
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
   		<g:form>
   		<g:hiddenField name="id" value="${subcategoriaInstance?.id}" />
        <g:hiddenField name="version" value="${subcategoriaInstance?.version}" />
  	    <div class="buttonForm">
        	<span><g:actionSubmit class="delete" action="delete" value="${message(code: 'sapienter.borrar', default: 'Delete')}" 
        		onclick="confirmarBorrado();return false;" /></span>
        </div>
        </g:form>
        </div>
        <div class="body">
            <h1><g:message code="sapienter.subcategoria" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${subcategoriaInstance}">
            <div class="errors">
                <g:renderErrors bean="${subcategoriaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${subcategoriaInstance?.id}" />
                <g:hiddenField name="version" value="${subcategoriaInstance?.version}" />
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
                                  <label for="categoria"><g:message code="proceso.categoria" default="Categoria" /></label>
                                </td>
                                     <td valign="top" class="value"><g:link controller="categoria" action="show" id="${subcategoriaInstance?.categoria?.id}">${subcategoriaInstance?.categoria?.encodeAsHTML()}</g:link></td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="subTipoCategoria"><g:message code="subcategoria.tipo" default="Sub Tipo Categoria" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: subcategoriaInstance, field: 'subTipoCategoria', 'errors')}">
                                    <g:textField class="textField" name="subTipoCategoria" value="${subcategoriaInstance?.subTipoCategoria}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>

            </g:form>
        </div>
    </body>
</html>
