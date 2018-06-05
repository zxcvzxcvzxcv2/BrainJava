package MiniProject;

import java.awt.BorderLayout;
import java.awt.Container;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.GridLayout;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.border.Border;

public class sign_Up {
	
	public static void main(String[] args) {
		
		JFrame frame = new JFrame("회원가입");
		frame.setPreferredSize(new Dimension(300, 200));
		frame.setLocation(600, 300);
		
		Container contentPane = frame.getContentPane();
		
		JPanel panel = new JPanel();
		panel.setLayout(new GridLayout(5, 1));
		
		JTextField id = new JTextField();
		JTextField pass = new JTextField();
		JTextField name = new JTextField();
		JTextField tel = new JTextField();
		JTextField email = new JTextField();
		
		panel.add(new JLabel("ID"));
		panel.add(id);
		panel.add(new JLabel("PASSWORD"));
		panel.add(pass);
		panel.add(new JLabel("NAME"));
		panel.add(name);
		panel.add(new JLabel("PHONE NUM"));
		panel.add(tel);
		panel.add(new JLabel("EMAIL"));
		panel.add(email);
		
		contentPane.add(panel, BorderLayout.CENTER);
		
		contentPane.add(new JButton("회원가입"), BorderLayout.SOUTH);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.pack();
		frame.setVisible(true);

		
		
	
	}
}
