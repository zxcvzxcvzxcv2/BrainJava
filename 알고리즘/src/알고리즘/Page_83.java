package 알고리즘;

public class Page_83 {

	public static void main(String[] args) {
		
		int [][]ary = new int[5][5];
		int i, j, k=0;
		
		for(i=0; i<=4;i++) {
			for(j=0;j<=i;j++) {
				k=k+1;
				ary[i][j] = k;
			}
		}
		
		for(i=0; i<=4;i++) {
			for(j=0;j<=i;j++) {
				ary[i][j] = k++;
			}
			System.out.printf("%d",ary[i][j]);
		}
		System.out.println();

	}

}
