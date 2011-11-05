
<%@ page import="sapienter.PersonaJuridica"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<g:set var="entityName"
	value="${message(code: 'personaJuridica.label', default: 'PersonaJuridica')}" />
<title><g:message code="default.show.label" args="[entityName]" />
<g:javascript library="application" />
<g:javascript library="jquery" plugin="jquery" />
<jqui:resources theme="ui-lightness" />
</title>
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
		<span><g:link class="list" controller="persona" action="list"><g:message code="persona.list" args="[entityName]" /></g:link></span>
	</div>
	<div class="buttonSubMenu"> 
		<span><g:link class="create" action="create"><g:message code="sapienter.crear" args="[entityName]" /></g:link></span>
	</div>
	<g:form>
	<g:hiddenField name="id" value="${personaJuridicaInstance?.id}" />
		<div class="buttonForm">
			<span><g:actionSubmit class="edit" action="edit" value="${message(code: 'sapienter.modificar', default: 'Edit')}" /></span>
	 	</div>
	 	<div class="buttonForm"> 
			<span><g:actionSubmit class="delete" action="delete" value="${message(code: 'sapienter.borrar', default: 'Delete')}"
					onclick="confirmarBorrado();return false;" /> />
			</span>
		</div>
	</g:form>
	</div>
	<div class="body">
		<g:if test="${flash.message}">
			<div class="message">${flash.message}</div>
		</g:if>
		<div class="dialog">
			<div class="margin">
				<g:form>
				<g:hiddenField name="id" value="${personaJuridicaInstance?.id}" />
                <div class="buttonNewObjects">
                	<span><g:actionSubmit class="create" action="crearProceso" value="${message(code: 'sapienter.crearProceso', default:'Crear Proceso')}"/></span>
	            </div>
	            </g:form>
	        </div> 
			<table class="tabla">
				<tbody>
					<tr>
						<td>
						<table>
							<tr class="prop">
								<td valign="top" class="descripcion"><g:message code="sapienter.id" default="Id" /></td>
								<td valign="top" class="value">${fieldValue(bean: personaJuridicaInstance, field: "id")}</td>
							</tr>
							<tr class="prop">
								<td valign="top" class="name"><g:message code="persona.razonSocial" default="Razon Social" /></td>
								<td valign="top" class="value">${fieldValue(bean: personaJuridicaInstance, field: "razonSocial")}</td>
								<td valign="top" class="name"><g:message code="persona.cuit" default="Cuit" /></td>
								<td valign="top" class="value">${fieldValue(bean: personaJuridicaInstance, field: "cuit")}</td>
							</tr>
							<tr class="prop">
								<td valign="top" class="name"><g:message code="persona.fechaDeInicioActividades" default="Fecha De Inicio Actividades" /></td>
								<td valign="top" class="value"><g:formatDate format="dd/MM/yyyy" date="${personaJuridicaInstance?.fechaDeInicioActividades}" /></td>
								<td valign="top" class="name"><g:message code="persona.auxiliares" default="Auxiliares" /></td>
								<td valign="top" class="value">${fieldValue(bean: personaJuridicaInstance, field: "auxiliares")}</td>
							</tr>
							<tr class="prop">
								<td valign="top" class="name"><g:message code="sapienter.email" default="Email" /></td>
								<td valign="top" class="value">${fieldValue(bean: personaJuridicaInstance, field: "email")}</td>
								<td valign="top" class="name"><g:message code="persona.telefonoDeContacto" default="Telefono De Contacto" /></td>
								<td valign="top" class="value">${fieldValue(bean: personaJuridicaInstance, field: "telefonoDeContacto")}</td>
							</tr>	
							<tr class="prop">
								<td valign="top" class="name"><g:message code="sapienter.fax" default="Fax" /></td>
								<td valign="top" class="value">${fieldValue(bean: personaJuridicaInstance, field: "fax")}</td>
							</tr>
							<tr>
								<td>
									<br>
								</td>
							</tr>							
							<tr class="prop">
								<td valign="top" class="descripcion"><g:message code="sapienter.proceso" default="Proceso" /></td>
								<td valign="top" style="text-align: left;" class="value">
								<ul>
									<g:each in="${personaJuridicaInstance.proceso}" var="p">
									<li><g:link controller="proceso" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
									</g:each>
								</ul>
								</td>
							</tr>
						</table>
						</td>
					</tr>
					<tr>
						<td>
						<table>
							<tr class="prop">
								<td valign="top" class="descripcion"><g:message code="persona.observaciones" default="Observaciones" /></td>
								<td valign="top" class="value">${fieldValue(bean: personaJuridicaInstance, field: "observaciones")}</td>
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
