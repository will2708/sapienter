package sapienter

class Tarea {
	Date fecha
	String observacion

    static constraints = {
		fecha(blank:false)
		observacion(blank:false)
	}
	
	static belongsTo = [calendario:Calendario]
}
