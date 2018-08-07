package 알고리즘;

public class Page47 {
	
	public static void main(String[] args) {
		
		 int sum = 1, cnt = 1, i = 1;
		 
		 do {
			 cnt = cnt + 1;
			 i = i*2;
			 sum = sum + i;
		 }while(cnt < 10);
		 
		 System.out.println(sum);
		 
	}


}
