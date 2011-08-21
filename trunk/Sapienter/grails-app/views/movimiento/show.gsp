
<%@ page import="sapienter.Movimiento" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'movimiento.label', default: 'Movimiento')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="movimiento.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: movimientoInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="movimiento.descripcion.label" default="Descripcion" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: movimientoInstance, field: "descripcion")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="movimiento.tipoDeMovimiento.label" default="Tipo De Movimiento" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: movimientoInstance, field: "tipoDeMovimiento")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="movimiento.estado.label" default="Estado" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: movimientoInstance, field: "estado")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="movimiento.comentario.label" default="Comentario" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: movimientoInstance, field: "comentario")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="movimiento.fechaDeCreacion.label" default="Fecha De Creacion" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${movimientoInstance?.fechaDeCreacion}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="movimiento.horaDeCreacion.label" default="Hora De Creacion" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: movimientoInstance, field: "horaDeCreacion")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="movimiento.diasDeValidez.label" default="Dias De Validez" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: movimientoInstance, field: "diasDeValidez")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="movimiento.fechaDeVencimiento.label" default="Fecha De Vencimiento" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${movimientoInstance?.fechaDeVencimiento}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="movimiento.horaDeVencimiento.label" default="Hora De Vencimiento" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: movimientoInstance, field: "horaDeVencimiento")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="movimiento.proceso.label" default="Proceso" /></td>
                            
                            <td valign="top" class="value"><g:link controller="proceso" action="show" id="${movimientoInstance?.proceso?.id}">${movimientoInstance?.proceso?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${movimientoInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
