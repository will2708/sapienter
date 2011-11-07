<!DOCTYPE html>
<html lang="es">
<head>
<title><g:layoutTitle default="Sapienter" />
</title>
<sec:ifNotLoggedIn>
	<ra><span class="menuButton"><g:link controller="login"> Acceder </g:link></ra>
	</span>
</sec:ifNotLoggedIn>
<sec:ifLoggedIn>
	<ra>Bienvenido: <sec:username/><g:link controller="logout"> (Salir)</g:link></ra>
</sec:ifLoggedIn>
<link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
<link rel="shortcut icon"
	href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<g:layoutHead />
<icep:bridge/>
</head>
<body>
	
	<div id="spinner" class="spinner" style="display: none;">
		<img src="${resource(dir:'images',file:'spinner.gif')}"
			alt="${message(code:'spinner.alt',default:'Loading...')}" />
	</div>
	<div id="SapienterLogo">
		<a id="current" href="${createLink(uri: '/')}" target="_self">
		<div id="centrar-imagen"><img
			src="${resource(dir:'images',file:'Logo-Sapienter (sinFondo).jpg')}"
			alt="Sapienter Pensado para el asesoramiento jurídico" border="0" /></div>
		</a>	
	</div>
	<div id="menu">
		<g:render template="/common/menubar" />
		<div class="body">
			<g:layoutBody />
		</div>
	</div>
</body>
</html>

