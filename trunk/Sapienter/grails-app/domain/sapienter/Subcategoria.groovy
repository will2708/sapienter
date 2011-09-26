package sapienter

class Subcategoria {
	String subTipoCategoria
	String toString() {
		"${subTipoCategoria}"
		}
    static constraints = {
    }
	static belongsTo = [categoria:Categoria]
			
}
