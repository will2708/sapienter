

<%@ page import="sapienter.Estudio" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'estudio.label', default: 'Estudio')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
    	<div>
        <div class="buttonSubMenu">
            <span><g:link class="list" action="list"><g:message code="sapienter.estudio" args="[entityName]" /></g:link></span>
        </div>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${estudioInstance}">
            <div class="errors">
                <g:renderErrors bean="${estudioInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table class="tabla">
                        <tbody>
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
