package sapienter

class EnlaceUtil {
	String Descripcion
	String Direccion
	Usuario ultimoUsuario
	

    static constraints = {
		Direccion(url:true,blank:false)
		Descripcion(blank:false)
		ultimoUsuario(blank:false)
	}
	static belongsTo = {estudio:Estudio}
}
