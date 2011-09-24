

<%@ page import="sapienter.Proceso" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'proceso.label', default: 'Proceso')}" />
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
            <g:hasErrors bean="${procesoInstance}">
            <div class="errors">
                <g:renderErrors bean="${procesoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${procesoInstance?.id}" />
                <g:hiddenField name="version" value="${procesoInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="categoria"><g:message code="proceso.categoria.label" default="Categoria" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: procesoInstance, field: 'categoria', 'errors')}">
                                    <g:select name="categoria" from="${procesoInstance.constraints.categoria.inList}" value="${procesoInstance?.categoria}" valueMessagePrefix="proceso.categoria"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="subCategoria"><g:message code="proceso.subCategoria.label" default="Sub Categoria" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: procesoInstance, field: 'subCategoria', 'errors')}">
                                    <g:select name="subCategoria" from="${procesoInstance.constraints.subCategoria.inList}" value="${procesoInstance?.subCategoria}" valueMessagePrefix="proceso.subCategoria" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="caratula"><g:message code="proceso.caratula.label" default="Caratula" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: procesoInstance, field: 'caratula', 'errors')}">
                                    <g:textField name="caratula" value="${procesoInstance?.caratula}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="descripcion"><g:message code="proceso.descripcion.label" default="Descripcion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: procesoInstance, field: 'descripcion', 'errors')}">
                                    <g:textField name="descripcion" value="${procesoInstance?.descripcion}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="estado"><g:message code="proceso.estado.label" default="Estado" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: procesoInstance, field: 'estado', 'errors')}">
                                    <g:textField name="estado" value="${procesoInstance?.estado}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="etapaProcesal"><g:message code="proceso.etapaProcesal.label" default="Etapa Procesal" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: procesoInstance, field: 'etapaProcesal', 'errors')}">
                                    <g:textField name="etapaProcesal" value="${procesoInstance?.etapaProcesal}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="juzgado"><g:message code="proceso.juzgado.label" default="Juzgado" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: procesoInstance, field: 'juzgado', 'errors')}">
                                    <g:select name="juzgado.id" from="${sapienter.Juzgado.list()}" optionKey="id" value="${procesoInstance?.juzgado?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="numeroDeJuzgado"><g:message code="proceso.numeroDeJuzgado.label" default="Numero De Juzgado" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: procesoInstance, field: 'numeroDeJuzgado', 'errors')}">
                                    <g:textField name="numeroDeJuzgado" value="${fieldValue(bean: procesoInstance, field: 'numeroDeJuzgado')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="numeroDeProcesoEnJuzgado"><g:message code="proceso.numeroDeProcesoEnJuzgado.label" default="Numero De Proceso En Juzgado" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: procesoInstance, field: 'numeroDeProcesoEnJuzgado', 'errors')}">
                                    <g:textField name="numeroDeProcesoEnJuzgado" value="${fieldValue(bean: procesoInstance, field: 'numeroDeProcesoEnJuzgado')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="observaciones"><g:message code="proceso.observaciones.label" default="Observaciones" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: procesoInstance, field: 'observaciones', 'errors')}">
                                    <g:textField name="observaciones" value="${procesoInstance?.observaciones}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="responsable"><g:message code="proceso.responsable.label" default="Responsable" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: procesoInstance, field: 'responsable', 'errors')}">
                                    <g:select name="responsable.id" from="${sapienter.Usuario.list()}" optionKey="id" value="${procesoInstance?.responsable?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="documentos"><g:message code="proceso.documentos.label" default="Documentos" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: procesoInstance, field: 'documentos', 'errors')}">
                                    
<ul>
<g:each in="${procesoInstance?.documentos?}" var="d">
    <li><g:link controller="documento" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="documento" action="create" params="['proceso.id': procesoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'documento.label', default: 'Documento')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="gastos"><g:message code="proceso.gastos.label" default="Gastos" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: procesoInstance, field: 'gastos', 'errors')}">
                                    
<ul>
<g:each in="${procesoInstance?.gastos?}" var="g">
    <li><g:link controller="gasto" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="gasto" action="create" params="['proceso.id': procesoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'gasto.label', default: 'Gasto')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="movimientos"><g:message code="proceso.movimientos.label" default="Movimientos" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: procesoInstance, field: 'movimientos', 'errors')}">
                                    
<ul>
<g:each in="${procesoInstance?.movimientos?}" var="m">
    <li><g:link controller="movimiento" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="movimiento" action="create" params="['proceso.id': procesoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'movimiento.label', default: 'Movimiento')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="partes"><g:message code="proceso.partes.label" default="Partes" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: procesoInstance, field: 'partes', 'errors')}">
                                    
<ul>
<g:each in="${procesoInstance?.partes?}" var="p">
    <li><g:link controller="parte" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="parte" action="create" params="['proceso.id': procesoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'parte.label', default: 'Parte')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="persona"><g:message code="proceso.persona.label" default="Persona" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: procesoInstance, field: 'persona', 'errors')}">
                                    <g:select name="persona.id" from="${sapienter.Persona.list()}" optionKey="id" value="${procesoInstance?.persona?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="procesosRelacionados"><g:message code="proceso.procesosRelacionados.label" default="Procesos Relacionados" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: procesoInstance, field: 'procesosRelacionados', 'errors')}">
                                    <g:select name="procesosRelacionados" from="${sapienter.Proceso.list()}" multiple="yes" optionKey="id" size="5" value="${procesoInstance?.procesosRelacionados*.id}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="ultimoModificador"><g:message code="proceso.ultimoModificador.label" default="Ultimo Modificador" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: procesoInstance, field: 'ultimoModificador', 'errors')}">
                                    <g:select name="ultimoModificador.id" from="${sapienter.Usuario.list()}" optionKey="id" value="${procesoInstance?.ultimoModificador?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="usuariosAutorizados"><g:message code="proceso.usuariosAutorizados.label" default="Usuarios Autorizados" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: procesoInstance, field: 'usuariosAutorizados', 'errors')}">
                                    <g:select name="usuariosAutorizados.id" from="${sapienter.Usuario.list()}" optionKey="id" value="${procesoInstance?.usuariosAutorizados?.id}"  />
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
