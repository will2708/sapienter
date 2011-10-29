package sapienter

import ar.com.fdvs.dj.core.layout.HorizontalBandAlignment
import ar.com.fdvs.dj.domain.AutoText

class Proceso {
	def static reportable = [
            columns: ['caratula', 'categoria', 'descripcion', 'estado', 'etapaProcesal'],
            columnTitles: ['caratula': 'Caratula', 'categoria': 'Categoria', 'descripcion': 'Descripción', 'estado':'estado','etapaProcesal': 'Etapa Procesal'],
            autoTexts: [new AutoText(AutoText.AUTOTEXT_PAGE_X_OF_Y, AutoText.POSITION_FOOTER, HorizontalBandAlignment.buildAligment(AutoText.ALIGMENT_CENTER), (byte)0, 200, 200)]
    ]
	static searchable = true
	String caratula 
	Categoria categoria 
	String descripcion 
	String estado 
	String etapaProcesal 
	Juzgado juzgado 
	Integer numeroDeProcesoEnJuzgado
	String observaciones
	Usuario responsable
	Subcategoria subCategoria
	Usuario ultimoModificador
	Set<Usuario> usuariosAutorizados
	
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
