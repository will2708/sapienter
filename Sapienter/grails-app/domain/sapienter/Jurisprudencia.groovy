package sapienter

class Jurisprudencia {
	def static reportable = [:]
	static searchable = true
	String descripcion
	String fuero
	String jurisprudencia
	String origen
	String sitio
	Usuario usuario
	
    static constraints = {
		descripcion(blank:false)
		fuero(blank:false,inList:['Civil ',' Familia',' Penal',' Comercial',' Laboral',' Tributario',' Constitucional',' Administrativo',' Ambiental'])
		origen()
		sitio(url:true)
		jurisprudencia(blank:false)
		usuario()
    }
	static belongsTo = [estudio:Estudio]
}