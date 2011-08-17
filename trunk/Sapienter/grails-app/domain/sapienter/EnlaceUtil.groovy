package sapienter

class EnlaceUtil {
	String Descripcion
	String Direccion
	Usuario ultimoUsuario
	

    static constraints = {
		Direccion(url:true,blank:false)
		Descripcion(blank:false)
		ultimoUsuario(blank:falses)
	}
	static belongsTo = {estudio:Estudio}
}
