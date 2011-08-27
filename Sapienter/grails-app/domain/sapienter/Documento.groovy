package sapienter
//TODO: Verificar el tema de aprobadores.
class Documento {
	String contenidoDocumento
	String descripcion
	String estado
	String nombre
	String tipoDeDocumento
	Usuario usuarioResponsable 

    static constraints = {
		nombre(blank:false)
		descripcion(blank:false)
		estado(inList:['1','2','3'],blank:false)
		tipoDeDocumento(inList:['1','2','3'])
		usuarioResponsable()
		contenidoDocumento()
    }
	
	static belongsTo = [proceso:Proceso]
}
