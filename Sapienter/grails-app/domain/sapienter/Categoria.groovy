package sapienter

class Categoria {
	String nombreCategoria
	String toString() {
		"${nombreCategoria}"
		}
    static constraints = {
		
    }
	static hasMany = [subCategorias:Subcategoria]
}
