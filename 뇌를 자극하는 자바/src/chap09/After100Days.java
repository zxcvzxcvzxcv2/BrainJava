/**
 * 2018. 5. 15. Dev By Lee H.W
   chap09
   After100Days.java
 */
package chap09;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;


/**
 * @author Administrator
 *
 */
public class After100Days {

	public static void main(String[] args) {
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date()); // 현재시간 설정
		
		cal.add(Calendar.DATE,100);  //현재시간에 날짜 더하기
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일");
		String date = dateFormat.format(cal.getTime());
		
		
		System.out.println(date);
		
		
	}

}
