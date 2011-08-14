package sapienter

class PersonaJuridica extends Persona {
	String auxiliares //
	String cuit //
	String email //
	String fax //
	Date fechaDeInicioActividades //
	String observaciones
	String razonSocial //
	String telefonoDeContacto //
	
	

    static constraints = {
			razonSocial(blank:false, matches:"[A-ZÑÁÉÍÓÚa-zñáéíóú]+(([ '-][A-ZÑÁÉÍÓÚa-zñáéíóú]+)*)")
			cuit(nullable:false)
			fechaDeInicioActividades (nullable:true)
			telefonoDeContacto (nullable:false)
			email(blank:false, email:true)
			fax (nullable:true)
			auxiliares (nullable:true)
			observaciones (maxsize:100, nullable:true)
				//		sitioWeb(url:true)
	
		}
	   }
	
	
		


