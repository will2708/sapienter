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
		comentario(blank:false)
		fechaDeCreacion(blank:false)
		diasDeValidez(range:1..365,blank:false)
		fechaDeVencimiento(blank:false)

	}
	
	static belongsTo = [proceso:Proceso]
}
