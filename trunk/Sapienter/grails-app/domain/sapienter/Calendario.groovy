package sapienter

class Calendario {
	String descripcion
//	Tarea tareas
	String tipoDeTareas
	Usuario usuarioResponsable
	
    static constraints = {
		descripcion()
		tipoDeTareas()
		usuarioResponsable()	
    }
	
	static hasMany   = [tareas:Tarea]
	static belongsTo = [usuario:Usuario]
}
