	<div class="menu">
	
	<ul>
		<li><a id=<g:currentMenu title="inicio"/> href="${createLink(uri: '/')}" target="_self" ><g:message code="default.home.label"/></a></li>
		<li><a id=<g:currentMenu title="persona"/> href="${createLink(uri: '/persona')}" target="_self" ><g:message code="default.persona.label"/></a></li>
		<li><a id=<g:currentMenu title="proceso"/> href="${createLink(uri: '/proceso')}" target="_self" ><g:message code="default.proceso.label"/></a></li>
		<li><a id=<g:currentMenu title="doclegal"/> target="_self" ><g:message code="default.documentacionlegal.label"/></a>
		<ul>
			<li><a href="${createLink(uri: '/jurisprudencia')}" target="_self"><g:message code="default.jurisprudencia.label"/></a></li>
			<li><a href="${createLink(uri: '/enlaceUtil')}" target="_self"><g:message code="default.enlacesutiles.label"/></a></li>
			<li><a href="${createLink(uri: '/modeloDeDocumento')}" target="_self"><g:message code="default.modelosdocumentos.label"/></a></li>
		</ul>
		</li>
		<li><a id=<g:currentMenu title="reporte"/> href="${createLink(uri: '/reportes')}" target="_self" ><g:message code="default.reportes.label"/></a></li>
		<li><a id=<g:currentMenu title="administrar"/> target="_self" ><g:message code="default.administrar.label"/></a>
		<ul>
			<li><a href="${createLink(uri: '/usuario')}" target="_self"><g:message code="default.usuarios.label"/></a></li>
			<li><a href="${createLink(uri: '/secUserSecRole')}" target="_self"><g:message code="default.roles.label"/></a></li>
			<li><a href="${createLink(uri: '/estudio')}" target="_self"><g:message code="default.estudio.label"/></a></li>
		</ul>
		</li>
	</ul>	
	</div>
	