package sapienter

import org.springframework.integration.Message;
import org.springframework.integration.MessagingException;
import org.springframework.integration.core.MessageHandler;

class MailStatus {
	public String status 
	public ImapMessageHandler imapMessageHandler
//	public MailController controller
	
	public String getStatus(){
		return this.status
	}
	
	public setStatus(String status){
		this.status=status
	}
	
	public ImapMessageHandler getImapMessageHandler(){
		return this.imapMessageHandler
	}
	
	public setImapMessageHandler(ImapMessageHandler imapMessageHandler){
		this.imapMessageHandler=imapMessageHandler
	}
	
	public MailController getController(){
		return this.controller
	}
	
	public setController(MailController controller){
		this.controller=controller
	}

}