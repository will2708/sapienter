

<%@ page import="sapienter.Categoria" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'categoria.label', default: 'Categoria')}" />
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
        <div class="buttonSubMenu">            
            <span><g:link class="list" action="list"><g:message code="sapienter.categoria" args="[entityName]" /></g:link></span>
        </div>
        <div class="buttonSubMenu">
            <span><g:link class="create" action="create"><g:message code="sapienter.crear" args="[entityName]" /></g:link></span>
        </div>
        <g:form>
           <g:hiddenField name="id" value="${categoriaInstance?.id}" />
           <g:hiddenField name="version" value="${categoriaInstance?.version}" />
          	<div class="buttonForm">
               <span><g:actionSubmit class="delete" action="delete" value="${message(code: 'sapienter.borrar', default: 'Delete')}" onclick="confirmarBorrado();return false;"/></span>
            </div>
         </g:form>
         </div>
        <div class="body">
            <h1><g:message code="sapienter.categoria" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${categoriaInstance}">
            <div class="errors">
                <g:renderErrors bean="${categoriaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${categoriaInstance?.id}" />
                <g:hiddenField name="version" value="${categoriaInstance?.version}" />
                <div class="dialog">
                <div class="margin">
                	<div class="buttonNewObjects">
						<span><g:actionSubmit class="save" action="update" value="${message(code: 'sapienter.guardar', default: 'Update')}" /></span>
                	</div>
                	<div class="buttonNewObjects">
                    	<span><g:actionSubmit class="create" action="crearSubCategoria" value="${message(code: 'sapienter.crearSubCategoria', default: 'Update')}" /></span>
                	</div>   
               	</div>
                    <table class="tabla_edit">
                        <tbody>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nombreCategoria"><g:message code="proceso.categoria" default="Nombre Categoria" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: categoriaInstance, field: 'nombreCategoria', 'errors')}">
                                    <g:textField class="textField" name="nombreCategoria" value="${categoriaInstance?.nombreCategoria}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="subCategorias"><g:message code="proceso.subCategorias" default="Sub Categorias" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: categoriaInstance, field: 'subCategorias', 'errors')}">
									<ul>
									<g:each in="${categoriaInstance?.subCategorias?}" var="s">
									    <li><g:link controller="subcategoria" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
									</g:each>
									</ul>
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
            </g:form>
        </div>
    </body>
</html>
