

<%@ page import="sapienter.Juzgado" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'juzgado.label', default: 'Juzgado')}" />
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
            <g:hasErrors bean="${juzgadoInstance}">
            <div class="errors">
                <g:renderErrors bean="${juzgadoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${juzgadoInstance?.id}" />
                <g:hiddenField name="version" value="${juzgadoInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nombreDeJuzgado"><g:message code="juzgado.nombreDeJuzgado.label" default="Nombre De Juzgado" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: juzgadoInstance, field: 'nombreDeJuzgado', 'errors')}">
                                    <g:textField name="nombreDeJuzgado" value="${juzgadoInstance?.nombreDeJuzgado}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="numeroDeJuzgado"><g:message code="juzgado.numeroDeJuzgado.label" default="Numero De Juzgado" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: juzgadoInstance, field: 'numeroDeJuzgado', 'errors')}">
                                    <g:textField name="numeroDeJuzgado" value="${fieldValue(bean: juzgadoInstance, field: 'numeroDeJuzgado')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="direccionJuzgado"><g:message code="juzgado.direccionJuzgado.label" default="Direccion Juzgado" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: juzgadoInstance, field: 'direccionJuzgado', 'errors')}">
                                    <g:textField name="direccionJuzgado" value="${juzgadoInstance?.direccionJuzgado}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="estudio"><g:message code="juzgado.estudio.label" default="Estudio" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: juzgadoInstance, field: 'estudio', 'errors')}">
                                    <g:select name="estudio.id" from="${sapienter.Estudio.list()}" optionKey="id" value="${juzgadoInstance?.estudio?.id}"  />
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
