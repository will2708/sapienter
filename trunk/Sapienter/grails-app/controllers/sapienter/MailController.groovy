package sapienter

class MailController {
	MailService mailService
	
    def index = { 
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
		
		try{
			mailService.recvMail()
			render "Recibio Email sin error"
		}
		catch(Exception ex)
		{
			ex.printStackTrace()
			render "Tiro un error en recv"
		}
	}
}
