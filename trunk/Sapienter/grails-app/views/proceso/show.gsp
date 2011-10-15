
<%@ page import="sapienter.Proceso" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'proceso.label', default: 'Proceso')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
    	<div>
        <div class="buttonSubMenu">            
            <span><g:link class="list" action="list"><g:message code="sapienter.proceso" args="[entityName]" /></g:link></span>
        </div>
		<g:form>
		<g:hiddenField name="id" value="${procesoInstance?.id}" />
			<div class="buttonForm">
				<span><g:actionSubmit class="edit" action="edit" value="${message(code: 'sapienter.modificar', default: 'Edit')}" /></span>
		 	</div>
		 	<div class="buttonForm"> 
				<span><g:actionSubmit class="delete" action="delete" value="${message(code: 'sapienter.borrar', default: 'Delete')}"
						onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</span>
			</div>
		</g:form>        
        </div>    	        
        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
              	<div class="margin">
              		<g:form>
              		<g:hiddenField name="id" value="${procesoInstance?.id}" />  
              		<div class="buttonNewObjects">                 		
                 		<span><g:actionSubmit class="create" action="crearDocumento" value="${message(code: 'proceso.crearDocumento', default: 'Update')}" /></span>                   			 
                  	</div>
                  	<div class="buttonNewObjects">
						<span><g:actionSubmit class="create" action="crearGasto" value="${message(code: 'proceso.crearGasto', default: 'Update')}" /></span>                  		
              		</div>
              		<div class="buttonNewObjects">
						<span><g:actionSubmit class="create" action="crearMovimiento" value="${message(code: 'proceso.crearMovimiento', default: 'Update')}" /></span>                		
              		</div>
              		<div class="buttonNewObjects">
						<span><g:actionSubmit class="create" action="crearParte" value="${message(code: 'proceso.crearParte', default: 'Update')}" /></span>							
					</div>
					</g:form>
				</div>                
                <table class="tabla">
                    <tbody>
                    	<tr>
                    		<td>
                    		<table>
                        		<tr class="prop">
                                	<td valign="top" class="descripcion">
                                  		<label for="persona"><g:message code="sapienter.persona" default="Persona" /></label></td>
                                	<td valign="top" class="value ${hasErrors(bean: procesoInstance, field: 'persona', 'errors')}">
                                    		${procesoInstance?.persona}</td>                            		
                            		<td valign="top" class="descripcion"><g:message code="sapienter.id" default="Id" /></td>                            
                            		<td valign="top" class="value">${fieldValue(bean: procesoInstance, field: "id")}</td>                            
                        		</tr>
                        		<tr><td><br></td></tr>                    
                        		<tr class="prop">
                            		<td valign="top" class="name"><g:message code="proceso.categoria" default="Categoria" /></td>                            
                            		<td valign="top" class="value"><g:link controller="categoria" action="show" id="${procesoInstance?.categoria?.id}">${procesoInstance?.categoria?.encodeAsHTML()}</g:link></td>                            
                            		<td valign="top" class="name"><g:message code="proceso.subCategoria" default="Sub Categoria" /></td>
                            		<td valign="top" class="value"><g:link controller="subcategoria" action="show" id="${procesoInstance?.subCategoria?.id}">${procesoInstance?.subCategoria?.encodeAsHTML()}</g:link></td>
		                        </tr>                    
                        		<tr class="prop">
                            		<td valign="top" class="name"><g:message code="proceso.caratula" default="Caratula" /></td>                            
                            		<td valign="top" class="value">${fieldValue(bean: procesoInstance, field: "caratula")}</td>
                            		<td valign="top" class="name"><g:message code="proceso.descripcion.label" default="Descripcion" /></td>                            
                            		<td valign="top" class="value">${fieldValue(bean: procesoInstance, field: "descripcion")}</td>                            
                        		</tr>                    
                        		<tr class="prop">
                            		<td valign="top" class="name"><g:message code="proceso.estado" default="Estado" /></td>                            
                            		<td valign="top" class="value">${fieldValue(bean: procesoInstance, field: "estado")}</td>                                                    
                            		<td valign="top" class="name"><g:message code="proceso.etapaProcesal" default="Etapa Procesal" /></td>                            
                            		<td valign="top" class="value">${fieldValue(bean: procesoInstance, field: "etapaProcesal")}</td>                            
                        		</tr>                    
                        		<tr class="prop">
                            		<td valign="top" class="name"><g:message code="proceso.juzgado" default="Juzgado" /></td>
                            		<td valign="top" class="value"><g:link controller="juzgado" action="show" id="${procesoInstance?.juzgado?.id}">${procesoInstance?.juzgado?.encodeAsHTML()}</g:link></td>                            
                            		<td valign="top" class="name"><g:message code="proceso.numeroDeProcesoEnJuzgado" default="Numero De Proceso En Juzgado" /></td>
	                            	<td valign="top" class="value">${fieldValue(bean: procesoInstance, field: "numeroDeProcesoEnJuzgado")}</td>
                            	</tr>                                        
                        		<tr class="prop">
                            		<td valign="top" class="name"><g:message code="proceso.responsable" default="Responsable" /></td>
                            		<td valign="top" class="value"><g:link controller="usuario" action="show" id="${procesoInstance?.responsable?.id}">${procesoInstance?.responsable?.encodeAsHTML()}</g:link></td>
                    				<td valign="top" class="name"><g:message code="proceso.usuariosAutorizados" default="Usuarios Autorizados" /></td>
                            		<td valign="top" class="value"><g:link controller="usuario" action="show" id="${procesoInstance?.usuariosAutorizados?.id}">${procesoInstance?.usuariosAutorizados?.encodeAsHTML()}</g:link></td>
	                        	</tr>                                                
                        		<tr class="prop">
                            		<td valign="top" class="descripcion"><g:message code="proceso.documentos" default="Documentos" /></td>
                            		<td valign="top" style="text-align: left;" class="value">
	                                <ul>
	                                <g:each in="${procesoInstance.documentos}" var="d">
	                                    <li><g:link controller="documento" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
	                                </g:each>
	                                </ul></td>
                                    <td valign="top" class="descripcion"><g:message code="proceso.gastos" default="Gastos" /></td>                            
                            		<td valign="top" style="text-align: left;" class="value">
	                                <ul>
	                                <g:each in="${procesoInstance.gastos}" var="g">
	                                    <li><g:link controller="gasto" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></li>
	                                </g:each>
	                                </ul></td>
                            	</tr>
                            	<tr><td><br></td></tr>                    
                        		<tr class="prop">
                            		<td valign="top" class="descripcion"><g:message code="proceso.movimientos" default="Movimientos" /></td>
                            		<td valign="top" style="text-align: left;" class="value">
	                                <ul>
	                                <g:each in="${procesoInstance.movimientos}" var="m">
	                                    <li><g:link controller="movimiento" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
	                                </g:each>
	                                </ul></td>
                            		<td valign="top" class="descripcion"><g:message code="proceso.partes" default="Partes" /></td>                            
                            		<td valign="top" style="text-align: left;" class="value">
	                                <ul>
	                                <g:each in="${procesoInstance.partes}" var="p">
	                                    <li><g:link controller="parte" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
	                                </g:each>
	                                </ul>
	                        	    </td>                            
                        		</tr>
								<tr><td><br></td></tr>                    
                      			<tr>
                            		<td valign="top" class="name"><g:message code="proceso.procesosRelacionados" default="Procesos Relacionados" /></td>                            
                            		<td valign="top" style="text-align: left;" class="value">
	                                <ul>
	                                <g:each in="${procesoInstance.procesosRelacionados}" var="p">
	                                    <li><g:link controller="proceso" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
	                                </g:each>
	                                </ul></td>
                            		<td valign="top" class="name"><g:message code="proceso.ultimoModificador" default="Ultimo Modificador" /></td>
                            		<td valign="top" class="value"><g:link controller="usuario" action="show" id="${procesoInstance?.ultimoModificador?.id}">${procesoInstance?.ultimoModificador?.encodeAsHTML()}</g:link></td>
                            	</tr>
                        	</table>
                        	</td>
                        </tr>
                        <tr>
                        	<td>
                        	<table>
                        		<tr class="prop">
                            		<td valign="top" class="descripcion"><g:message code="sapienter.observaciones" default="Observaciones" /></td>	                            
                            		<td valign="top" class="value">${fieldValue(bean: procesoInstance, field: "observaciones")}</td>                            
                        		</tr>
                    		</table>
                    		</td>
                    	</tr>
                    </tbody>
                </table>
            </div>
            </div>
        </div>
    </body>
</html>
