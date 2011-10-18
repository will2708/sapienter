package sapienter
//TODO: Borrar comentarios
class PersonaJuridica extends Persona {
	def static reportable = [:]
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
			fechaDeInicioActividades (nullable:true)
			telefonoDeContacto (nullable:false)
			email(blank:false, email:true)
			fax (nullable:true)
			auxiliares (nullable:true)
			observaciones (maxsize:100, nullable:true)	
		}
	   }
	
	
		


