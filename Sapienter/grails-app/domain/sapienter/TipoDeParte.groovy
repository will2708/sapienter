package sapienter
//TODO: Ver si el tipo se puede cargar por file con MD
class TipoDeParte {
	String descripcion
    static constraints = {
		descripcion(blank:false)
    }
	static belongsTo = [estudio:Estudio]
}
