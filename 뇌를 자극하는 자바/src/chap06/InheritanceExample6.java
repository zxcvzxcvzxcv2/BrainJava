package chap06;

abstract class MessageSender {  //추상 부모클래스
	String title;
	String senderName;
	MessageSender(String title, String senderName) {
		this.title = title;
		this.senderName = senderName;
	}
	abstract void sendMessage(String recipient);
}

class EMailSender extends MessageSender2 { // 자식 클래스
	String senderAddr;
	String emailBody;
	public EMailSender(String title, String senderName, String senderAddr, String emailBody) {
		super(title, senderName);
		this.senderAddr = senderAddr;
		this.emailBody = emailBody;
	}
	
	void sendMessage(String recipient) {
		System.out.println("----------------------------------");
		System.out.println("제목: " + title);
		System.out.println("보내는 사람:" + senderName + " " + senderAddr);
		System.out.println("받는사람:" + recipient);
		System.out.println("내용:" + emailBody);
	}
}

class SMSSender extends MessageSender2 {  //자식 클래스
	String returnPhoneNo;
	String message;
	SMSSender(String title, String senderName, String returnPhoneNo, String message) {
		super(title, senderName);
		this.returnPhoneNo = returnPhoneNo;
		this.message = message;		
	}
	
	void sendMessage(String recipient) {
		System.out.println("-----------------------------------");
		System.out.println("제목: " + title);
		System.out.println("보내는 사람: " + senderName);
		System.out.println("전화번호: " + recipient);
		System.out.println("회신 전화번호: " + returnPhoneNo);
		System.out.println("메시지 내용: " + message);
	}
}

public class InheritanceExample6 {

	public static void main(String[] args) {
		EMailSender obj1 = new EMailSender("생일을 축하합니다", "고객센터", 
				"admin@dukeeshop.co.kr", "10% 할인쿠폰이 발행되었습니다.");
		SMSSender obj2 = new SMSSender("생일을 축하합니다", " 고객센터", 
				"02-000-0000", "10% 할인쿠폰이 발행되었습니다.");
		obj1.sendMessage("hatman@yeyeye.com");
		obj1.sendMessage("stickman@hahaha.com");
		obj2.sendMessage("010-000-0000");
		
		// 객체생성을 일일이 하지 않아도 됨  EMailSender obj1 = new EMailSender();
		//                            SMSSender obj2 = new SMSSender();
		//static은 객체의 모든 성질을 대응함

	}

}
