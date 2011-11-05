

<%@ page import="sapienter.Juzgado" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'juzgado.label', default: 'Juzgado')}" />
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
        <div class="buttonSubMenu">
            <span><g:link class="list" action="list"><g:message code="sapienter.juzgado" args="[entityName]" /></g:link></span>
        </div>
		<g:form>
        <g:hiddenField name="id" value="${juzgadoInstance?.id}" />        
	 	<div class="buttonForm"> 
			<span><g:actionSubmit class="delete" action="delete" value="${message(code: 'sapienter.borrar', default: 'Delete')}"
					onclick="confirmarBorrado();return false;" />
			</span>
		</div>
		</g:form>          
        </div>
        <div class="body">
            <h1>Modificar juzgado</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${juzgadoInstance}">
            <div class="errors">
                <g:renderErrors bean="${juzgadoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${juzgadoInstance?.id}" />
                <g:hiddenField name="version" value="${juzgadoInstance?.version}" />
                <div class="dialog">
                	<div class="margin">
					<div class="buttonNewObjects">
						 <span><g:actionSubmit class="save" action="update" value="${message(code: 'sapienter.guardar', default: 'Update')}" /></span>
					</div>						
					</div>                
                    <table class= "tabla_edit">
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nombreDeJuzgado"><g:message code="juzgado.nombre" default="Nombre De Juzgado" /><mandatory> *</mandatory></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: juzgadoInstance, field: 'nombreDeJuzgado', 'errors')}">
                                    <g:textField class="textField" name="nombreDeJuzgado" value="${juzgadoInstance?.nombreDeJuzgado}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="numeroDeJuzgado"><g:message code="juzgado.numero" default="Numero De Juzgado" /><mandatory> *</mandatory></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: juzgadoInstance, field: 'numeroDeJuzgado', 'errors')}">
                                    <g:textField  class="textField" name="numeroDeJuzgado" value="${fieldValue(bean: juzgadoInstance, field: 'numeroDeJuzgado')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="direccionJuzgado"><g:message code="juzgado.direccion" default="Direccion Juzgado" /><mandatory> *</mandatory></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: juzgadoInstance, field: 'direccionJuzgado', 'errors')}">
                                    <g:textField class="textField" name="direccionJuzgado" value="${juzgadoInstance?.direccionJuzgado}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
            </g:form>
        </div>
    </body>
</html>
