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
	
	String toString(){
		caratula
	}

    static constraints = {
		categoria(blank:false)
		subCategoria (blank:false)
		caratula(blank:false)
		descripcion(blank:false)
		estado(inList:['Abierto a pruebas', 'Demanda en preparación', 'Cerró período de apertura de pruebas', 'En tratamiento', 'Cerrado', 'A sentencia', 'A apelar'])
		etapaProcesal(inList:['Postulatoria', 'Probatoria', 'Conclusiva', 'De Resolución', 'Impugnativa','Extra-Judicial'])
		juzgado(nullable:true)
		numeroDeJuzgado(nullable:true)
		numeroDeProcesoEnJuzgado(nullable:true)
		observaciones(nullable:true)
		responsable(nullable:false)
		subCategoria(nullable:true)
		    }
	
	static belongsTo = [persona:Persona]
	
	static hasMany = [documentos:Documento,
		              gastos:Gasto,
					  movimientos:Movimiento,
					  partes:Parte,
					  procesosRelacionados:Proceso]
}
