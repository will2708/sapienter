package sapienter

class Notifica {
	static belongsTo = Persona
	String descripcion
	String domicilio
	String ciudad
	String codigoPostal
	String telefono
	String fax
	String email
	String auxiliar1
	String auxiliar2

    static constraints = {
		descripcion(blank:false)
		domicilio(blank:false)
		ciudad(blank:false)
		codigoPostal(blank:false)
		email(email:true)
    }
}
