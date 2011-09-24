

<%@ page import="sapienter.Estudio" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'estudio.label', default: 'Estudio')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
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
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="razonSocial"><g:message code="estudio.razonSocial.label" default="Razon Social" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: estudioInstance, field: 'razonSocial', 'errors')}">
                                    <g:textField name="razonSocial" value="${estudioInstance?.razonSocial}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="domicilioFiscal"><g:message code="estudio.domicilioFiscal.label" default="Domicilio Fiscal" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: estudioInstance, field: 'domicilioFiscal', 'errors')}">
                                    <g:textField name="domicilioFiscal" value="${estudioInstance?.domicilioFiscal}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="cuit"><g:message code="estudio.cuit.label" default="Cuit" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: estudioInstance, field: 'cuit', 'errors')}">
                                    <g:textField name="cuit" value="${estudioInstance?.cuit}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="modelosDeDocumento"><g:message code="estudio.modelosDeDocumento.label" default="Modelos De Documento" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: estudioInstance, field: 'modelosDeDocumento', 'errors')}">
                                    <g:select name="modelosDeDocumento.id" from="${sapienter.ModeloDeDocumento.list()}" optionKey="id" value="${estudioInstance?.modelosDeDocumento?.id}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
