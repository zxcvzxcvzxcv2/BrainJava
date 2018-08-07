package 알고리즘;

public class Page56 {

	public static void main(String[] args) {
		
		int i = 1, j = 1, k = 0, sum = 2, n = 3;
		
		do {
			k = i + j;
			i = j;
			j = k;
			sum = sum + k;
			n = n + 1;
			
		}while(n<=10);
		
		System.out.println(sum);

	}

}
