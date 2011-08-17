package sapienter

import java.lang.annotation.Documented;
//TODO: Chequear que el mapeo está bien
class Proceso {
	String caratula
	String categoria
	String descripcion
//	Documento documentos
	String estado
	String etapaProcesal
//	Gasto gastos
	Juzgado juzgado
//	Movimiento movimientos
	Integer	numeroDeJuzgado
	Integer numeroDeProcesoEnJuzgado
	String observaciones
//	Parte partes
//	Proceso procesosRelacionados
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
