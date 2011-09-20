package sapienter
class SearchController {
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
