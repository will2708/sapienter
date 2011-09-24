package sapienter
//TODO: Modificar lista en los tipos de tareas
class Calendario {
		
	static hasMany   = [tareas:Tarea]
	static belongsTo = [usuario:Usuario]
}
