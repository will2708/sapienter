package sapienter
//TODO: Ver si el tipo se puede cargar por file con MD
class TipoDeParte {
	Integer tipo
	String descripcion
    static constraints = {
		tipo()
		descripcion(inList:["1","2","3"],blank:false)
    }
	static belongsTo = [estudio:Estudio]
}
