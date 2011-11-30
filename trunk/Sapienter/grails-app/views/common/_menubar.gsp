<sec:ifLoggedIn>

	<div class="menu">
		<ul>
			<li><a id=<g:currentMenu title="inicio"/> href="${createLink(uri: '/')}" target="_self" ><g:message code="Inicio"/></a></li>
			<li><a id=<g:currentMenu title="sociedad"/> href="${createLink(uri: '/sociedad')}" target="_self" ><g:message code="Sociedad"/></a></li>
			<li><a id=<g:currentMenu title="afip"/> href="${createLink(uri: '/afip')}" target="_self" ><g:message code="AFIP"/></a></li>
			<li><a id=<g:currentMenu title="usuario"/> href="${createLink(uri: '/usuario')}" target="_self" ><g:message code="Usuarios"/></a></li>
		</ul>	
	</div>
</sec:ifLoggedIn>
