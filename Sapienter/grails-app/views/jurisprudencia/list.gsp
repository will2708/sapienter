
<%@ page import="sapienter.Jurisprudencia" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'jurisprudencia.label', default: 'Jurisprudencia')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
    	<div>
        <div class="buttonSubMenu">
            <span class="menuButton"><g:link class="create" action="create"><g:message code="sapienter.crear" args="[entityName]" /></g:link></span>
        </div>
        </div>
        <div class="body">
            <h1>Jurisprudencia</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
	        	<div class="margin">
	           	 <g:form>
		       		<div class="buttonNewObjects">
						<g:textField class="find_text" name="q" value="${params.q}" />
						<g:submitButton class="find" name="list" value="Buscar" />
					</div>		
			   	</g:form>
			   	</div>            
                <table class="tabla">
                    <thead>
                        <tr>
                            <g:sortableColumn property="id" title="${message(code: 'jurisprudencia.id', default: 'Id')}" />
                            <g:sortableColumn property="descripcion" title="${message(code: 'proceso.descripcion', default: 'Descripcion')}" />
                            <g:sortableColumn property="fuero" title="${message(code: 'jurisprudencia.fuero', default: 'Fuero')}" />
                            <g:sortableColumn property="origen" title="${message(code: 'jurisprudencia.origen', default: 'Origen')}" />
                            <g:sortableColumn property="sitio" title="${message(code: 'jurisprudencia.sitio.label', default: 'Sitio')}" /> 
                            <g:sortableColumn property="jurisprudencia" title="${message(code: 'jurisprudencia.jurisprudencia.label', default: 'Jurisprudencia')}" />
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${jurisprudenciaInstanceList}" status="i" var="jurisprudenciaInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td><g:link action="show" id="${jurisprudenciaInstance.id}">${fieldValue(bean: jurisprudenciaInstance, field: "id")}</g:link></td>
                            <td><g:link action="show" id="${jurisprudenciaInstance.id}">${fieldValue(bean: jurisprudenciaInstance, field: "descripcion")}</g:link></td>
                            <td>${fieldValue(bean: jurisprudenciaInstance, field: "fuero")}</td>
                            <td>${fieldValue(bean: jurisprudenciaInstance, field: "origen")}</td>
                            <td>${fieldValue(bean: jurisprudenciaInstance, field: "sitio")}</td>
                            <td>${fieldValue(bean: jurisprudenciaInstance, field: "jurisprudencia")}</td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
