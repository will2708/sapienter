package sapienter

import ar.com.fdvs.dj.core.layout.HorizontalBandAlignment
import ar.com.fdvs.dj.domain.AutoText

class Usuario extends SecUser {
	def static reportable = [
            columns: ['username', 'nombre', 'apellido', 'comentarios', 'telefono'],
            columnTitles: ['username': 'ID Usuario', 'nombre': 'Nombre', 'apellido': 'Apellido', 'comentarios':'Comentarios','telefono': 'Telefono'],
            autoTexts: [new AutoText(AutoText.AUTOTEXT_PAGE_X_OF_Y, AutoText.POSITION_FOOTER, HorizontalBandAlignment.buildAligment(AutoText.ALIGMENT_CENTER), (byte)0, 200, 200)]
    ]
	static searchable = true
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
	SecRole rol

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
		correoElectronico(Nullable:true)
		dateCreated()
		lastUpdated()
		telefono()
		usuarioCreacion()
		usuarioModificacion()
		rol()
    }
	static belongsTo = [estudio:Estudio]
}
