package sapienter

class Jurisprudencia {
	String descripcion
	String fuero
	String jurisprudencia
	String origen
	String sitio
	Usuario usuario
	
    static constraints = {
		descripcion(blank:false)
		fuero(blank:false,inList["Penal","Civil"])
		origen()
		sitio(url:true)
		jurisprudencia(blank:false)
		usuario()
    }
	static belongsTo = [estudio:Estudio]
}
