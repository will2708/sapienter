package sapienter

class Movimiento {
	String comentario
	String descripcion
	Integer diasDeValidez
	String estado
	Date fechaDeVencimiento
	Date fechaDeCreacion
	String tipoDeMovimiento

    static constraints = {
		descripcion(blank:false)
		tipoDeMovimiento(inList:["Procesal", "Extra-Procesal"],blank:false)
		estado(inList:["Pendiente","Realizado"],blank:false)
		comentario(nullable:true)
		fechaDeCreacion(blank:false)
		diasDeValidez(range:1..365,nullable:true)
		fechaDeVencimiento(nullable:true)

	}
	
	static belongsTo = [proceso:Proceso]
}
