

<%@ page import="sapienter.Estudio" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'estudio.label', default: 'Estudio')}" />
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
            <g:hasErrors bean="${estudioInstance}">
            <div class="errors">
                <g:renderErrors bean="${estudioInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${estudioInstance?.id}" />
                <g:hiddenField name="version" value="${estudioInstance?.version}" />
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
                                  <label for="enlacesUtiles"><g:message code="estudio.enlacesUtiles.label" default="Enlaces Utiles" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: estudioInstance, field: 'enlacesUtiles', 'errors')}">
                                    <g:select name="enlacesUtiles" from="${sapienter.EnlaceUtil.list()}" multiple="yes" optionKey="id" size="5" value="${estudioInstance?.enlacesUtiles*.id}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="jurisprudencias"><g:message code="estudio.jurisprudencias.label" default="Jurisprudencias" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: estudioInstance, field: 'jurisprudencias', 'errors')}">
                                    
<ul>
<g:each in="${estudioInstance?.jurisprudencias?}" var="j">
    <li><g:link controller="jurisprudencia" action="show" id="${j.id}">${j?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="jurisprudencia" action="create" params="['estudio.id': estudioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'jurisprudencia.label', default: 'Jurisprudencia')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="juzgados"><g:message code="estudio.juzgados.label" default="Juzgados" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: estudioInstance, field: 'juzgados', 'errors')}">
                                    
<ul>
<g:each in="${estudioInstance?.juzgados?}" var="j">
    <li><g:link controller="juzgado" action="show" id="${j.id}">${j?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="juzgado" action="create" params="['estudio.id': estudioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'juzgado.label', default: 'Juzgado')])}</g:link>

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
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="personas"><g:message code="estudio.personas.label" default="Personas" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: estudioInstance, field: 'personas', 'errors')}">
                                    
<ul>
<g:each in="${estudioInstance?.personas?}" var="p">
    <li><g:link controller="persona" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="persona" action="create" params="['estudio.id': estudioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'persona.label', default: 'Persona')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="reportes"><g:message code="estudio.reportes.label" default="Reportes" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: estudioInstance, field: 'reportes', 'errors')}">
                                    
<ul>
<g:each in="${estudioInstance?.reportes?}" var="r">
    <li><g:link controller="reporte" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="reporte" action="create" params="['estudio.id': estudioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'reporte.label', default: 'Reporte')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="tiposDeParte"><g:message code="estudio.tiposDeParte.label" default="Tipos De Parte" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: estudioInstance, field: 'tiposDeParte', 'errors')}">
                                    
<ul>
<g:each in="${estudioInstance?.tiposDeParte?}" var="t">
    <li><g:link controller="tipoDeParte" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="tipoDeParte" action="create" params="['estudio.id': estudioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'tipoDeParte.label', default: 'TipoDeParte')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="usuarios"><g:message code="estudio.usuarios.label" default="Usuarios" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: estudioInstance, field: 'usuarios', 'errors')}">
                                    <g:select name="usuarios" from="${sapienter.Usuario.list()}" multiple="yes" optionKey="id" size="5" value="${estudioInstance?.usuarios*.id}" />
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
