package sapienter

class TipoDeParte {
	Integer tipo
	String descripcion
    static constraints = {
    }
	static belongsTo = [estudio:Estudio]
}
