import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Random;


public class RandomExample2 {

	public static void main(String[] args) {
		
		Date date = new Date();
		System.out.println(date.getTime());
		
		GregorianCalendar gcalendar = new GregorianCalendar();
		System.out.println(gcalendar.getTimeInMillis());
		
		Random random = new Random(date.getTime());
		System.out.println(random.nextInt(100));
		System.out.println(random.nextInt(100));
		System.out.println(random.nextInt(100));

	}

}
