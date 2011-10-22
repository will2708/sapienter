package sapienter

class Juzgado {
	static searchable = true
	String direccionJuzgado
	String nombreDeJuzgado
	Integer numeroDeJuzgado
	
	String toString(){
		nombreDeJuzgado
	}
	
    static constraints = {
		nombreDeJuzgado(blank:false)
		numeroDeJuzgado(blank:false)
		direccionJuzgado(blank:false)
    }
	
	static belongsTo = [estudio:Estudio]
}
