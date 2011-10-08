

<%@ page import="sapienter.Jurisprudencia" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'jurisprudencia.label', default: 'Jurisprudencia')}" />
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
            <g:hasErrors bean="${jurisprudenciaInstance}">
            <div class="errors">
                <g:renderErrors bean="${jurisprudenciaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="descripcion"><g:message code="jurisprudencia.descripcion.label" default="Descripcion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jurisprudenciaInstance, field: 'descripcion', 'errors')}">
                                    <g:textField name="descripcion" value="${jurisprudenciaInstance?.descripcion}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fuero"><g:message code="jurisprudencia.fuero.label" default="Fuero" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jurisprudenciaInstance, field: 'fuero', 'errors')}">
                                    <g:select name="fuero" from="${jurisprudenciaInstance.constraints.fuero.inList}" value="${jurisprudenciaInstance?.fuero}" valueMessagePrefix="jurisprudencia.fuero"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="origen"><g:message code="jurisprudencia.origen.label" default="Origen" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jurisprudenciaInstance, field: 'origen', 'errors')}">
                                    <g:textField name="origen" value="${jurisprudenciaInstance?.origen}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="sitio"><g:message code="jurisprudencia.sitio.label" default="Sitio" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jurisprudenciaInstance, field: 'sitio', 'errors')}">
                                    <g:textField name="sitio" value="${jurisprudenciaInstance?.sitio}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="jurisprudencia"><g:message code="jurisprudencia.jurisprudencia.label" default="Jurisprudencia" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jurisprudenciaInstance, field: 'jurisprudencia', 'errors')}">
                                    <g:textArea name="jurisprudencia" value="${jurisprudenciaInstance?.jurisprudencia}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="usuario"><g:message code="jurisprudencia.usuario.label" default="Usuario" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jurisprudenciaInstance, field: 'usuario', 'errors')}">
                                    <g:select name="usuario.id" from="${sapienter.Usuario.list()}" optionKey="id" value="${jurisprudenciaInstance?.usuario?.id}"  />
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