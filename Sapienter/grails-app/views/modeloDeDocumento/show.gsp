
<%@ page import="sapienter.ModeloDeDocumento" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'modeloDeDocumento.label', default: 'ModeloDeDocumento')}" />
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
 	document.location.href='${createLink(controller:'modeloDeDocumento', action:'list')}'; 
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
            <span><g:link class="list" action="list"><g:message code="sapienter.modelosDeDocumento" args="[entityName]" /></g:link></span>
        </div>
<!--         <div class="buttonSubMenu">
            <span><g:link class="create" action="create"><g:message code="sapienter.crear" args="[entityName]" /></g:link></span>
        </div> -->
           <g:form>
           <g:hiddenField name="id" value="${modeloDeDocumentoInstance?.id}" />
           		<div class="buttonForm">
           			<span ><g:actionSubmit class="edit" action="edit" value="${message(code: 'sapienter.modificar', default: 'Edit')}" /></span>
           		</div>
           		<div class="buttonForm">
                	<span><g:actionSubmit class="delete" action="delete" value="${message(code: 'sapienter.borrar', default: 'Delete')}" 
                		onclick="confirmarBorrado();return false;" /></span>
                </div>
            </g:form>
        </div>
        <div class="body">
            <h1>Modelo de documento</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table class="tabla">
                    <tbody>  
                    	<tr>
                    	<td>
                    	<table>                  
	                        <tr class="prop">
	                            <td valign="top" class="descripcion"><g:message code="sapienter.id" default="Id" /></td>
	                            <td valign="top" class="value">${fieldValue(bean: modeloDeDocumentoInstance, field: "id")}</td>
	                        </tr>
	                    	<tr><td><br></td></tr>
	                        <tr class="prop">
	                            <td valign="top" class="name"><g:message code="documento.nombre" default="Nombre" /></td>                            
	                            <td valign="top" class="value">${fieldValue(bean: modeloDeDocumentoInstance, field: "nombre")}</td>
	                            <td valign="top" class="name"><g:message code="proceso.descripcion" default="Descripcion" /></td>
	                            <td valign="top" class="value">${fieldValue(bean: modeloDeDocumentoInstance, field: "descripcion")}</td>
	                        </tr>                    
	                        <tr class="prop">
	                            <td valign="top" class="name"><g:message code="proceso.categoria" default="Categoria" /></td>
	                            <td valign="top" class="value">${fieldValue(bean: modeloDeDocumentoInstance, field: "categoria")}</td>
	                            <td valign="top" class="name"><g:message code="proceso.subCategoria" default="Sub Categoria" /></td>                            
	                            <td valign="top" class="value">${fieldValue(bean: modeloDeDocumentoInstance, field: "subCategoria")}</td>
	                        </tr>
	                        <tr class="prop">
	                            <td valign="top" class="name"><g:message code="proceso.estado" default="Estado" /></td>
	                            <td valign="top" class="value">${fieldValue(bean: modeloDeDocumentoInstance, field: "estado")}</td>                            
	                        </tr>
	                    </table>
	                    </td>
	                    </tr>
	                    <tr>
	                    <td>
	                    <table>
                        <tr class="prop">
                            <!--  <td valign="top" class="descripcion"><g:message code="modeloDeDocumento.modeloDeDocumento.label" default="Modelo De Documento" /></td>-->
                            <td valign="top" class="value">${fieldValue(bean: modeloDeDocumentoInstance, field: "modeloDeDocumento").decodeHTML()}</td>
                        </tr>
                        </table>
                        </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
