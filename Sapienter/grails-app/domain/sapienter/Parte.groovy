package sapienter

class Parte {
	def static reportable = [:]
	String Apellido
	String Nombre
	Persona persona
	TipoDeParte tipo
    static constraints = {
		Apellido(validator: { val, obj ->
				def oneOrTheOther = true
				if ((val != null || obj.Nombre != null) &&
					obj.persona != null)
				oneOrTheOther = false
				return oneOrTheOther
        })
		Nombre(validator: { val, obj ->
				def oneOrTheOther = true
				if ((obj.Nombre != null || val != null) &&
					obj.persona != null)
				oneOrTheOther = false
				return oneOrTheOther
        })
		tipo()
		persona(nullable:true,validator: { val, obj ->
			def oneOrTheOther = true
			if (
				
				(  (obj.Apellido != null && obj.Apellido != "")
				|| (obj.Nombre != null   && obj.Nombre != "") ) 
				&& (val != null && val != ""))
				oneOrTheOther = false
			return oneOrTheOther
        })
    }
	String toString(){
		tipo
	}
	static belongsTo = [proceso:Proceso]
}
