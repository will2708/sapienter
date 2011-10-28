package sapienter

import org.apache.log4j.Logger;

import org.springframework.core.io.InputStreamResource
import org.springframework.core.io.ByteArrayResource

import org.springframework.mail.MailException
import org.springframework.mail.MailSender
import org.springframework.mail.javamail.MimeMessageHelper


import javax.mail.internet.MimeMessage
import javax.mail.internet.InternetAddress;

import org.springframework.context.ApplicationContextAware
import org.springframework.context.ApplicationContext

//IMAP
//import org.apache.log4j.Logger;
//import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.integration.Message;
import org.springframework.integration.MessagingException;
import org.springframework.integration.channel.DirectChannel;
import org.springframework.integration.core.MessageHandler;

import org.codehaus.groovy.grails.commons.ApplicationHolder

class MailService {

    static transactional = false
//	private static Logger LOG = Logger.getLogger(ImapMail.class);
	MailSender mailSender
//	GrailsApplication grailsApplication
	
/*
	public void setApplicationContext(ApplicationContext applicationContext) {
		this.applicationContext = applicationContext
	}
	*/
	def sendEmail(params) {
		println "esta entrando el aservicio y debería hacer algo"
//		mailSender.host = params.host
//		mailSender.session.smtpAuthenticator.username=params.username
//		mailSender.session.smtpAuthenticator.password=params.password
				
		MimeMessage mimeMessage = mailSender.createMimeMessage()
		
		// start creation of mime message
		MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "ISO-8859-1")
//		helper.from = eMailProperties.from
		helper.from = new InternetAddress(params.from)
//		helper.to = getInternetAddresses(params.to)
		helper.to = new InternetAddress(params.to)
		helper.subject = params.subject
		helper.setText(params.text, true);
		if(params.bcc) helper.setBcc(getInternetAddresses(params.bcc));
		if(params.cc) helper.setCc(getInternetAddresses(params.cc));
		
		// add any attachments
/*		attachements.each { key, value ->
			helper.addAttachment(key, new ByteArrayResource(value))
		}
	*/

	
		mailSender.send mimeMessage
		
	}
	
	private InternetAddress[] getInternetAddresses(List emails) {
		InternetAddress[] mailAddresses = new InternetAddress[emails.size()];
		emails.eachWithIndex {mail, i ->
			mailAddresses[i] = new InternetAddress(mail)
		}
		return mailAddresses;
	}
	
	
	def recvMail() {
//		TODO Sacar, solo agregado para tener linea donde frenar debug
		def d = new Date();

		DirectChannel inputChannel = ApplicationHolder.application.mainContext.getBean("inputChannel", DirectChannel.class)

		inputChannel.subscribe(new MessageHandler() {
			public void handleMessage(Message<?> message) throws MessagingException {
				
//			TODO ver que hacer con el mensaje que llega
//				LOG.info("Message: " + message);
				println "Message: " + message
			}
		});
		
	}

}
