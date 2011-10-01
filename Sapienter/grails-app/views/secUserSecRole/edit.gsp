

<%@ page import="sapienter.SecUserSecRole" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'secUserSecRole.label', default: 'SecUserSecRole')}" />
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
            <g:hasErrors bean="${secUserSecRoleInstance}">
            <div class="errors">
                <g:renderErrors bean="${secUserSecRoleInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${secUserSecRoleInstance?.id}" />
                <g:hiddenField name="version" value="${secUserSecRoleInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="secRole"><g:message code="secUserSecRole.secRole.label" default="Sec Role" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: secUserSecRoleInstance, field: 'secRole', 'errors')}">
                                    <g:select name="secRole.id" from="${sapienter.SecRole.list()}" optionKey="id" value="${secUserSecRoleInstance?.secRole?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="secUser"><g:message code="secUserSecRole.secUser.label" default="Sec User" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: secUserSecRoleInstance, field: 'secUser', 'errors')}">
                                    <g:select name="secUser.id" from="${sapienter.SecUser.list()}" optionKey="id" value="${secUserSecRoleInstance?.secUser?.id}"  />
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
