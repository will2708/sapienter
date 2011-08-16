package sapienter

class Documento {
	Byte[] contenidoDocumento
	String descripcion
	String estado
	String nombre
	String tipoDeDocumento
	Usuario usuarioResponsable 

    static constraints = {
		nombre(blank:false)
		descripcion(blank:false)
		estado(blank:false,inList:["1","2","3"])
		tipoDeDocumento(inList:["1","2","3"])
		usuarioResponsable()
		contenidoDocumento()
    }
	
	static belongsTo = [proceso:Proceso]
}
