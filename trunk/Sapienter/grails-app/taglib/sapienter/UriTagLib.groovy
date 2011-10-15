package sapienter

class UriTagLib {
	/**
	* Returns current if the menu title is active or noCurrent otherwise.
	* Valid values for title are
	* inicio
	* doclegal
	* administrar
	* Any other which name is unique in the URI 
	* @attr title REQUIRED the manu title to check.
	*/
	def currentMenu = { attrs, body->
		def uri = request.forwardURI
		switch( attrs.title ){
			case "inicio":
				if( uri ==~ /.*Sapienter\/$/){
					out << "current"
				}
				else{
					out << "nocurrent"
				}				
				break
			case "doclegal":
				if( uri =~ "jurisprudencia" || uri =~ "enlaceUtil" || uri =~ "modeloDeDocumento"){
					out << "current"
				}
				else{
					out << "nocurrent"
				}
				
				break
			case "administrar": 
				if( uri =~ "usuario" || uri =~ "secUserSecRole" || uri =~ "estudio"){
					out << "current"
				}
				else{
					out << "nocurrent"
				}
				break
			case "proceso":
				if( uri =~ "documento" || uri =~ "movimiento" || uri =~ "parte" || uri=~ "gasto" || uri=~ "proceso"){
					out << "current"
				}
				else{
					out << "nocurrent"
				}
			break
			default:
				if( uri =~ attrs.title ){
					out << "current"
				}
				else{
					out << "nocurrent"
				}				
		}
	}
	
  /* def passwordField = { attrs ->
	   attrs.type = "password"
	   attrs.tagName = "passwordField"
	   fieldImpl(out, attrs)
   }
   */
   /**
   * Renders the body with an emoticon.
   *
   * @attr happy whether to show a happy emoticon ('true') or
   * a sad emoticon ('false')
   */
/*
  def emoticon = { attrs, body ->
	 out << body() << (attrs.happy == 'true' ? " :-)" : " :-(")
  }
  */
}
