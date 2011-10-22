
<%@ page import="sapienter.Jurisprudencia" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'jurisprudencia.label', default: 'Jurisprudencia')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
    	<div>
	        <div class="buttonSubMenu">
	            <span><g:link class="create" action="create"><g:message code="sapienter.crear" args="[entityName]" /></g:link></span>
	        </div>
           <g:form>
           <g:hiddenField name="id" value="${jurisprudenciaInstance?.id}" />
           		<div class="buttonForm">
           			<span ><g:actionSubmit class="edit" action="edit" value="${message(code: 'sapienter.modificar', default: 'Edit')}" /></span>
           		</div>
           		<div class="buttonForm">
                	<span><g:actionSubmit class="delete" action="delete" value="${message(code: 'sapienter.borrar', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
        <div class="body">
            <h1>Jurisprudencia</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table class="tabla">
                    <tbody>
                        <tr>
                        	<td>
                        	<table>                    
	                        <tr class="prop">
	                            <td valign="top" class="name"><g:message code="sapienter.id" default="Id" /></td>
	                            <td valign="top" class="value">${fieldValue(bean: jurisprudenciaInstance, field: "id")}</td>
	                            <td valign="top" class="name"><g:message code="proceso.descripcion" default="Descripcion" /></td>
	                            <td valign="top" class="value">${fieldValue(bean: jurisprudenciaInstance, field: "descripcion")}</td>
	                        </tr>
	                        <tr class="prop">
	                            <td valign="top" class="name"><g:message code="jurisprudencia.fuero" default="Fuero" /></td>
	                            <td valign="top" class="value">${fieldValue(bean: jurisprudenciaInstance, field: "fuero")}</td>
	                            <td valign="top" class="name"><g:message code="jurisprudencia.origen" default="Origen" /></td>
	                            <td valign="top" class="value">${fieldValue(bean: jurisprudenciaInstance, field: "origen")}</td>
	                        </tr>
	                        <tr class="prop">
	                            <td valign="top" class="name"><g:message code="jurisprudencia.sitio" default="Sitio" /></td>
	                            <td valign="top" class="value">${fieldValue(bean: jurisprudenciaInstance, field: "sitio")}</td>
	                            
	                        </tr>
                        	</table>
                        	</td>
                        </tr>
                        <tr>
                        	<td>
                        	<table>                    
	                        <tr class="prop">
	                            <td valign="top" class="descripcion"><g:message code="sapienter.jurisprudencia" default="Jurisprudencia" /></td>
	                        </tr>
	                        <tr class="prop">
	                            <td valign="top" class="value">${fieldValue(bean: jurisprudenciaInstance, field: "jurisprudencia")}</td>
	                            
	                        </tr>
                            </table>
                            </td>
                       </tr>
                       <tr>
                       		<td>
                       		<table>	                        
	                        <tr class="prop">
	                            <td valign="top" class="name"><g:message code="jurisprudencia.usuario.label" default="Usuario" /></td>
	                            <td valign="top" class="value"><g:link controller="usuario" action="show" id="${jurisprudenciaInstance?.usuario?.id}">${jurisprudenciaInstance?.usuario?.encodeAsHTML()}</g:link></td>
	                        </tr>
	                        </table>
                            </td>
                         </tr>
<!--                        <tr class="prop">
	                            <td valign="top" class="name"><g:message code="jurisprudencia.estudio.label" default="Estudio" /></td>
	                            <td valign="top" class="value"><g:link controller="estudio" action="show" id="${jurisprudenciaInstance?.estudio?.id}">${jurisprudenciaInstance?.estudio?.encodeAsHTML()}</g:link></td>
	                        </tr>
-->	                        
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
