package sapienter

class Estudio {
	String Cuit
	String domicilioFiscal
	ModeloDeDocumento modelosDeDocumento
	String razonSocial

    static constraints = {
		razonSocial(blank:false,matches:"[A-ZÑÁÉÍÓÚa-zñáéíóú]+(([ '-][A-ZÑÁÉÍÓÚa-zñáéíóú]+)*)")
		Cuit(blank:false)
		domicilioFiscal(blank:false)
		modelosDeDocumento(nullable:true)
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
