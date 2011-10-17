

<%@ page import="sapienter.Estudio" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'estudio.label', default: 'Estudio')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
           <g:form>
           <g:hiddenField name="id" value="${documentoInstance?.id}" />
           		<div class="buttonForm">
                	<span><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>    
        <div class="body">
            <h1>Modificar Estudio</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${estudioInstance}">
            <div class="errors">
                <g:renderErrors bean="${estudioInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${estudioInstance?.id}" />
                <g:hiddenField name="version" value="${estudioInstance?.version}" />
                <div class="dialog">
                	<div class="margin">
					<div class="buttonNewObjects">
						 <span><g:actionSubmit class="save" action="update" value="${message(code: 'sapienter.guardar', default: 'Update')}" /></span>
					</div>						
					</div>                 
                    <table class="tabla_edit">
                        <tbody>
							<tr class="prop">
								<td valign="top" class="descripcion"><g:message
										code="sapienter.id" default="Id" />
								</td>
		
								<td valign="top" class="value">
									${fieldValue(bean: estudioInstance, field: "id")}
								</td>
							</tr>       
							<tr><td><br></td></tr>                 
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="razonSocial"><g:message code="persona.razonSocial" default="Razon Social" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: estudioInstance, field: 'razonSocial', 'errors')}">
                                    <g:textField class="textField" name="razonSocial" value="${estudioInstance?.razonSocial}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="domicilioFiscal"><g:message code="estudio.domicilioFiscal" default="Domicilio Fiscal" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: estudioInstance, field: 'domicilioFiscal', 'errors')}">
                                    <g:textField class="textField" name="domicilioFiscal" value="${estudioInstance?.domicilioFiscal}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="cuit"><g:message code="persona.cuit" default="Cuit" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: estudioInstance, field: 'cuit', 'errors')}">
                                    <g:textField class="textField" name="cuit" value="${estudioInstance?.cuit}" />
                                </td>
                            </tr>
                        
  
                        </tbody>
                    </table>
                </div>
            </g:form>
        </div>
    </body>
</html>
