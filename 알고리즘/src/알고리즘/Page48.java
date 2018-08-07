package 알고리즘;

public class Page48 {
	
	public static void main(String[] args) {
		
		double i = 0, sum = 0; 
		
		do {
			i = i + 1;
			sum = sum + 1/i;
		}
		while(i<100);
		
		System.out.println("i = " + i + "   sum = " + sum);
	}

}
