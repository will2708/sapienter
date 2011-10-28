// Place your Spring DSL code here
beans = {
	localeResolver(org.springframework.web.servlet.i18n.SessionLocaleResolver) {
		defaultLocale = new Locale("es","ES")
		java.util.Locale.setDefault(defaultLocale)
	}
	
//	smtpAuthenticator(testmail.SmtpAuthenticator, "sapienterTest@gmail.com", "Sapienter01!"){
//	${...}  para usar como place holders un xml, no sé acá
	smtpAuthenticator(sapienter.SmtpAuthenticator, "sapienterTest@gmail.com", "Sapienter01!"){
	}
	
	mailSession(javax.mail.Session, ["mail.smtp.starttls.enable":true, 
		"mail.smtp.socketFactory.port":587, 
		"mail.smtp.auth":true,
		"mail.smtp.starttls.required":true 
		]
		,ref("smtpAuthenticator")
		)
	{ bean ->
		bean.factoryMethod = "getInstance"
	}
	
	mailSender(org.springframework.mail.javamail.JavaMailSenderImpl){
		host = "smtp.gmail.com" // host = "" 
		session = ref("mailSession")
	}
}
