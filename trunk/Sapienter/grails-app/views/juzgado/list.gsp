
<%@ page import="sapienter.Juzgado" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'juzgado.label', default: 'Juzgado')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
    	<div>
        <div class="buttonSubMenu">
            <span class="menuButton"><g:link class="create" action="create"><g:message code="sapienter.crear" args="[entityName]" /></g:link></span>
        </div>
        </div>
        <div class="body">
            <h1>Juzgados</h1>
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
<!--                             <g:sortableColumn property="id" title="${message(code: 'juzgado.id.label', default: 'Id')}" /> -->
                            <g:sortableColumn property="nombreDeJuzgado" title="${message(code: 'juzgado.nombreDeJuzgado.label', default: 'Nombre De Juzgado')}" />
                            <g:sortableColumn property="numeroDeJuzgado" title="${message(code: 'juzgado.numeroDeJuzgado.label', default: 'Numero De Juzgado')}" />
                            <g:sortableColumn property="direccionJuzgado" title="${message(code: 'juzgado.direccionJuzgado.label', default: 'Direccion Juzgado')}" />
<!--                             <th><g:message code="juzgado.estudio.label" default="Estudio" /></th> -->
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${juzgadoInstanceList}" status="i" var="juzgadoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <!--<td><g:link action="show" id="${juzgadoInstance.id}">${fieldValue(bean: juzgadoInstance, field: "id")}</g:link></td> -->
                        
                            <td><g:link action="show" id="${juzgadoInstance.id}">${fieldValue(bean: juzgadoInstance, field: "nombreDeJuzgado")}</g:link></td>
                        
                            <td>${fieldValue(bean: juzgadoInstance, field: "numeroDeJuzgado")}</td>
                        
                            <td>${fieldValue(bean: juzgadoInstance, field: "direccionJuzgado")}</td>
                        
<!--                             <td>${fieldValue(bean: juzgadoInstance, field: "estudio")}</td> -->
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>

        </div>
    </body>
</html>
