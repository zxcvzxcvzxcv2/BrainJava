/**
 * 2018. 5. 15. Dev By Lee H.W
   
   MathExample5.java
 */

/**
 * @author Administrator
 *
 */
public class MathExample5 {

	public static void main(String[] args) {

				for(int i = 1; i <= 6; i++) {
				double randomValue = Math.random();
				int value = (int) (randomValue * 45) + 1;
				System.out.println(i + "번째 난수:" + value);
				}
//				System.out.println(Math.random());
//				System.out.println(Math.random());
//				System.out.println(Math.random());

			}

		

	}


