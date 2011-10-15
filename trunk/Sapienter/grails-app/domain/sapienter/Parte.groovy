package sapienter

class Parte {
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
