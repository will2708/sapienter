package sapienter

import ar.com.fdvs.dj.core.layout.HorizontalBandAlignment
import ar.com.fdvs.dj.domain.AutoText
//TODO: Borrar comentarios
class PersonaJuridica extends Persona {
	def static reportable = [
		columns: ['razonSocial', 'cuit','email', 'observaciones'],
		columnTitles: ['razonSocial': 'Razon Social', 'cuit': 'CUIT', 'email': 'E-mail', 'observaciones' : 'Observaciones'],
		autoTexts: [new AutoText(AutoText.AUTOTEXT_PAGE_X_OF_Y, AutoText.POSITION_FOOTER, HorizontalBandAlignment.buildAligment(AutoText.ALIGMENT_CENTER), (byte)0, 200, 200)]]
	static searchable = true
	String auxiliares //
	String cuit //
	String email //
	String fax //
	Date fechaDeInicioActividades //
	String observaciones
	String razonSocial //
	String telefonoDeContacto //
	String toString(){
		razonSocial
	}
	
	

    static constraints = {
			razonSocial(blank:false, matches:"[A-ZÑÁÉÍÓÚa-zñáéíóú0-9.]+(([ '-][A-ZÑÁÉÍÓÚa-zñáéíóú0-9.]+)*)")
			cuit(blank:false, unique:true)
			fechaDeInicioActividades(nullable:true,
									 validator:{return(it < new Date())})
			telefonoDeContacto (nullable:false)
			email(blank:false, email:true)
			fax (nullable:true)
			auxiliares (nullable:true)
			observaciones (maxsize:100, nullable:true)	
		}
	   }
	
	
		


