
package sapienter


import org.codehaus.groovy.grails.commons.ApplicationHolder

class MailController {
	MailService mailService
	
	def index = { 
		/*
		try{
			def body = "Test sapienter"
			// set up the email to send.
			def email = [ 
				to: "gbonsoir@gmail.com",
				from: "sapienterTest@gmail.com",
				subject: "Desde Sapienter",
				text: 	body,
				host: "smtp.gmail.com",
				username: "sapienterTest@gmail.com",
				password: "Sapienter01!"
			]
			
			mailService.sendEmail(email)
			render "entro al servcio correctamente"
		}
		catch(Exception ex)
		{
			ex.printStackTrace()
			render "Tiro un error"
		}
		*/
		try{
			MailStatus mailStatus = ApplicationHolder.application.mainContext.getBean("mailStatus")
//			mailStatus.setController(this)
//			def h = ApplicationHolder.application.mainContext.getBean("imapMessageHandler")

			mailStatus.imapMessageHandler.setMailStatus(mailStatus)
			mailService.recvMail(mailStatus.imapMessageHandler, "customAdapter", "inputChannel")
			render "Recibio Email sin error"
		}
		catch(Exception ex)
		{
			ex.printStackTrace()
			render "Tiro un error en recv"
		}
		try{
//			mailService.recvMail2()
			render "Recibio Email sin error"
		}
		catch(Exception ex)
		{
			ex.printStackTrace()
			render "Tiro un error en recv"
		}
	}
	
	def start = {
		try{
			mailService.start()
			render "Start del adapter"
		}
		catch(Exception ex)
		{
			ex.printStackTrace()
			render "Tiro un error en Start del adapter"
		}
	}
	
	def stop = {
		try{
			mailService.stop()
			render "Stop del adapter"
		}
		catch(Exception ex)
		{
			ex.printStackTrace()
			render "Tiro un error en Stop del adapter"
		}
	}
	
	
	
	def statusChange = { mailStatus ->
		/*
		def mailStatus = ApplicationHolder.application.mainContext.getBean("mailStatus")
		if( mailStatus.status == "current" )
			mailStatus.status="noCurrent"
		else
			mailStatus.status="current"
		
//		new Categoria(nombreCategoria:"Extra-Judicial").save(flush:true)
//		render "Cambiado a "+"${Categoria.count()}"+mailStatus.status
 * */
 
//		render "Cambiado a "+mailStatus.status
		println "Cambiado a "+mailStatus?.status
	}
	
}
