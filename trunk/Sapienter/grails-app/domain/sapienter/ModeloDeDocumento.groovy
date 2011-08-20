package sapienter

class ModeloDeDocumento {
	String categoria
	String descripcion
	byte[] modeloDeDocumento
	String nombre
	String subCategoria
	String estado
	
    static constraints = {
		nombre(blank:false)
		descripcion(blank:false)
		categoria(inList:["1","2","3"],blank:false)
		subCategoria(blank:false)
		estado(blank:false)
    }
	
	static belongsTo = [estudio:Estudio]
}
