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
    }
	
	static belongsTo = [proceso:Proceso]
}