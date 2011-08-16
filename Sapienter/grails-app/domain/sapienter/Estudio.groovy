package sapienter

class Estudio {
	String Cuit
	String domicilioFiscal
	EnlaceUtil enlacesUtiles
	Jurisprudencia jurisprudencias
	ModeloDeDocumento modelosDeDocumento
	Persona personas
	String razonSocial
	Reporte reportes
	Usuario usuarios
	Juzgado juzgados
	TipoDeParte tiposDeParte

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
