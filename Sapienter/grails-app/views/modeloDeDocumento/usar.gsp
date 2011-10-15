

<%@ page import="sapienter.ModeloDeDocumento" %>
<html>
    <head>
        <!--  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <g:set var="entityName" value="${message(code: 'modeloDeDocumento.label', default: 'ModeloDeDocumento')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
		-->
    </head>
    <body>
        <div class="body">
            <g:if test="${variables}">
            	<g:form action="completar" >
				<div class="margin">
				<div class="buttonNewObjects">
                	<span><g:submitButton name="create" class="save" value="${message(code: 'sapienter.crear', default: 'Create')}" /></span>
            	</div>        
            	</div>            	
	            	<g:each in="${variables}" status="i" var="variable">
	            		<g:if test="${variable.key=='modId'}">
	            			<g:hiddenField name="modId" value="${variable.value}"/>
	            		</g:if>
	            		<g:if test="${variable.key=='proId'}">
	            			<g:hiddenField name="proId" value="${variable.value}"/>
	            		</g:if>                        
    	    			<g:if test="${variable.key!='proId' &&
    	    						  variable.key!='modId'}">	            	
	    	                <table class="tabla_popup">
	        	                <tbody>
			    	                <tr class="prop">
			        	                <td valign="top" class="name_popup">
			            	                <label for="${variable.key}">${variable.key}</label>
			                	        </td>
			                    	    <td valign="top">
			                        	    <g:textField class="textField" name="${variable.key}" value="${variable.value}" />
			                        	</td>                        
			                    	</tr>
	                        	</tbody>
	                    	</table>                  
                    	</g:if>                          	
            		</g:each>
        	    </g:form>            	
            </g:if>
        </div>
    </body>
</html>
