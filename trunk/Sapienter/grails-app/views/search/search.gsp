<html>
<head>
<title>Buscar Persona</title>
<meta name="layout" content="main" />
</head>
<body>
	<h1>Search</h1>
	<g:form>
		<g:textField name="q" value="${params.q}" />
		<g:submitButton name="search" value="Search" />
	</g:form>
	<hr />
	<g:if test="${searchResult?.results}">
		<g:each var="result" in="${searchResult.results}">
			<div class="searchPersona">
				<div class="searchDe">
					De
					<g:link controller="persona" action="${result.persona.personaId}">
						${result.persona.personaId}
					</g:link>
					...
				</div>
				<div class="searchContent">
					${result.content}
				</div>
			</div>
		</g:each>
	</g:if>
</body>
</html>
