package sapienter

class Persona {
	Proceso proceso 
		
    static constraints = {
    }
	
	static belongsTo = [estudio:Estudio]
}
