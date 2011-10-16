package sapienter

import grails.plugins.springsecurity.Secured

class DocumentoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def index = {
        redirect(action: "list", params: params)
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [documentoInstanceList: Documento.list(params), documentoInstanceTotal: Documento.count()]
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def create = {
        def documentoInstance = new Documento()
        documentoInstance.properties = params
        return [documentoInstance: documentoInstance]
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def save = {
		def proceso = params.proceso
		params.remove("proceso")
		
        def documentoInstance = new Documento(params)
		documentoInstance.proceso = Proceso.get(proceso)
        if (documentoInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'documento.label', default: 'Documento'), documentoInstance.id])}"
            redirect(action: "show", id: documentoInstance.id)
        }
        else {
            render(view: "create", model: [documentoInstance: documentoInstance])
        }
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def show = {
        def documentoInstance = Documento.get(params.id)
        if (!documentoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'documento.label', default: 'Documento'), params.id])}"
            redirect(action: "list")
        }
        else {
            [documentoInstance: documentoInstance]
        }
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def edit = {
        def documentoInstance = Documento.get(params.id)
        if (!documentoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'documento.label', default: 'Documento'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [documentoInstance: documentoInstance]
        }
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def update = {
        def documentoInstance = Documento.get(params.id)
        if (documentoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (documentoInstance.version > version) {
                    
                    documentoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'documento.label', default: 'Documento')] as Object[], "Another user has updated this Documento while you were editing")
                    render(view: "edit", model: [documentoInstance: documentoInstance])
                    return
                }
            }
            documentoInstance.properties = params
            if (!documentoInstance.hasErrors() && documentoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'documento.label', default: 'Documento'), documentoInstance.id])}"
                redirect(action: "show", id: documentoInstance.id)
            }
            else {
                render(view: "edit", model: [documentoInstance: documentoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'documento.label', default: 'Documento'), params.id])}"
            redirect(action: "list")
        }
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def delete = {
        def documentoInstance = Documento.get(params.id)
        if (documentoInstance) {
            try {
                documentoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'documento.label', default: 'Documento'), params.id])}"
                def parametros = new HashMap()
				parametros.put("id", documentoInstance.proceso.id)
				redirect(controller:"proceso", action:"show", params:parametros)
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'documento.label', default: 'Documento'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'documento.label', default: 'Documento'), params.id])}"
            redirect(action: "list")
        }
    }
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def createDesdeModelo = {
		println params
		def id = params.modId
		def modeloDeDocumentoInstance = ModeloDeDocumento.get(id)
		Map variables = new HashMap()
		def str = modeloDeDocumentoInstance.getModeloDeDocumento()
		def nuevoTexto
		def nuevaBusqueda
		def documentoInstance = new Documento()
		documentoInstance.proceso = Proceso.get(params.proId)
			
		if (str != null){
			def regex2 = /(::[a-zA-Z0-9'"¿?\s]+::)/
			def matcher = str =~ regex2
			def i = 0
				
			for (Iterator iterator = matcher.iterator(); iterator
					.hasNext();) {
				iterator.next()
				nuevoTexto = (matcher[i][1]).toString().substring(2,(matcher[i][1]).toString().length()-2)
				nuevoTexto = params.getAt(nuevoTexto)
				nuevaBusqueda = matcher[i][0]
				regex2 = /$nuevaBusqueda/
				str = str.replaceAll(regex2, nuevoTexto)
				i++
			
			}
		}
				
		documentoInstance.setContenidoDocumento(str)
		render(view: "create", model: [documentoInstance: documentoInstance])
	}

}
