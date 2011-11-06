package sapienter

import grails.plugins.springsecurity.Secured

class ReportesController {
	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def index = {
		redirect(action: "list", params: params)
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def list = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[params:params]
	}
}
