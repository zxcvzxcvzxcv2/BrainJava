import java.util.ArrayList;
//import java.util.*;
/**
 * 2018. 5. 9. Dev By Lee H.W
   
   ArrayList_Test.java
 */

/**
 * @author Administrator
 *
 */
public class ArrayList_Test {
	
	public static void main(String[] args) {
		
		ArrayList<String> fruits = new ArrayList<String>();
		fruits.add("포도");
		fruits.add("딸기");
		fruits.add("복숭아");
		fruits.add("아보가드로");
		

		
		System.out.println("과일 출력");
		
		for(int i=0; i<fruits.size(); i++) {
			System.out.println(fruits.get(i));
		}
		
		fruits.remove(2);
		
		for(int i=0; i<fruits.size(); i++) {
			System.out.println(fruits.get(i));
		}
		
		
		
//		System.out.println(fruits.get(0));
//		System.out.println(fruits.get(1));
//		System.out.println(fruits.get(2));
//		System.out.println(fruits.get(3));
		
	}

}


//String[] fruits = new String[4];
//fruits[0] = "포도";
//fruits[1] = "딸기";
//fruits[2] = "복숭아";
//fruits[3] = "아보카도";
