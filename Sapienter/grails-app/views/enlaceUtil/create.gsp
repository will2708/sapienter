

<%@ page import="sapienter.EnlaceUtil" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'enlaceUtil.label', default: 'EnlaceUtil')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
    	<div>
        <div class="buttonSubMenu">
            <span><g:link class="list" action="list"><g:message code="sapienter.enlaceUtil" args="[entityName]" /></g:link></span>
        </div>
        </div>
        <div class="body">
            <h1>Crear Enlace</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${enlaceUtilInstance}">
            <div class="errors">
                <g:renderErrors bean="${enlaceUtilInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
					<div class="margin">
						<div class="buttonNewObjects">
							 <span><g:actionSubmit class="create" action="save" value="${message(code: 'sapienter.guardar', default: 'Update')}" /></span>
						</div>
					</div>
                   
                    <table class="tabla_edit">
                        <tbody>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="descripcion"><g:message code="proceso.descripcion" default="Descripcion" /><mandatory> *</mandatory></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: enlaceUtilInstance, field: 'descripcion', 'errors')}">
                                    <g:textField class="textField"  name="descripcion" value="${enlaceUtilInstance?.descripcion}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="direccion"><g:message code="enlaceUtil.enlace" default="Direccion" /><mandatory> *</mandatory></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: enlaceUtilInstance, field: 'direccion', 'errors')}">
                                    <g:textField class="textField" name="direccion" value="${enlaceUtilInstance?.direccion}" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </g:form>
        </div>
    </body>
</html>
