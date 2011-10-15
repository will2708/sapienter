
<%@ page import="sapienter.Documento" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'documento.label', default: 'Documento')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
    	<div>
	        <div class="buttonSubMenu">
	            <span><g:link class="create" action="create"><g:message code="sapienter.crear" args="[entityName]" /></g:link></span>
	        </div>
           <g:form>
           <g:hiddenField name="id" value="${documentoInstance?.id}" />
           		<div class="buttonForm">
           			<span ><g:actionSubmit class="edit" action="edit" value="${message(code: 'sapienter.modificar', default: 'Edit')}" /></span>
           		</div>
           		<div class="buttonForm">
                	<span><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>        
        <div class="body">
            <h1>Documento</h1>
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
	                            <td valign="top" class="value">${fieldValue(bean: documentoInstance, field: "id")}</td>
									<td valign="top" class="descripcion">
	                                   <label for="proceso"><g:message code="proceso.proceso" default="Proceso" /></label></td>
								<td valign="top" class="value"><g:link controller="proceso" action="show" id="${documentoInstance?.proceso?.id}">${documentoInstance?.proceso?.encodeAsHTML()}</g:link></td>                            
	                       </tr>  
	                       <tr><td><br></td></tr>
	                        <tr class="prop">
	                            <td valign="top" class="name"><g:message code="documento.nombre" default="Nombre" /></td>
	                            <td valign="top" class="value">${fieldValue(bean: documentoInstance, field: "nombre")}</td>
	                            <td valign="top" class="name"><g:message code="proceso.descripcion" default="Descripcion" /></td>
	                            <td valign="top" class="value">${fieldValue(bean: documentoInstance, field: "descripcion")}</td>
	                        </tr>
	                        <tr class="prop">
	                            <td valign="top" class="name"><g:message code="proceso.estado" default="Estado" /></td>
	                            <td valign="top" class="value">${fieldValue(bean: documentoInstance, field: "estado")}</td>
	                            <td valign="top" class="name"><g:message code="documento.tipoDeDocumento" default="Tipo De Documento" /></td>
	                            <td valign="top" class="value">${fieldValue(bean: documentoInstance, field: "tipoDeDocumento")}</td>
	                        </tr>
	                        <tr class="prop">
	                            <td valign="top" class="name"><g:message code="documento.usuarioResponsable.label" default="Usuario Responsable" /></td>
	                            <td valign="top" class="value"><g:link controller="usuario" action="show" id="${documentoInstance?.usuarioResponsable?.id}">${documentoInstance?.usuarioResponsable?.encodeAsHTML()}</g:link></td>
	                        </tr>
                    	</table>
                    	</td>
                    </tr>
                    <tr>
                    	<td>
                    	<table>
	                        <tr class="prop">
	                            <td valign="top" class="value">${fieldValue(bean: documentoInstance, field: "contenidoDocumento").decodeHTML()}</td>
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
