package MiniProject;


import javax.swing.JFrame;

public class Main {
	login login;
	Test test;
	
	public Main() {
		System.out.println("Main() 생성자");
	}
	
	 // 테스트프레임창
    public void showFrameTest(){
    	System.out.println("Main.showFrameTest();");
    	
        login.dispose(); // 로그인창닫기
        
        this.test = new Test(); // 테스트프레임 오픈
    }

	public static void main(String[] args) {
		
		System.out.println("MainProcess.main() 메소드;");
		
		 // 메인클래스 실행
        Main main = new Main();
        main.login = new login(); // 로그인창 보이기
        main.login.setMain(main); // 로그인창에게 메인 클래스보내기
    }
		
	}


