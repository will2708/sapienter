package sapienter

class Persona {
		
    static constraints = {
    }
	
	static belongsTo = [estudio:Estudio]
	static hasMany = [proceso:Proceso]
}
