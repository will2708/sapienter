package sapienter

import com.sun.istack.internal.Nullable;

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
	String telefono
	Usuario usuarioCreacion
	Usuario usuarioModificacion
	
	static constraints = {
		idUsuario(blank:false)
		nombre(blank:false)
		apellido(blank:false)
		calendario(Nullable:true)
		comentarios(MaxSize:1000)
		contrasena(blank:false,password:true)
		correoElectronico(Nullable:true)
		estadoUsuario(inList:["Activo","Inactivo"])
		dateCreated()
		lastUpdated()
		rol()
		telefono()
		usuarioCreacion()
		usuarioModificacion()
    }
	static hasMany = [rol:Rol]
	static belongsTo = [estudio:Estudio]
}
