
<%@ page import="sapienter.Documento" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'documento.label', default: 'Documento')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'documento.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="nombre" title="${message(code: 'documento.nombre.label', default: 'Nombre')}" />
                        
                            <g:sortableColumn property="descripcion" title="${message(code: 'documento.descripcion.label', default: 'Descripcion')}" />
                        
                            <g:sortableColumn property="estado" title="${message(code: 'documento.estado.label', default: 'Estado')}" />
                        
                            <g:sortableColumn property="tipoDeDocumento" title="${message(code: 'documento.tipoDeDocumento.label', default: 'Tipo De Documento')}" />
                        
                            <th><g:message code="documento.usuarioResponsable.label" default="Usuario Responsable" /></th>
                         	
                         	<g:sortableColumn property="approvalRemark" title="${message(code: 'documento.approvalRemark.label', default: 'Approval Remark')}" />
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${documentoInstanceList}" status="i" var="documentoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${documentoInstance.id}">${fieldValue(bean: documentoInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: documentoInstance, field: "nombre")}</td>
                        
                            <td>${fieldValue(bean: documentoInstance, field: "descripcion")}</td>
                        
                            <td>${fieldValue(bean: documentoInstance, field: "estado")}</td>
                        
                            <td>${fieldValue(bean: documentoInstance, field: "tipoDeDocumento")}</td>
                        
                            <td>${fieldValue(bean: documentoInstance, field: "usuarioResponsable")}</td>
                            
                            <td>${fieldValue(bean: documentoInstance, field: "approvalRemark")}</td>  
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${documentoInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
