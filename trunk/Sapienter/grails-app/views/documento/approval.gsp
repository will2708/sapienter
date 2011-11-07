
 
<%@ page import="sapienter.Documento" %>
<%@ page import="org.grails.activiti.ApprovalStatus" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'documento.label', default: 'Documento')}" />
        <title><g:message code="default.approve.label" args="[entityName]" default="Approve {0}" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" controller="task" action="myTaskList"><g:message code="myTasks.label" default="My Tasks ({0})" args="[myTasksCount]" /></g:link></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="start"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.approve.label" args="[entityName]" default="Approve {0}"/></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:form action="performApproval" >
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="documento.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: documentoInstance, field: "id")}</td>
                            
                        </tr>
                    
						<tr class="prop">
                             <td valign="top" class="name">
                                 <label for="usuarioResponsable"><g:message code="documento.usuarioResponsable.apellido" default="Usuario Responsable" /></label></td>
                             <td valign="top" class="value ${hasErrors(bean: documentoInstance, field: 'usuarioResponsable.apellido', 'errors')}">
                                 <g:select class="textField" name="usuarioResponsable.id" from="${sapienter.Usuario.list()}" optionKey="id" value="${documentoInstance?.usuarioResponsable?.id}"  /></td>
                        </tr> 
                    
                 
                    
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="estado"><g:message code="documento.estado.label" default="Estado" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: documentoInstance, field: 'estado', 'errors')}">
                                    <g:select name="estado" from="${[ApprovalStatus.APPROVED, ApprovalStatus.REJECTED]}" value="${documentoInstance?.estado}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="approvalRemark"><g:message code="documento.approvalRemark.label" default="Approval Remark" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: documentoInstance, field: 'approvalRemark', 'errors')}">
                                    <g:textArea name="approvalRemark" cols="40" rows="5" value="${documentoInstance?.approvalRemark}" />
                                </td>
                            </tr>
                    
                    </tbody>
                </table>
            </div>
            		<div class="buttons">
                    <span class="button"><g:submitButton name="save" class="save" value="${message(code: 'default.button.save.label', default: 'Save')}" /></span>
                    <span class="button"><g:submitButton name="complete" class="save" value="${message(code: 'default.button.complete.label', default: 'Complete')}" /></span>
                </div>
                <g:hiddenField name="id" value="${documentoInstance?.id}" />
                <g:hiddenField name="taskId" value="${params.taskId}" />
            </g:form>            
        </div>
    </body>
</html>
