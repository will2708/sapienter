<%@ page import="sapienter.Persona" %>
<%@ page import="sapienter.PersonaFisica" %>
<%@ page import="sapienter.PersonaJuridica" %>
<html>
    <!--  <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'persona.label', default: 'Persona')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <g:javascript library="prototype" />
        
    </head> -->
    <body>
    	<div>
        <div class="buttonSubMenu">
            <span><g:link class="create" action="create_mod"><g:message code="sapienter.crear" args="[entityName]" /></g:link></span>
        </div>
        </div>	
        <div class="body">
	        <g:if test="${flash.message}">
	       	 <div class="message">${flash.message} </div>
	        </g:if>
	       	<div class="dialog">
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
	                        <g:sortableColumn  property="id" title="${message(code: 'persona.id.label', default: 'Id')}" />
	                        <g:sortableColumn  property="Nombre" title="${message(code: 'personaJuridica.razonSocial.label', default: 'Nombre y Apellido / Raz&oacuten Social')}" />
	                        <g:sortableColumn  property="email" title="${message(code: 'personaJuridica.email.label', default: 'Correo Electr&oacutenico')}" />
	                        <g:sortableColumn  property="telefono" title="${message(code: 'personaFisica.telefono.label', default: 'Tel&eacutefono')}" />
	                    </tr>
	                </thead>
	                <tbody>
		                <g:each in="${personaFisicaList}" status="i" var="personaFisicaInstance">
		                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
		                    
		                        <td><g:link controller= "persona" action="show" id="${personaFisicaInstance.id}">${fieldValue(bean: personaFisicaInstance, field: "id")}</g:link></td>
		                        <td><g:link controller= "persona" action="show" id="${personaFisicaInstance.id}">${fieldValue(bean: personaFisicaInstance, field: "nombre")} ${fieldValue(bean: personaFisicaInstance, field: "apellido")}</g:link></td>
		                        <td>${fieldValue(bean: personaFisicaInstance, field: "email")}</td>
		                        <td>${fieldValue(bean: personaFisicaInstance, field: "telefono")}</td>
		                    </tr>
		                </g:each>
						<g:each in="${personaJuridicaList}" status="i" var="personaJuridicaInstance">
						<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
					
							<td><g:link action="show" id="${personaJuridicaInstance.id}">${fieldValue(bean: personaJuridicaInstance, field: "id")}</g:link></td>
							<td><g:link action="show" id="${personaJuridicaInstance.id}">${fieldValue(bean: personaJuridicaInstance, field: "razonSocial")}</g:link></td>
							<td>${fieldValue(bean: personaJuridicaInstance, field: "email")}</td>
					                    <td>${fieldValue(bean: personaJuridicaInstance, field: "telefonoDeContacto")}</td>
						</tr>
						</g:each>
	                </tbody>
	            </table>
            </div>
       </div>
    </body>
</html>
