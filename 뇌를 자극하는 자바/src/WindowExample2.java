package Chap19;

import java.awt.BorderLayout;
import java.awt.Container;
import java.awt.Dimension;
import java.awt.event.ActionListener;

//import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;

public class WindowExample2 {

	public static void main(String[] args) {
		
		JFrame frame = new JFrame("Hello Program");
		frame.setPreferredSize(new Dimension(200, 70));
		//frame.setLocation(500, 400);
		
		//ImageIcon image = new ImageIcon("image/b1.jpg");
		//JLabel imageLabel = new JLabel(image);
		
		Container contentPane = frame.getContentPane();
		
		JTextField text = new JTextField("이름을 입력하세요.");
		JButton button = new JButton("확인");
		JLabel label = new JLabel("Hello");
		
		contentPane.add(text, BorderLayout.CENTER);
		contentPane.add(button, BorderLayout.EAST);
		contentPane.add(label, BorderLayout.SOUTH);
		//contentPane.add(imageLabel, BorderLayout.NORTH);
		
		ActionListener listener = new ConfirmButtonActionListener(text, label);
		button.addActionListener(listener);
		
		text.setFocusable(false);  // 포커스 해제
		
		
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.pack();
		frame.setVisible(true);
		frame.setLocationRelativeTo(null);  // 화면 정중앙 배치
	}

}
