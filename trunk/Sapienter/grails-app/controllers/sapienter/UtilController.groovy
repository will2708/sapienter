package sapienter

import org.codehaus.groovy.grails.commons.ApplicationHolder
class UtilController {

    def index = { }
	
	def alert = {
		
		def mailStatus = ApplicationHolder.application.mainContext.getBean("mailStatus")
		if( (mailStatus == null) || mailStatus?.status == null)
			mailStatus.status="noCurrent"
//		render "${mailStatus.status}" // Just renders the User count and we are done !!!

		if(mailStatus.status == "current")
			render "<img class=\"image\" src=\"${createLinkTo(dir: 'images/', file: 'email_envelope.png')}\"/>"
		else
			render "<img class=\"image\" src=\"${createLinkTo(dir: 'images/', file: 'email13.png')}\"/>"
		
			
//		render "${Categoria.count()}"+mailStatus.status
	}
}
