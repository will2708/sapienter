package sapienter

class CorreoElectronico {
	String contrasenia
	String direccion
	String URL
	
    static constraints = {
		direccion(blank:false)
		contrasena(password:true,blank:false)
		URL(url:true,blank:false)
    }
}
