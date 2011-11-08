package sapienter
import org.springframework.integration.Message;
import org.springframework.integration.MessagingException;
import org.springframework.integration.core.MessageHandler;

class ImapMessageHandler implements MessageHandler {
	MailStatus mailStatus 
	
	public MailStatus getMailStatus(){
		return this.mailStatus
	}
	
	public setMailStatus(MailStatus mailStatus){
		this.mailStatus=mailStatus
	}
	
	@Override
	public void handleMessage(Message<?> message) throws MessagingException {
		
//		println "Message3: " + message

  		if( this.mailStatus.status == "current" )
 
			this.mailStatus.status="noCurrent"
		else
			this.mailStatus.status="current"
		
//		println this.mailStatus.status
//		this.controller.statusChange(this.mailStatus)
//		println new MailController().statusChange()
	}

}
