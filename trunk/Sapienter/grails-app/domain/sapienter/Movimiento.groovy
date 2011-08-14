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
    }
}
