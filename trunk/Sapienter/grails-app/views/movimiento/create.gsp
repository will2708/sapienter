

<%@ page import="sapienter.Movimiento" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'movimiento.label', default: 'Movimiento')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
        	<g:javascript library="jquery" plugin="jquery" />
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${movimientoInstance}">
            <div class="errors">
                <g:renderErrors bean="${movimientoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="descripcion"><g:message code="movimiento.descripcion.label" default="Descripcion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: movimientoInstance, field: 'descripcion', 'errors')}">
                                    <g:textField name="descripcion" value="${movimientoInstance?.descripcion}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="tipoDeMovimiento"><g:message code="movimiento.tipoDeMovimiento.label" default="Tipo De Movimiento" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: movimientoInstance, field: 'tipoDeMovimiento', 'errors')}">
                                    <g:select name="tipoDeMovimiento" from="${movimientoInstance.constraints.tipoDeMovimiento.inList}" value="${movimientoInstance?.tipoDeMovimiento}" valueMessagePrefix="movimiento.tipoDeMovimiento"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="estado"><g:message code="movimiento.estado.label" default="Estado" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: movimientoInstance, field: 'estado', 'errors')}">
                                    <g:select name="estado" from="${movimientoInstance.constraints.estado.inList}" value="${movimientoInstance?.estado}" valueMessagePrefix="movimiento.estado"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="comentario"><g:message code="movimiento.comentario.label" default="Comentario" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: movimientoInstance, field: 'comentario', 'errors')}">
                                    <g:textField name="comentario" value="${movimientoInstance?.comentario}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fechaDeCreacion"><g:message code="movimiento.fechaDeCreacion.label" default="Fecha De Creacion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: movimientoInstance, field: 'fechaDeCreacion', 'errors')}">
                                    <g:datePicker name="fechaDeCreacion" precision="minute" value="${movimientoInstance?.fechaDeCreacion}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="diasDeValidez"><g:message code="movimiento.diasDeValidez.label" default="Dias De Validez" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: movimientoInstance, field: 'diasDeValidez', 'errors')}">
                                    <g:select name="diasDeValidez" 
                                    		  from="${1..365}" 
                                    		  value="${fieldValue(bean: movimientoInstance, field: 'diasDeValidez')}" 
                                    		  noSelection="['':'']"
                                    		  valueMessagePrefix="movimiento.diasDeValidez" 
                                    		  onChange="diasChanged()" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fechaDeVencimiento"><g:message code="movimiento.fechaDeVencimiento.label" default="Fecha De Vencimiento" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: movimientoInstance, field: 'fechaDeVencimiento', 'errors')}">
                                    <g:datePicker name="fechaDeVencimiento" precision="minute" value="${movimientoInstance?.fechaDeVencimiento}" default="none" noSelection="['':'']"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="proceso"><g:message code="movimiento.proceso.label" default="Proceso" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: movimientoInstance, field: 'proceso', 'errors')}">
                                    <g:select name="proceso.id" from="${sapienter.Proceso.list()}" optionKey="id" value="${movimientoInstance?.proceso?.id}"  />
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
		<jq:jquery>diasChanged();</jq:jquery>
    </body>
</html>
