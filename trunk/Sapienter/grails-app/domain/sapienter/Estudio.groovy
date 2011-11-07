package sapienter

import ar.com.fdvs.dj.core.layout.HorizontalBandAlignment
import ar.com.fdvs.dj.domain.AutoText

class Estudio {
	def static reportable = [:]
	
	String Cuit
	String domicilioFiscal
	String razonSocial

    static constraints = {
		razonSocial(blank:false,matches:"[A-ZÑÁÉÍÓÚa-zñáéíóú]+(([ '-][A-ZÑÁÉÍÓÚa-zñáéíóú]+)*)")
		Cuit(blank:false)
		domicilioFiscal(blank:false)
    }
	
	static hasMany = [enlacesUtiles:EnlaceUtil,
					  jurisprudencias:Jurisprudencia,
					  modelosDeDocumento:ModeloDeDocumento,
					  personas:Persona,
					  reportes:Reporte,
					  usuarios:Usuario,
					  juzgados:Juzgado,
					  tiposDeParte:TipoDeParte]
}
