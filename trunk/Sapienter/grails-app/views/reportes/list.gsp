

<%@ page import="sapienter.EnlaceUtil" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'sapienter.reportes', default: 'Reportes')}" />
        <title><g:message code="sapienter.reportes" args="[entityName]" /></title>
    </head>
    <body>   
            <h1>Reportes</h1><br></br>
            <div class="list">
                <table class="tabla">
<!--                     <thead>
                        <tr>
                            <g:sortableColumn property="entidad" title="${message(code: 'reporte.entidad', default: 'Descripcion')}" />
                            <g:sortableColumn property="reporte" title="${message(code: 'reporte.reporte', default: 'Direccion')}" />
                        </tr>
                    </thead> -->
                    <tbody>
                    	<tr class="prop"><td class="descripcion">Personas:</td></tr>
                        <tr class="even">
                            <td>Personas F&iacutesicas</td>
                            <td><a href="/Sapienter/djReport/?entity=personaFisica" target="_blank">Reporte Personas F&iacutesicas</a></td>
                        </tr>                        
                        <tr class="odd">
                            <td>Personas Jur&iacutedicas</td>
                            <td><a href="/Sapienter/djReport/?entity=personaJuridica" target="_blank">Reporte Personas Jur&iacutedicas</a></td>
                        </tr>
                        <tr class="prop"><td class="descripcion"><br></br>Procesos:</td></tr>
                        <tr class="even">
                            <td>Procesos</td>
                            <td><a href="/Sapienter/djReport/?entity=proceso" target="_blank">Reporte Procesos</a></td>
                        </tr>                                                
                        <tr class="odd">
                            <td>Partes de un proceso</td>
                            <td><a href="/Sapienter/djReport/?entity=parte" target="_blank">Reporte Partes de Procesos</a></td>
                        </tr>
                        <tr class="even">
                            <td>Gastos de un proceso</td>
                            <td><a href="/Sapienter/djReport/?entity=gasto" target="_blank">Reporte Gastos de Procesos</a></td>
                        </tr>      
                        <tr class="prop"><td class="descripcion"><br></br>Documentaci&oacuten Legal:</td></tr>
                        <tr class="odd">
                            <td>Jurisprudencia</td>
                            <td><a href="/Sapienter/djReport/?entity=jurisprudencia" target="_blank">Reporte Jurisprudencia</a></td>
                        </tr>         
                        <tr class="prop"><td class="descripcion"><br></br>Informaci&oacuten Estudio:</td></tr>                                                                             
                        <tr class="odd">
                            <td>Usuarios</td>
                            <td><a href="/Sapienter/djReport/?entity=usuario" target="_blank">Usuarios</a></td>
                        </tr>
                        <tr class="even">
                            <td>Estudio</td>
                            <td><a href="/Sapienter/djReport/?entity=estudio" target="_blank">Reporte Estudio</a></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
