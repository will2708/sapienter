package sapienter

import grails.plugins.springsecurity.Secured

class SearchController {
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def search = {
		def query = params.q
		if (!query) {
			return [:]
		}
		try {
			def searchResult = Persona.search(query, params)
			return [searchResult: searchResult]
		} catch (e) {
			return [searchError: true]
		}
	}
}
