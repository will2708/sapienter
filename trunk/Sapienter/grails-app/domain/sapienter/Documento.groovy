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
		estado(inList:['No Revisado', 'Pedido de revisión', 'Pedido de modificación', 'Revisado'],blank:false)
		tipoDeDocumento(inList:['Procesal','Extraprocesal'])
		usuarioResponsable()
		contenidoDocumento()
    }

	String toString(){
		nombre
	}
		
	static belongsTo = [proceso:Proceso]
}
