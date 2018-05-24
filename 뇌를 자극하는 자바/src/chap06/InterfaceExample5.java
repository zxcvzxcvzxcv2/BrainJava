package chap06;

public class InterfaceExample5 {

	public static void main(String[] args) {
		Label obj = new Label("안녕하세요", 100, 30, "yellow", "green", "굴림체");

		printLabel(obj);
		obj.resize(20, 70);
		obj.setForeground("black");
		obj.setBackground("white");
		obj.setFont("궁서체");
		printLabel(obj);
	}

	static void printLabel(Label obj) {

		System.out.printf("%s: %d x %d 배경색(%s) 전경색(%s) 폰트(%s) %n", obj.text, obj.width, obj.height, obj.background,
				obj.foreground, obj.font);
	}
}
