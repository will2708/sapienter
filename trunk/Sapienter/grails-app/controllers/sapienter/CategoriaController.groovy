package sapienter
import grails.converters.*
import grails.plugins.springsecurity.Secured


class CategoriaController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def index = {
		redirect(action: "list", params: params)
	}
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def list = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[categoriaInstanceList: Categoria.list(params), categoriaInstanceTotal: Categoria.count()]
	}
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def create = {
		def categoriaInstance = new Categoria()
		categoriaInstance.properties = params
		return [categoriaInstance: categoriaInstance]
	}
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def save = {
		def categoriaInstance = new Categoria(params)
		if (categoriaInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'categoria.label', default: 'Categoria'), categoriaInstance.id])}"
			redirect(action: "show", id: categoriaInstance.id)
		}
		else {
			render(view: "create", model: [categoriaInstance: categoriaInstance])
		}
	}
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def show = {
		def categoriaInstance = Categoria.get(params.id)
		if (!categoriaInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'categoria.label', default: 'Categoria'), params.id])}"
			redirect(action: "list")
		}
		else {
			[categoriaInstance: categoriaInstance]
		}
	}
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def edit = {
		def categoriaInstance = Categoria.get(params.id)
		if (!categoriaInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'categoria.label', default: 'Categoria'), params.id])}"
			redirect(action: "list")
		}
		else {
			return [categoriaInstance: categoriaInstance]
		}
	}
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def update = {
		def categoriaInstance = Categoria.get(params.id)
		if (categoriaInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (categoriaInstance.version > version) {

					categoriaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [
						message(code: 'categoria.label', default: 'Categoria')]
					as Object[], "Another user has updated this Categoria while you were editing")
					render(view: "edit", model: [categoriaInstance: categoriaInstance])
					return
				}
			}
			categoriaInstance.properties = params
			if (!categoriaInstance.hasErrors() && categoriaInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'categoria.label', default: 'Categoria'), categoriaInstance.id])}"
				redirect(action: "show", id: categoriaInstance.id)
			}
			else {
				render(view: "edit", model: [categoriaInstance: categoriaInstance])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'categoria.label', default: 'Categoria'), params.id])}"
			redirect(action: "list")
		}
	}
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def delete = {
		def categoriaInstance = Categoria.get(params.id)
		if (categoriaInstance) {
			try {
				categoriaInstance.delete(flush: true)
				flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'categoria.label', default: 'Categoria'), params.id])}"
				redirect(action: "list")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'categoria.label', default: 'Categoria'), params.id])}"
				redirect(action: "show", id: params.id)
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'categoria.label', default: 'Categoria'), params.id])}"
			redirect(action: "list")
		}
	}
	def ajaxGetSubcategorias = {
		def lista
		def proceso
		def lista2
		def modelo
		def categoria = Categoria.get(params.id)
		if (params.proceso != null){
			if (categoria != null){
				lista = categoria.subCategorias
				lista2 = new ArrayList()
				proceso = Proceso.get(params.proceso)
				
				lista.remove(proceso.subCategoria)
				lista2.add(proceso.subCategoria)
				lista2.addAll(lista)
			}
			render lista2 as JSON
		}else if(params.modelo != null){
			if (categoria != null){
				lista = categoria.subCategorias
				lista2 = new ArrayList()
				modelo = ModeloDeDocumento.get(params.modelo)
				
				lista.remove(modelo.subCategoria)
				lista2.add(modelo.subCategoria)
				lista2.addAll(lista)
			}
			render lista2 as JSON
		}
		else{ 
			if (categoria != null)
				render categoria?.subCategorias as JSON
		}
	}
	def ajaxGetSubcategorias2 = {
		def categoria = Categoria.get(1)
		if (categoria != null)
			render categoria?.subCategorias as JSON
	}
}
