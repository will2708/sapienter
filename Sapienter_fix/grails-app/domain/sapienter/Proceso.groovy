package sapienter

import java.lang.annotation.Documented;

class Proceso {
	String caratula
	String categoria
	String descripcion
	String estado
	String etapaProcesal
	Juzgado juzgado
	Integer	numeroDeJuzgado
	Integer numeroDeProcesoEnJuzgado
	String observaciones
	Usuario responsable
	String	subCategoria
	Usuario ultimoModificador
	Usuario usuariosAutorizados
	

    static constraints = {
    }
	
	static belongsTo = [persona:Persona]
	
	static hasMany = [documentos:Documento,
		              gastos:Gasto,
					  movimientos:Movimiento,
					  partes:Parte,
					  procesosRelacionados:Proceso]
}
