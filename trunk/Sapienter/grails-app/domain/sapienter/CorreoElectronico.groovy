package sapienter

class CorreoElectronico {
	String direccion
	String contrasenia
	String smtpUrl
	String imapUrl
	
    static constraints = {
		direccion(blank:false,mail:true)
		contrasenia(password:true,blank:false)
		smtpUrl(url:true,blank:false)
		imapUrl(url:true,blank:false)
    }
	static belongsTo={usuario:Usuario}
}
