
<%@ page import="sapienter.Subcategoria" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'subcategoria.label', default: 'Subcategoria')}" />
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
    	<g:hiddenField name="id" value="${subcategoriaInstance?.id}" />
     	<div class="buttonForm">
                <span><g:actionSubmit class="edit" action="edit" value="${message(code: 'sapienter.modificar', default: 'Edit')}" /></span>
        </div>
        <div class="buttonForm">
           <span><g:actionSubmit class="delete" action="delete" value="${message(code: 'sapienter.borrar', default: 'Delete')}" 
           		onclick="confirmarBorrado();return false;" /></span>
        </div>
        </g:form>
        <div class="body">
            <h1><g:message code="sapienter.subcategoria" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table class="tabla">
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="proceso.id" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: subcategoriaInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="proceso.categoria" default="Categoria" /></td>
                            
                            <td valign="top" class="value"><g:link controller="categoria" action="show" id="${subcategoriaInstance?.categoria?.id}">${subcategoriaInstance?.categoria?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="proceso.subcategoria" default="Sub Tipo Categoria" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: subcategoriaInstance, field: "subTipoCategoria")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
