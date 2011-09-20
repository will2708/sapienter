package sapienter

class Persona {
	static searchable = true
		
    static constraints = {
    }
	
	static belongsTo = [estudio:Estudio]
	static hasMany = [proceso:Proceso]
}
