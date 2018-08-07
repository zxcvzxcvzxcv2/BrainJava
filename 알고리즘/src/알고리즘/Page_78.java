package 알고리즘;

public class Page_78 {
	
	public static void main(String[] args) {
	
		int [][]ary = new int[5][5];
		
	    int i, j, cnt = 1;
	
	    for(i=1; i<5; i++) {
		   for(j=1; j<5; j++) {
			   ary[i][j] = cnt++;
		   }
	    }
	    
	    
	    for(i=1; i<5; i++) {
			   for(j=1; j<5; j++) {
				   System.out.printf("%-5d", ary[i][j]);
			   }
			   System.out.println();
	    }	   
	}
}
