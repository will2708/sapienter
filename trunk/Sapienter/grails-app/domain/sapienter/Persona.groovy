package sapienter

/*import com.sun.net.ssl.internal.ssl.Handshaker.DelegatedTask;*/

class Persona {
	def static reportable = [:]
	static searchable = true
	String toString(){ }
    static constraints = {
    }
	
	static belongsTo = [estudio:Estudio]
	static hasMany = [proceso:Proceso]
}
