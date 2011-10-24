
<%@ page import="sapienter.Calendario" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'calendario.label', default: 'Calendario')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
		<fullcal:resources/>
    </head>
    <body>
        	<script src="${resource(dir:'js',file:'calendario.js')}"></script>
            <h1>Calendario</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
           	<div class="margin">
            <div class="buttonNewObjects">
            	<g:form>
               <g:hiddenField name="id" value="${calendarioInstance?.id}" />
               <span><g:actionSubmit class="edit" action="nuevaTarea" value="${message(code: 'calendario.nuevaTarea', default: 'Nueva Tarea')}" /></span>                    
              </g:form>
            </div>   
            </div>
            <table class="tabla_calendario">   
            <tr><td>        
				<div id='cal'></div>
			</td></tr>
			</table>
    </body>
</html>
