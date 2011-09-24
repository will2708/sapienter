package sapienter

class Movimiento {
	String comentario
	String descripcion
	Integer diasDeValidez
	String estado
	Date fechaDeVencimiento
	Date fechaDeCreacion
	Integer horaDeCreacion
	Integer horaDeVencimiento
	String tipoDeMovimiento

    static constraints = {
		descripcion(blank:false)
		tipoDeMovimiento(blank:false)
		estado(blank:false)
		comentario(blank:false)
		fechaDeCreacion(blank:false)
		horaDeCreacion(blank:false)
		diasDeValidez(blank:false)
		fechaDeVencimiento(blank:false)
		horaDeVencimiento(blank:false)
	}
	
	static belongsTo = [proceso:Proceso]
}
