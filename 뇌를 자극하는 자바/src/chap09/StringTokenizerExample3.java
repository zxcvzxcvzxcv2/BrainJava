/**
 * 2018. 5. 14. Dev By Lee H.W
   chap09
   StringTokennizerExample3.java
 */
package chap09;

import java.util.*;
/**
 * @author Administrator
 *
 */
public class StringTokenizerExample3 {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		StringTokenizer stok = new StringTokenizer(
				"사과=10|초콜렛=3|샴페인=1", "=|", true);
		
		while(stok.hasMoreTokens()) {
			String token = stok.nextToken();
			//System.out.println(token);
			
			if(token.equals("="))
				System.out.print("\t");
			else if (token.equals("|"))
				System.out.print("\n");
			else
				System.out.print(token);
		}

	}

}
