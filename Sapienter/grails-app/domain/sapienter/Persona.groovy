package sapienter

/*import com.sun.net.ssl.internal.ssl.Handshaker.DelegatedTask;*/

class Persona {
	static searchable = true
	String toString(){ }
    static constraints = {
    }
	
	static belongsTo = [estudio:Estudio]
	static hasMany = [proceso:Proceso]
}
