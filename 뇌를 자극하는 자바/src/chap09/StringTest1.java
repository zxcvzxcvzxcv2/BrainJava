/**
 * 2018. 5. 15. Dev By Lee H.W
   chap09
   StringTest1.java
 */
package chap09;
/**
 long start = System.currentTimeMillis(); //시작하는 시잠 계산
 
 실행시간을 측정하고 싶은 코드
 
 long end = System.currentTimeMillis(); //프로그램이 끝나는 시점 계산
 System.out.println("실행 시간 :" + (end - start)/1000.0"초");  //실행 시간 계산 및 출력
**/

/**

 * @author Administrator
 *
 */
public class StringTest1 {

	public static void main(String[] args) {
		
		long start = System.currentTimeMillis();  // 시작하는 시점 계산
		
		//실행시간을 측정하고 싶은 코드 시작
		//실행 시간 : 0.109
	    String str = "산과 골짜기 위를";
	           str += "둥실 떠가는";
	           str += "구름처럼";
		
		//실행 시간 : 0.094
//		String str= "산과 골짜기 위를 " + 
//		            "둥실 떠가는 " + 
//				    "구름처럼";
		
		//실행시간을 측정하고 싶은 코드 종료
		System.out.println(str);
		
		for(int i=1; i<10000000; i++) {
			
		}
		long end = System.currentTimeMillis(); //프로그램이 끝나는 시점 계산
		//System.out.println("실행 시간 :" + (end - start)/1000.0"초");  //실행 시간 계산 및 출력
		System.out.println("실행 시간 :" + (end - start)/1000.0);
		
		

	}

}
