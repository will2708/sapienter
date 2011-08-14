package sapienter

class Usuario {
	String apellido
	Calendario calendario
	String comentarios
	String contrasena
    CorreoElectronico correoElectronico
	String estadoUsuario
	Date dateCreated
	Date lastUpdated
	String idUsuario
	String nombre
	Rol rol
	String telefono
	Usuario usuarioCreacion
	Usuario usuarioModificacion
	
	    static constraints = {
    }
}
