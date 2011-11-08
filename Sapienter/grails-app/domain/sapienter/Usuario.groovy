package sapienter

import com.sun.istack.internal.Nullable;

class Usuario extends SecUser {
	String apellido
	Calendario calendario
	String comentarios
	CorreoElectronico correoElectronico
	Date dateCreated
	Date lastUpdated
	String nombre
	String telefono
	Usuario usuarioCreacion
	Usuario usuarioModificacion
	SecRole role
//	Para servicio mail preconfigurado
	String adapter
	String channel
	Boolean mailActivo
	
	String toString(){
		username
	}
		
	static constraints = {
		username(blank:false)
		password(blank:false,password:true)
		enabled()
		accountExpired()
		accountLocked()
		passwordExpired()
		nombre(blank:false)
		apellido(blank:false)
		calendario(Nullable:true)
		comentarios(MaxSize:1000)
		correoElectronico(Nullable:true,email:true)
		dateCreated()
		lastUpdated()
		telefono()
		usuarioCreacion()
		usuarioModificacion()
		role()
		email()
		firstName(nullable:true)
		lastName(nullable:true)
    }
	static belongsTo = [estudio:Estudio]
}
