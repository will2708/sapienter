package sapienter

class Juzgado {
	String direccionJuzgado
	String nombreDeJuzgado
	Integer numeroDeJuzgado
	
    static constraints = {
		nombreDeJuzgado(blank:false)
		numeroDeJuzgado(blank:false)
		direccionJuzgado(blank:false)
    }
	
	static belongsTo = [estudio:Estudio]
}
