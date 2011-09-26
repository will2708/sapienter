package sapienter

import java.lang.annotation.Documented;

class Proceso {
	String caratula 
	Categoria categoria 
	String descripcion 
	String estado 
	String etapaProcesal 
	Juzgado juzgado 
	Integer	numeroDeJuzgado
	Integer numeroDeProcesoEnJuzgado
	String observaciones
	Usuario responsable
	Subcategoria subCategoria
	Usuario ultimoModificador
	Usuario usuariosAutorizados
	

    static constraints = {
		categoria(inList: ['Judicial', 'Extra-Judicial'])
		subCategoria (inList:['consultas','acciones','cobros', 'consignaciones', 'convocatorias', 'cumplimientos', 'fraudes', 'daños y perjuicios', 'denuncias', 'divorcio', 'expropiación', 'homicidios', 'hurtos', 'guarda', 'juicios', 'mediaciones', 'nulidades','prescripciones', 'quiebras', 'privaciones', 'tenencia de hijos', 'tutelas', 'usurpación', 'ventas', 'victimas', 'violación'])
		caratula(nullable:true)
		descripcion(nullable:true)
		estado(inlist:['Abierto a pruebas', 'Demanda en preparación', 'Cerró período de apertura de pruebas', 'En tratamiento', 'Cerrado', 'A sentencia', 'A apelar'])
		etapaProcesal(inlist:['Postulatoria', 'Probatoria', 'Conclusiva', 'De Resolución', 'Impugnativa','Extra-Judicial'])
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
