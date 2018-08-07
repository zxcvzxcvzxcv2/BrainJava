package 알고리즘;

public class Page54 {

	public static void main(String[] args) {
		
		int i = 0, sum = 0, sw = 0;
		
		do {
			i = i + 1;
			
			if(sw == 0) {
				
			sum = sum +i;
			sw = 1;
			
			}
			
			else {
				
				sum = sum-i;
				sw = 0;
				
			}
		}
		while(i<100);
		
		System.out.println(sum);
	}

}
