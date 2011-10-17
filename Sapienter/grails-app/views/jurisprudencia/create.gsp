

<%@ page import="sapienter.Jurisprudencia" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'jurisprudencia.label', default: 'Jurisprudencia')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
    	<div>
        <div class="buttonSubMenu">
            <span><g:link class="list" action="list"><g:message code="sapienter.jurisprudencia" args="[entityName]" /></g:link></span>
        </div>
        </div>
        <div class="body">
            <h1>Crear Jurisprudencia</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${jurisprudenciaInstance}">
            <div class="errors">
                <g:renderErrors bean="${jurisprudenciaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
          		<g:hiddenField name="id" value="${jurisrudenciaInstance?.id}" />
                <g:hiddenField name="version" value="${jurisprudenciaInstance?.version}" /> 
                <div class="dialog">
					<div class="margin">
						<div class="buttonNewObjects">
							 <span><g:actionSubmit class="create" action="save" value="${message(code: 'sapienter.guardar', default: 'Update')}" /></span>
						</div>
					</div>                	
                    <table class="tabla_edit">
                        <tbody>
                        <tr>
                        	<td>
                        	<table>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="descripcion"><g:message code="proceso.descripcion" default="Descripcion" /><mandatory> *</mandatory></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jurisprudenciaInstance, field: 'descripcion', 'errors')}">
                                    <g:textField class="textField" name="descripcion" value="${jurisprudenciaInstance?.descripcion}" />
                                </td>
                            </tr>	
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fuero"><g:message code="jurisprudencia.fuero" default="Fuero" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jurisprudenciaInstance, field: 'fuero', 'errors')}">
                                    <g:select class="textField"  name="fuero" from="${jurisprudenciaInstance.constraints.fuero.inList}" value="${jurisprudenciaInstance?.fuero}" valueMessagePrefix="jurisprudencia.fuero"  />
                                </td>
                                <td valign="top" class="name">
                                    <label for="origen"><g:message code="jurisprudencia.origen" default="Origen" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jurisprudenciaInstance, field: 'origen', 'errors')}">
                                    <g:textField class="textField"  name="origen" value="${jurisprudenciaInstance?.origen}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="sitio"><g:message code="jurisprudencia.sitio" default="Sitio" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jurisprudenciaInstance, field: 'sitio', 'errors')}">
                                    <g:textField class="textField"  name="sitio" value="${jurisprudenciaInstance?.sitio}" />
                                </td>
                            </tr>
                        	</table>
                        	</td>
                        </tr>
                        <tr>
                        	<td>
                        	<table>
                        	<tr class="prop">
                                <td valign="top" class="descripcion">
                                    <label for="jurisprudencia"><g:message code="sapienter.jurisprudencia" default="Jurisprudencia" /><mandatory> * </mandatory></label>
                                </td>                        	
                             </tr>
                            <tr class="prop">
                                <!-- <td valign="top" class="name">
                                    <label for="jurisprudencia"><g:message code="jurisprudencia.jurisprudencia" default="Jurisprudencia" /></label>
                                </td> -->
                                <td valign="top" class="value ${hasErrors(bean: jurisprudenciaInstance, field: 'jurisprudencia', 'errors')}">
                                    <g:textArea class="textField" name="jurisprudencia" value="${jurisprudenciaInstance?.jurisprudencia}" />
                                </td>
                            </tr>
                            </table>
                            </td>
                       </tr>
                       <tr>
                       		<td>
                       		<table>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="usuario"><g:message code="jurisprudencia.usuario" default="Usuario" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jurisprudenciaInstance, field: 'usuario', 'errors')}">
                                    <g:select class="textField" name="usuario.id" from="${sapienter.Usuario.list()}" optionKey="id" value="${jurisprudenciaInstance?.usuario?.id}"  />
                                </td>
                            </tr>
                            </table>
                            </td>
                         </tr>
                        </tbody>
                    </table>
                </div>	
            </g:form>
        </div>
    </body>
</html>
