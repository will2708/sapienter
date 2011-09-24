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
		categoria(inList: ['Judicial', 'Extra-Judicial'])
		subCategoria (inList:['consultas','acciones','cobros', 'consignaciones', 'convocatorias', 'cumplimientos', 'fraudes', 'daños y perjuicios', 'denuncias', 'divorcio', 'expropiación', 'homicidios', 'hurtos', 'guarda', 'juicios', 'mediaciones', 'nulidades','prescripciones', 'quiebras', 'privaciones', 'tenencia de hijos', 'tutelas', 'usurpación', 'ventas', 'victimas', 'violación'])
		caratula(nullable:true)
		descripcion(nullable:true)
		estado(inlist:['Abierto a pruebas', 'Demanda en preparación', 'Cerró período de apertura de pruebas', 'En tratamiento', 'Cerrado', 'A sentencia', 'A apelar'])
//		extrajudicial (inList: ['En mediación'])
		//solo judicial//
		etapaProcesal(inlist:['Postulatoria', 'Probatoria', 'Conclusiva', 'De Resolución', 'Impugnativa'])
		juzgado(nullable:true)
		numeroDeJuzgado(nullable:true)
		numeroDeProcesoEnJuzgado(nullable:true)
		observaciones(nullable:true)
		responsable(nullable:true)
		subCategoria(nullable:true)
		    }
	
	static belongsTo = [persona:Persona]
	
	static hasMany = [documentos:Documento,
		              gastos:Gasto,
					  movimientos:Movimiento,
					  partes:Parte,
					  procesosRelacionados:Proceso]
}
