<%@ page import="sapienter.Documento" %>
<%@ page import="org.grails.activiti.ApprovalStatus" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'documento.label', default: 'Documento')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <g:javascript library="application" /> 
        <modalbox:modalIncludes />
    </head>
    <body>
        <div class="body">
           	<fckeditor:config CustomConfigurationsPath="${resource(dir:'js',file:'fkeditor.js')}"/>
        	<h1>Crear Documento</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${documentoInstance}">
            <div class="errors">
                <g:renderErrors bean="${documentoInstance}" as="list" />
            </div>
            </g:hasErrors>
            
<!--   		<modalbox:createLink controller="modeloDeDocumento" action="listar" title="Modelos de Documentos" width="500">Modelos</modalbox:createLink> -->
            <g:form action="save" >
                <div class="dialog">
					<div class="margin">
						<div class="buttonNewObjects">
							<span><g:submitButton name="create" class="save" value="${message(code: 'sapienter.guardar', default: 'Create')}" /></span>
						</div>						
					</div>
					<div class="margin">
						<div class="buttonNewObjects">
							<span class="button"><g:submitButton name="complete" class="save" value="${message(code: 'default.button.complete.label', default: 'Complete')}" /></span>
						</div>
					</div>    
					<div class="margin">            	
						<div class="buttonIntoTable">
							<modalbox:createLink controller="modeloDeDocumento" action="listar"  id="${documentoInstance?.proceso?.id}" title="Modelos de Documentos" width="600">Modelos de documento</modalbox:createLink>
						</div>
					</div>
                    <table class="tabla_calendario">
                        <tbody>
                        <tr>
                        	<td>
                        	<table>
                        	<g:hiddenField name="proceso" value="${documentoInstance?.proceso?.id}" />
                            <tr class="prop">
                                <td valign="top" class="descripcion">
                                    <label for="proceso"><g:message code="proceso.proceso" default="Proceso" /></label>
                                </td>
                                <td valign="top" class="value"><g:link controller="proceso" action="show" id="${documentoInstance?.proceso?.id}">${documentoInstance?.proceso?.encodeAsHTML()}</g:link></td> 
                            </tr>
                            <tr><td><br></td></tr>
                            <tr class="prop">
                                <td valign="top" class="name"><label for="nombre"><g:message code="documento.nombre" default="Nombre" /><mandatory> *</mandatory></label></td>
                                <td valign="top" class="value ${hasErrors(bean: documentoInstance, field: 'nombre', 'errors')}">
                                    <g:textField class="textField" name="nombre" value="${documentoInstance?.nombre}" /></td>
                                <td valign="top" class="name">
                                    <label for="descripcion"><g:message code="proceso.descripcion" default="Descripcion" /><mandatory> *</mandatory></label></td>
                                <td valign="top" class="value ${hasErrors(bean: documentoInstance, field: 'descripcion', 'errors')}">
                                    <g:textField class="textField" name="descripcion" value="${documentoInstance?.descripcion}" /></td>
                            </tr>                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="estado"><g:message code="proceso.estado" default="Estado" /></label></td>
                                <td valign="top" class="value ${hasErrors(bean: documentoInstance, field: 'estado', 'errors')}">
                                    <g:select class="textField" name="estado" from="${documentoInstance.constraints.estado.inList}" value="${documentoInstance?.estado}" valueMessagePrefix="documento.estado"  /></td>
                                <td valign="top" class="name">
                                    <label for="tipoDeDocumento"><g:message code="documento.tipoDeDocumento" default="Tipo De Documento" /></label></td>
                                <td valign="top" class="value ${hasErrors(bean: documentoInstance, field: 'tipoDeDocumento', 'errors')}">
                                    <g:select class="textField" name="tipoDeDocumento" from="${documentoInstance.constraints.tipoDeDocumento.inList}" value="${documentoInstance?.tipoDeDocumento}" valueMessagePrefix="documento.tipoDeDocumento"  /></td>
                            </tr>                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="usuarioResponsable"><g:message code="proceso.usuarioResponsable" default="Usuario Responsable" /></label></td>
                                <td valign="top" class="value ${hasErrors(bean: documentoInstance, field: 'usuarioResponsable', 'errors')}">
                                    <g:select class="textField" name="usuarioResponsable.id" from="${sapienter.Usuario.list()}" optionKey="id" value="${documentoInstance?.usuarioResponsable?.id}"  /></td>
                            </tr>            
                            </table>
                            </td>
						</tr>
						<tr>
							<td>
							<table>                                        
                            <tr class="prop">
                                <!--  <td valign="top" class="name">
                                    <label for="contenidoDocumento"><g:message code="documento.contenidoDocumento.label" default="Contenido Documento" /></label></td>-->
                                <td valign="top" class="value ${hasErrors(bean: documentoInstance, field: 'contenidoDocumento', 'errors')}">
                                    <fckeditor:editor 
                                    	name="contenidoDocumento"
                                    	width="700px"
                                    	heigh="200%"
		                                toolbar="Sapienter"
                                    	body="disabled"
                                    	value="${documentoInstance?.contenidoDocumento}">
                                     	${documentoInstance?.contenidoDocumento}
                                     </fckeditor:editor> 
                                </td>
                            </tr>
                            </table>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <g:hiddenField name="taskId" value="${params.taskId}" />
            </g:form>
        </div>
    </body>
</html>
