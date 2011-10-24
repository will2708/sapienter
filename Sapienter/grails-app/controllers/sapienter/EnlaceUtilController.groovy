package sapienter

import grails.plugins.springsecurity.Secured

class EnlaceUtilController {
	def springSecurityService
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def index = {
        redirect(action: "list", params: params)
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def list = {	
		def enlaceList
		def enlaceTotal
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
		if(params.q){
			enlaceList = EnlaceUtil.search(params.q + "*").results
			enlaceTotal = enlaceList.size
		}
		else{
			enlaceList = EnlaceUtil.list(params)
			enlaceTotal = EnlaceUtil.count()
		}
		[enlaceUtilInstanceList: enlaceList, enlaceUtilInstanceTotal: enlaceTotal]
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def create = {
		def user = SecUser.get(springSecurityService.principal.id)
		def estudio = user.estudio
        def enlaceUtilInstance = new EnlaceUtil()
        enlaceUtilInstance.properties = params
		enlaceUtilInstance.estudio = estudio 
        return [enlaceUtilInstance: enlaceUtilInstance]
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def save = {
		def user = SecUser.get(springSecurityService.principal.id)
		def estudio = user.estudio
		def enlaceUtilInstance = new EnlaceUtil(params)
		enlaceUtilInstance.estudio = estudio
		enlaceUtilInstance.ultimoUsuario = user
        if (enlaceUtilInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'enlaceUtil.label', default: 'EnlaceUtil'), enlaceUtilInstance.id])}"
            redirect(action: "show", id: enlaceUtilInstance.id)
        }
        else {
            render(view: "create", model: [enlaceUtilInstance: enlaceUtilInstance])
        }
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def show = {
        def enlaceUtilInstance = EnlaceUtil.get(params.id)
        if (!enlaceUtilInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'enlaceUtil.label', default: 'EnlaceUtil'), params.id])}"
            redirect(action: "list")
        }
        else {
            [enlaceUtilInstance: enlaceUtilInstance]
        }
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def edit = {
        def enlaceUtilInstance = EnlaceUtil.get(params.id)
        if (!enlaceUtilInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'enlaceUtil.label', default: 'EnlaceUtil'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [enlaceUtilInstance: enlaceUtilInstance]
        }
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def update = {
        def enlaceUtilInstance = EnlaceUtil.get(params.id)
        if (enlaceUtilInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (enlaceUtilInstance.version > version) {
                    
                    enlaceUtilInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'enlaceUtil.label', default: 'EnlaceUtil')] as Object[], "Another user has updated this EnlaceUtil while you were editing")
                    render(view: "edit", model: [enlaceUtilInstance: enlaceUtilInstance])
                    return
                }
            }
            enlaceUtilInstance.properties = params
            if (!enlaceUtilInstance.hasErrors() && enlaceUtilInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'enlaceUtil.label', default: 'EnlaceUtil'), enlaceUtilInstance.id])}"
                redirect(action: "show", id: enlaceUtilInstance.id)
            }
            else {
                render(view: "edit", model: [enlaceUtilInstance: enlaceUtilInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'enlaceUtil.label', default: 'EnlaceUtil'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def enlaceUtilInstance = EnlaceUtil.get(params.id)
        if (enlaceUtilInstance) {
            try {
                enlaceUtilInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'enlaceUtil.label', default: 'EnlaceUtil'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'enlaceUtil.label', default: 'EnlaceUtil'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'enlaceUtil.label', default: 'EnlaceUtil'), params.id])}"
            redirect(action: "list")
        }
    }
}
