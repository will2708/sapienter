package sapienter

class Proceso {
	String caratula
	String categoria
	String descripcion
	Documento documentos
	String estado
	String etapaProcesal
	Gasto gastos
	Juzgado juzgado
	Movimiento movimientos
	Integer	numeroDeJuzgado
	Integer numeroDeProcesoEnJuzgado
	String observaciones
	Parte partes
	Proceso procesosRelacionados
	Usuario responsable
	String	subCategoria
	Usuario ultimoModificador
	Usuario usuariosAutorizados
	

    static constraints = {
    }
}
