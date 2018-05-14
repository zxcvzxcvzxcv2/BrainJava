package chap09;

import java.util.*;

public class Exercise9_4 {

	public static void main(String[] args) {
		
		StringTokenizer stok = new StringTokenizer("고슴도치, 앵무새, 토끼", ",");
		
		while (stok.hasMoreTokens()) {
			String str = stok.nextToken();
			System.out.println(str);
		}

	}

}
