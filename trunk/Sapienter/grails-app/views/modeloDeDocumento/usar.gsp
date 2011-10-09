

<%@ page import="sapienter.ModeloDeDocumento" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <g:set var="entityName" value="${message(code: 'modeloDeDocumento.label', default: 'ModeloDeDocumento')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>

    </head>
    <body>
        <div class="body">
            <g:if test="${variables}">
            	<g:form action="completar" >
	            	<g:each in="${variables}" status="i" var="variable">
	            		<g:if test="${variable.key=='id'}">
	            			<g:hiddenField name="id" value="${variable.value}"/>
	            		</g:if>                        
    	    			<g:if test="${variable.key!='id'}">	            	
	    	                <table>
	        	                <tbody>
			    	                <tr class="prop">
			        	                <td valign="top" class="name">
			            	                <label for="${variable.key}">${variable.key}</label>
			                	        </td>
			                    	    <td valign="top">
			                        	    <g:textField name="${variable.key}" value="${variable.value}" />
			                        	</td>                        
			                    	</tr>
	                        	</tbody>
	                    	</table>                  
                    	</g:if>                          	
            		</g:each>
    				<div class="buttons">
	                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
    	            </div>
        	    </g:form>            	
            </g:if>

        </div>
    </body>
</html>
