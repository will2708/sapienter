package sapienter

class EnlaceUtilController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [enlaceUtilInstanceList: EnlaceUtil.list(params), enlaceUtilInstanceTotal: EnlaceUtil.count()]
    }

    def create = {
        def enlaceUtilInstance = new EnlaceUtil()
        enlaceUtilInstance.properties = params
        return [enlaceUtilInstance: enlaceUtilInstance]
    }

    def save = {
        def enlaceUtilInstance = new EnlaceUtil(params)
        if (enlaceUtilInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'enlaceUtil.label', default: 'EnlaceUtil'), enlaceUtilInstance.id])}"
            redirect(action: "show", id: enlaceUtilInstance.id)
        }
        else {
            render(view: "create", model: [enlaceUtilInstance: enlaceUtilInstance])
        }
    }

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
