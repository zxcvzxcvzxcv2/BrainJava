package chap06;

abstract class MessageSender2 {
	
	String title;
	String senderName;
	
	MessageSender2(String title, String senderName) {
		this.title = title;
		this.senderName = senderName;
	}
	abstract void sendMessage(String recipient);

}
