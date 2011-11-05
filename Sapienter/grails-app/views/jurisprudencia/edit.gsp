

<%@ page import="sapienter.Jurisprudencia" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'jurisprudencia.label', default: 'Jurisprudencia')}" />
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
            <span><g:link class="list" action="list"><g:message code="sapienter.jurisprudencia" args="[entityName]" /></g:link></span>
        </div>
	 	<div class="buttonForm"> 
			<span><g:actionSubmit class="delete" action="delete" value="${message(code: 'sapienter.borrar', default: 'Delete')}"
					onclick="confirmarBorrado();return false;" />
			</span>
		</div>          
        </div>
        <div class="body">
            <h1>Modificar Jurisprudencia</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${jurisprudenciaInstance}">
            <div class="errors">
                <g:renderErrors bean="${jurisprudenciaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${jurisprudenciaInstance?.id}" />
                <g:hiddenField name="version" value="${jurisprudenciaInstance?.version}" />
                <div class="dialog">
                	<div class="margin">
					<div class="buttonNewObjects">
						 <span><g:actionSubmit class="save" action="update" value="${message(code: 'sapienter.guardar', default: 'Update')}" /></span>
					</div>						
					</div>
                    <table class="tabla_edit">
                        <tbody>
                        <tr>
                        	<td>
                        	<table>
                            <tr class="prop">
	                            <td valign="top" class="name"><g:message code="sapienter.id" default="Id" /></td>
    	                        <td valign="top" class="value">${fieldValue(bean: jurisprudenciaInstance, field: "id")}</td>
                                <td valign="top" class="name">
                                  <label for="descripcion"><g:message code=proceso.descripcion" default="Descripcion" /><mandatory> *</mandatory></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jurisprudenciaInstance, field: 'descripcion', 'errors')}">
                                    <g:textField class="textField" name="descripcion" value="${jurisprudenciaInstance?.descripcion}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="fuero"><g:message code="jurisprudencia.fuero" default="Fuero" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jurisprudenciaInstance, field: 'fuero', 'errors')}">
                                    <g:select class="textField"  name="fuero" from="${jurisprudenciaInstance.constraints.fuero.inList}" value="${jurisprudenciaInstance?.fuero}" valueMessagePrefix="jurisprudencia.fuero"  />
                                </td>
                            <td valign="top" class="name">
                                  <label for="origen"><g:message code="jurisprudencia.origen" default="Origen" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jurisprudenciaInstance, field: 'origen', 'errors')}">
                                    <g:textField class="textField" name="origen" value="${jurisprudenciaInstance?.origen}" />
                                </td>
                            </tr>                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="sitio"><g:message code="jurisprudencia.sitio" default="Sitio" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jurisprudenciaInstance, field: 'sitio', 'errors')}">
                                    <g:textField class="textField"  name="sitio" value="${jurisprudenciaInstance?.sitio}" />
                                </td>
                            </tr>
                        	</table>
                        	</td>
                        </tr>
                        <tr>
                        	<td>
                        	<table>
                        	<tr class="prop">
                                <td valign="top" class="descripcion">
                                    <label for="jurisprudencia"><g:message code="sapienter.jurisprudencia" default="Jurisprudencia" /><mandatory> *</mandatory></label>
                                </td>                        	
                             </tr>                        
                            <tr class="prop">
                                <td valign="top" class="value ${hasErrors(bean: jurisprudenciaInstance, field: 'jurisprudencia', 'errors')}">
                                    <g:textArea class="textField" name="jurisprudencia" value="${jurisprudenciaInstance?.jurisprudencia}" />
                                </td>
                            </tr>
                            </table>
                            </td>
                       </tr>
                       <tr>
                       		<td>
                       		<table>
                            <tr class="prop">
                                <td valign="top" class="name"><label for="usuario"><g:message code="usuario.usuarioModificacion" default="Usuario" /></label></td>
                                <td valign="top" class="value"><g:link controller="usuario" action="show" id="${jurisprudenciaInstance?.usuario?.id}">${jurisprudenciaInstance?.usuario?.encodeAsHTML()}</g:link></td>
                            </tr>
                            </table>
                            </td>
                         </tr>
<!--                     <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="estudio"><g:message code="jurisprudencia.estudio.label" default="Estudio" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jurisprudenciaInstance, field: 'estudio', 'errors')}">
                                    <g:select name="estudio.id" from="${sapienter.Estudio.list()}" optionKey="id" value="${jurisprudenciaInstance?.estudio?.id}"  />
                                </td>
                            </tr>
-->                    
                        </tbody>
                    </table>
                </div>
            </g:form>
        </div>
    </body>
</html>
