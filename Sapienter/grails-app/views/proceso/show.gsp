
<%@ page import="sapienter.Proceso" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'proceso.label', default: 'Proceso')}" />
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
                            <td valign="top" class="name"><g:message code="proceso.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: procesoInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="proceso.categoria.label" default="Categoria" /></td>
                            
                            <td valign="top" class="value"><g:link controller="categoria" action="show" id="${procesoInstance?.categoria?.id}">${procesoInstance?.categoria?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="proceso.subCategoria.label" default="Sub Categoria" /></td>
                            
                            <td valign="top" class="value"><g:link controller="subcategoria" action="show" id="${procesoInstance?.subCategoria?.id}">${procesoInstance?.subCategoria?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="proceso.caratula.label" default="Caratula" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: procesoInstance, field: "caratula")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="proceso.descripcion.label" default="Descripcion" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: procesoInstance, field: "descripcion")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="proceso.estado.label" default="Estado" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: procesoInstance, field: "estado")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="proceso.etapaProcesal.label" default="Etapa Procesal" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: procesoInstance, field: "etapaProcesal")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="proceso.juzgado.label" default="Juzgado" /></td>
                            
                            <td valign="top" class="value"><g:link controller="juzgado" action="show" id="${procesoInstance?.juzgado?.id}">${procesoInstance?.juzgado?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="proceso.numeroDeProcesoEnJuzgado.label" default="Numero De Proceso En Juzgado" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: procesoInstance, field: "numeroDeProcesoEnJuzgado")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="proceso.observaciones.label" default="Observaciones" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: procesoInstance, field: "observaciones")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="proceso.responsable.label" default="Responsable" /></td>
                            
                            <td valign="top" class="value"><g:link controller="usuario" action="show" id="${procesoInstance?.responsable?.id}">${procesoInstance?.responsable?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="proceso.documentos.label" default="Documentos" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${procesoInstance.documentos}" var="d">
                                    <li><g:link controller="documento" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="proceso.gastos.label" default="Gastos" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${procesoInstance.gastos}" var="g">
                                    <li><g:link controller="gasto" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="proceso.movimientos.label" default="Movimientos" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${procesoInstance.movimientos}" var="m">
                                    <li><g:link controller="movimiento" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="proceso.partes.label" default="Partes" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${procesoInstance.partes}" var="p">
                                    <li><g:link controller="parte" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="proceso.persona.label" default="Persona" /></td>
                            
                            <td valign="top" class="value"><g:link controller="persona" action="show" id="${procesoInstance?.persona?.id}">${procesoInstance?.persona?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="proceso.procesosRelacionados.label" default="Procesos Relacionados" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${procesoInstance.procesosRelacionados}" var="p">
                                    <li><g:link controller="proceso" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="proceso.ultimoModificador.label" default="Ultimo Modificador" /></td>
                            
                            <td valign="top" class="value"><g:link controller="usuario" action="show" id="${procesoInstance?.ultimoModificador?.id}">${procesoInstance?.ultimoModificador?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="proceso.usuariosAutorizados.label" default="Usuarios Autorizados" /></td>
                            
                            <td valign="top" class="value"><g:link controller="usuario" action="show" id="${procesoInstance?.usuariosAutorizados?.id}">${procesoInstance?.usuariosAutorizados?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${procesoInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
