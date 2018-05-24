package Chap19;

import java.awt.Container;
import java.awt.Dimension;
import javax.swing.JLabel;
import javax.swing.SwingConstants;
import javax.swing.JFrame;

public class WindowExample1 {

	public static void main(String[] args) {
		
		JFrame frame = new JFrame("Hello Java Program");
		
		frame.setPreferredSize(new Dimension(300,200));
		Container contentPane = frame.getContentPane();
		
		JLabel label = new JLabel("Ｈｅｌｌｏ　Ｊａｖａ", SwingConstants.CENTER);
		
		contentPane.add(label);
		frame.pack();
		frame.setVisible(true);
		frame.setLocationRelativeTo(null); 

	}

}
