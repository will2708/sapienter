package sapienter

import grails.plugins.springsecurity.Secured

class SecUserSecRoleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
		@Secured(['ROLE_SENIOR','IS_AUTHENTICATED_FULLY'])
    def index = {
        redirect(action: "list", params: params)
    }
		@Secured(['ROLE_SENIOR','IS_AUTHENTICATED_FULLY'])
    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [secUserSecRoleInstanceList: SecUserSecRole.list(params), secUserSecRoleInstanceTotal: SecUserSecRole.count()]
    }
		@Secured(['ROLE_SENIOR','IS_AUTHENTICATED_FULLY'])
    def create = {
        def secUserSecRoleInstance = new SecUserSecRole()
        secUserSecRoleInstance.properties = params
        return [secUserSecRoleInstance: secUserSecRoleInstance]
    }
		@Secured(['ROLE_SENIOR','IS_AUTHENTICATED_FULLY'])
    def save = {
        def secUserSecRoleInstance = new SecUserSecRole(params)
        if (secUserSecRoleInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'secUserSecRole.label', default: 'SecUserSecRole'), secUserSecRoleInstance.id])}"
            redirect(action: "show", id: secUserSecRoleInstance.id)
        }
        else {
            render(view: "create", model: [secUserSecRoleInstance: secUserSecRoleInstance])
        }
    }
		@Secured(['ROLE_SENIOR','IS_AUTHENTICATED_FULLY'])
    def show = {
        def secUserSecRoleInstance = SecUserSecRole.get(params.id)
        if (!secUserSecRoleInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'secUserSecRole.label', default: 'SecUserSecRole'), params.id])}"
            redirect(action: "list")
        }
        else {
            [secUserSecRoleInstance: secUserSecRoleInstance]
        }
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def edit = {
        def secUserSecRoleInstance = SecUserSecRole.get(params.id)
        if (!secUserSecRoleInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'secUserSecRole.label', default: 'SecUserSecRole'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [secUserSecRoleInstance: secUserSecRoleInstance]
        }
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def update = {
        def secUserSecRoleInstance = SecUserSecRole.get(params.id)
        if (secUserSecRoleInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (secUserSecRoleInstance.version > version) {
                    
                    secUserSecRoleInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'secUserSecRole.label', default: 'SecUserSecRole')] as Object[], "Another user has updated this SecUserSecRole while you were editing")
                    render(view: "edit", model: [secUserSecRoleInstance: secUserSecRoleInstance])
                    return
                }
            }
            secUserSecRoleInstance.properties = params
            if (!secUserSecRoleInstance.hasErrors() && secUserSecRoleInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'secUserSecRole.label', default: 'SecUserSecRole'), secUserSecRoleInstance.id])}"
                redirect(action: "show", id: secUserSecRoleInstance.id)
            }
            else {
                render(view: "edit", model: [secUserSecRoleInstance: secUserSecRoleInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'secUserSecRole.label', default: 'SecUserSecRole'), params.id])}"
            redirect(action: "list")
        }
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def delete = {
        def secUserSecRoleInstance = SecUserSecRole.get(params.id)
        if (secUserSecRoleInstance) {
            try {
                secUserSecRoleInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'secUserSecRole.label', default: 'SecUserSecRole'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'secUserSecRole.label', default: 'SecUserSecRole'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'secUserSecRole.label', default: 'SecUserSecRole'), params.id])}"
            redirect(action: "list")
        }
    }
}
