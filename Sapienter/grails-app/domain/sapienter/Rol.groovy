package sapienter

class Rol {
	String rol
	String descripcion
	
    static constraints = {
    }
	
	static belongsTo = [usuario:Usuario]
}
