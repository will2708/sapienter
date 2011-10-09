<!DOCTYPE html>
<html lang="es">
    <head>
        <title><g:layoutTitle default="Sapienter" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
            <meta http-equiv="content-type" content="text/html;charset=utf-8" />
        <g:layoutHead />
    </head>
    <body>
		<script src="${resource(dir:'js',file:'sapienter.js')}"></script>
        <div id="spinner" class="spinner" style="display:none;">
            <img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
        </div>
     	<div id="SapienterLogo"><a id="current" href="${createLink(uri: '/')}" target="_self" ><img src="${resource(dir:'images',file:'Logo.jpg')}" alt="Sapienter Pensado para el asesoramiento jurídico" border="0" /></a></div>
		<div id="menu">
			<g:render template="/common/menubar" />
		 	
		 	<div class="body">
                <g:layoutBody />
            </div>
        </div>
    </body>
</html>

