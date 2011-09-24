package sapienter

class Tarea {
	Date fechaInicio
	Date fechaFin
	String observacion

	String toString(){
		observacion
	}
	
    static constraints = {
		fechaInicio(blank:false)
		fechaFin(blank:false)
		observacion(blank:false)
	}

	static belongsTo = [calendario:Calendario]

}
