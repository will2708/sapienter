package sapienter

import com.sun.istack.internal.Nullable;
import ar.com.fdvs.dj.core.layout.HorizontalBandAlignment
import ar.com.fdvs.dj.domain.AutoText


class Usuario extends SecUser {
	def static reportable = [ 
		columns: ['username', 'nombre', 'apellido', 'telefono', 'email', 'role.name', 'dateCreated', 'lastUpdated'],
			columnTitles: ['username': 'Usuario', 'nombre':'Nombre', 'apellido': 'Apellido', 'telefono': 'Teléfono', 'email':'E-Mail', 'role.name': 'Role', 'dateCreated':'Fecha Creación', 'lastUpdated':'Fecha Modificación'],
			autoTexts: [new AutoText(AutoText.AUTOTEXT_PAGE_X_OF_Y, AutoText.POSITION_FOOTER, HorizontalBandAlignment.buildAligment(AutoText.ALIGMENT_CENTER), (byte)0, 200, 200)]
	]
  
	String nombre	
	String apellido
	Calendario calendario
	String comentarios
	CorreoElectronico correoElectronico
	Date dateCreated
	Date lastUpdated
	String telefono
	Usuario usuarioCreacion
	Usuario usuarioModificacion
	SecRole role
/*	Para servicio mail preconfigurado */
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
