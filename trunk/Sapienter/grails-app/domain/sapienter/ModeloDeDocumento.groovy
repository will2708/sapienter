package sapienter

class ModeloDeDocumento {
	static searchable = true
	Categoria categoria
	String descripcion
	String modeloDeDocumento
	String nombre
	Subcategoria subCategoria
	String estado
	
    static constraints = {
		nombre(blank:false)
		descripcion(blank:false)
		categoria(nullable:false)
		subCategoria(nullable:false)
		estado(inList:['No Revisado', 'Pedido de revisión', 'Pedido de modificación', 'Revisado'],blank:false)
    }
	
	static belongsTo = [estudio:Estudio]
}
