package sapienter

class ModeloDeDocumentoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [modeloDeDocumentoInstanceList: ModeloDeDocumento.list(params), modeloDeDocumentoInstanceTotal: ModeloDeDocumento.count()]
    }

    def create = {
        def modeloDeDocumentoInstance = new ModeloDeDocumento()
        modeloDeDocumentoInstance.properties = params
        return [modeloDeDocumentoInstance: modeloDeDocumentoInstance]
    }

    def save = {
		def sub = Subcategoria.get(params.subCategoria)
		params.remove("subCategoria")
		params.put("subCategoria", sub)
		
		def estudio = Estudio.getAll().get(0)
		params.put("estudio", estudio)
		
        def modeloDeDocumentoInstance = new ModeloDeDocumento(params)
        if (modeloDeDocumentoInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'modeloDeDocumento.label', default: 'ModeloDeDocumento'), modeloDeDocumentoInstance.id])}"
            redirect(action: "show", id: modeloDeDocumentoInstance.id)
        }
        else {
            render(view: "create", model: [modeloDeDocumentoInstance: modeloDeDocumentoInstance])
        }
    }

    def show = {
        def modeloDeDocumentoInstance = ModeloDeDocumento.get(params.id)
        if (!modeloDeDocumentoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'modeloDeDocumento.label', default: 'ModeloDeDocumento'), params.id])}"
            redirect(action: "list")
        }
        else {
            [modeloDeDocumentoInstance: modeloDeDocumentoInstance]
        }
    }

    def edit = {
        def modeloDeDocumentoInstance = ModeloDeDocumento.get(params.id)
        if (!modeloDeDocumentoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'modeloDeDocumento.label', default: 'ModeloDeDocumento'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [modeloDeDocumentoInstance: modeloDeDocumentoInstance]
        }
    }

    def update = {
        def modeloDeDocumentoInstance = ModeloDeDocumento.get(params.id)
        if (modeloDeDocumentoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (modeloDeDocumentoInstance.version > version) {
                    
                    modeloDeDocumentoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'modeloDeDocumento.label', default: 'ModeloDeDocumento')] as Object[], "Another user has updated this ModeloDeDocumento while you were editing")
                    render(view: "edit", model: [modeloDeDocumentoInstance: modeloDeDocumentoInstance])
                    return
                }
            }
            modeloDeDocumentoInstance.properties = params
            if (!modeloDeDocumentoInstance.hasErrors() && modeloDeDocumentoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'modeloDeDocumento.label', default: 'ModeloDeDocumento'), modeloDeDocumentoInstance.id])}"
                redirect(action: "show", id: modeloDeDocumentoInstance.id)
            }
            else {
                render(view: "edit", model: [modeloDeDocumentoInstance: modeloDeDocumentoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'modeloDeDocumento.label', default: 'ModeloDeDocumento'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def modeloDeDocumentoInstance = ModeloDeDocumento.get(params.id)
        if (modeloDeDocumentoInstance) {
            try {
                modeloDeDocumentoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'modeloDeDocumento.label', default: 'ModeloDeDocumento'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'modeloDeDocumento.label', default: 'ModeloDeDocumento'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'modeloDeDocumento.label', default: 'ModeloDeDocumento'), params.id])}"
            redirect(action: "list")
        }
    }

	def listar = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[modeloDeDocumentoInstanceList: ModeloDeDocumento.list(params), modeloDeDocumentoInstanceTotal: ModeloDeDocumento.count()]
	}	

	def usar = {
		def modeloDeDocumentoInstance = ModeloDeDocumento.get(params.id)
		Map variables = new HashMap()
		def str = modeloDeDocumentoInstance.getModeloDeDocumento()
		variables.put("id", params.id.toString())
		def matchAux
		
		if (str != null){
			def regex2 = /(::[a-zA-Z0-9'"¿?\s]+::)/
			def matcher = str =~ regex2
			def i = 0
			matchAux = matcher
			
			for (Iterator iterator = matcher.iterator(); iterator
					.hasNext();) {
				iterator.next()
				variables.put((matcher[i][1]).toString().substring(2,(matcher[i][1]).toString().length()-2),
							  (matcher[i][1]).toString().substring(2,(matcher[i][1]).toString().length()-2))
				i++
			
			}
		}
		return [variables:variables]
	}
	
	def completar = {
		redirect(controller: "documento", action: "createDesdeModelo", params: params)
	}	
}
