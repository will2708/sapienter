

<%@ page import="sapienter.Gasto" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'gasto.label', default: 'Gasto')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${gastoInstance}">
            <div class="errors">
                <g:renderErrors bean="${gastoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post"  enctype="multipart/form-data">
                <g:hiddenField name="id" value="${gastoInstance?.id}" />
                <g:hiddenField name="version" value="${gastoInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="concepto"><g:message code="gasto.concepto.label" default="Concepto" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gastoInstance, field: 'concepto', 'errors')}">
                                    <g:textField name="concepto" value="${gastoInstance?.concepto}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="estado"><g:message code="gasto.estado.label" default="Estado" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gastoInstance, field: 'estado', 'errors')}">
                                    <g:select name="estado" from="${gastoInstance.constraints.estado.inList}" value="${gastoInstance?.estado}" valueMessagePrefix="gasto.estado"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="fecha"><g:message code="gasto.fecha.label" default="Fecha" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gastoInstance, field: 'fecha', 'errors')}">
                                    <g:datePicker name="fecha" precision="day" value="${gastoInstance?.fecha}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="moneda"><g:message code="gasto.moneda.label" default="Moneda" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gastoInstance, field: 'moneda', 'errors')}">
                                    <g:select name="moneda" from="${gastoInstance.constraints.moneda.inList}" value="${gastoInstance?.moneda}" valueMessagePrefix="gasto.moneda"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="monto"><g:message code="gasto.monto.label" default="Monto" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gastoInstance, field: 'monto', 'errors')}">
                                    <g:textField name="monto" value="${fieldValue(bean: gastoInstance, field: 'monto')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="factura"><g:message code="gasto.factura.label" default="Factura" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gastoInstance, field: 'factura', 'errors')}">
                                    <input type="file" id="factura" name="factura" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="proceso"><g:message code="gasto.proceso.label" default="Proceso" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: gastoInstance, field: 'proceso', 'errors')}">
                                    <g:select name="proceso.id" from="${sapienter.Proceso.list()}" optionKey="id" value="${gastoInstance?.proceso?.id}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
