package MiniProject;

import chap19.WindowExample8_2;

public class Test  {
	
	
	public Test() {
		
		System.out.println("TestFrm()");
		String[] args = {"GUI", "참가자 명단 프로그램"};
		
		
		new WindowExample8_2();  // 생성자 호출
		
		//new WindowExample8_2().main(args);
		
		//setSize(400, 400);
        //setVisible(true);
	}

}
