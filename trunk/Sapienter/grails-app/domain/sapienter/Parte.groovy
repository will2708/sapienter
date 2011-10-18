package sapienter

class Parte {
	def static reportable = [:]
	String Apellido
	String Nombre
	Persona persona
	TipoDeParte tipo
    static constraints = {
		Apellido()
		Nombre()
		tipo()
		persona(nullable:true)
    }
	
	static belongsTo = [proceso:Proceso]
}
