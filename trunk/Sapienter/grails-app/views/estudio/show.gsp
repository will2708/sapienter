
<%@ page import="sapienter.Estudio"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<g:set var="entityName"
	value="${message(code: 'estudio.label', default: 'Estudio')}" />
<title><g:message code="default.show.label" args="[entityName]" />
</title>
</head>
<body>
           <g:form>
           <g:hiddenField name="id" value="${estudioInstance?.id}" />
           		<div class="buttonForm">
           			<span ><g:actionSubmit class="edit" action="edit" value="${message(code: 'sapienter.modificar', default: 'Edit')}" /></span>
           		</div>
<!--            		<div class="buttonForm">
                	<span><g:actionSubmit class="delete" action="delete" value="${message(code: 'sapienter.borrar', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div> -->
            </g:form>
	<div class="body">
		<h1>
			Estudio
		</h1>
		<g:if test="${flash.message}">
			<div class="message">
				${flash.message}
			</div>
		</g:if>
		<div class="dialog">
                <div class="dialog">
                	<div class="margin">
					<div class="buttonNewObjects">
						 <span><g:actionSubmit class="save" action="update" value="${message(code: 'sapienter.guardar', default: 'Update')}" /></span>
					</div>						
					</div>     		
			<table class="tabla">
				<tbody>

					<tr class="prop">
						<td valign="top" class="descripcion"><g:message
								code="sapienter.id" default="Id" />
						</td>

						<td valign="top" class="value">
							${fieldValue(bean: estudioInstance, field: "id")}
						</td>

					</tr>					
					<tr class="prop">
						<td valign="top" class="name"><g:message
								code="persona.razonSocial" default="Razon Social" />
						</td>

						<td valign="top" class="value">
							${fieldValue(bean: estudioInstance, field: "razonSocial")}
						</td>

					</tr>

					<tr class="prop">
						<td valign="top" class="name"><g:message
								code="estudio.domicilioFiscal" default="Domicilio Fiscal" />
						</td>

						<td valign="top" class="value">
							${fieldValue(bean: estudioInstance, field: "domicilioFiscal")}
						</td>

					</tr>

					<tr class="prop">
						<td valign="top" class="name"><g:message
								code="persona.cuit" default="Cuit" />
						</td>

						<td valign="top" class="value">
							${fieldValue(bean: estudioInstance, field: "cuit")}
						</td>

					</tr>
				</tbody>
			</table>
		</div>

	</div>
</body>
</html>
