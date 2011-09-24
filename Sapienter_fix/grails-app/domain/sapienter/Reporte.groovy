package sapienter

class Reporte {
	String descripcion
	byte[] reporte
    static constraints = {
    }
	
	static belongsTo = [estudio:Estudio]
}
