package sapienter

import org.codehaus.groovy.grails.commons.ApplicationHolder
class NotificacionMailTagLib {

	/**
	* Returns images depending if there are pending e-mails
	*/
	def notificacionMail = {
		def mailStatus = ApplicationHolder.application.mainContext.getBean("mailStatus")
		if( (mailStatus == null) || mailStatus?.status == null){
			mailStatus.status="noCurrent"
			//		render "${mailStatus.status}" // Just renders the User count and we are done !!!
		}
		if(mailStatus.status == "current"){
			out << "<img class=\"image\" src=\"${createLinkTo(dir: 'images/', file: 'email18.png')}\"/>"
		}
		else{
			out << "<img class=\"image\" src=\"${createLinkTo(dir: 'images/', file: 'email13.png')}\"/>"
		}
	}
}
