package sapienter
//TODO: Modificar lista en los tipos de tareas
class Calendario {
	String descripcion
	String tipoDeTareas
	Usuario usuarioResponsable
	
    static constraints = {
		descripcion(blank:false)
		tipoDeTareas(inList:['1','2','3','4'])
		usuarioResponsable(nullable:false)	
    }
	
	static hasMany   = [tareas:Tarea]
	static belongsTo = [usuario:Usuario]
}
