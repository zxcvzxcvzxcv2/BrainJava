<%@ page  import="java.sql.*,oracle.dbpool.*,java.util.*" contentType="text/html;charset=euc-kr" %>
<%
try {

   //DBǮ �޴��� ��ü ���� ���
DBConnectionManager pool = DBConnectionManager.getInstance();
Connection con = pool.getConnection("ora8");//���ڰ� jdbc
 
	
	int b_id=0;

	String b_name=makeKOR(request.getParameter("name"));
    String pwd= makeKOR(request.getParameter("pwd"));
	String b_email=request.getParameter("email");
	String b_title=makeKOR(request.getParameter("title"));
	String b_content=makeKOR(request.getParameter("body"));
	String ip = request.getRemoteAddr(); // IP �˾Ƴ���


 //������ '�� ���� ������ �߻��ϹǷ� replace ó�����ش�.
 b_title = Replace(b_title,"'","''");
 b_content = Replace(b_content,"'","''");


	 /* �亯������ �߰��� �κ� */
	    int maxref=0;  //DB �ȿ� ��� �ִ� ���� ū �� �׷��ȣ
        int ref=0;
        int step=0;
        int level=0;

    String sql = "select max(b_id),max(ref) from re_board";
	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery(sql);  
	if(rs.next()) {
		b_id=rs.getInt(1); 
		b_id=b_id+1;    
   		maxref=rs.getInt(2); // �� �׸� �ִ밪 ��ȯ
		rs.close();
	} else {
		b_id=1;   
	}
 
        if(request.getParameter("b_id") !=null) { 
             ref=Integer.parseInt(request.getParameter("ref"));
             step=Integer.parseInt(request.getParameter("step"));
             level=Integer.parseInt(request.getParameter("level"));
     String str="update re_board set step=step+1 where ref="+ref+" and step > "+ step;
   			stmt.executeUpdate(str);
   			stmt.close();
            step=step+1;
            level=level+1;
	      }
        else {
                ref=maxref+1;
                step=0;
                level=0;
        }        


	sql = "insert into re_board values(?,?,?,?,?,?,sysdate,?,?,?,?,?)";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setInt(1,b_id);
	pstmt.setString(2,b_name);
	pstmt.setString(3,pwd);
	pstmt.setString(4,b_email);
	pstmt.setString(5,b_title);
	pstmt.setString(6,b_content);
    pstmt.setInt(7,0);
    pstmt.setString(8, ip);
    pstmt.setInt(9,ref);
    pstmt.setInt(10,step);
    pstmt.setInt(11,level);


	pstmt.executeUpdate();
	pstmt.close();
	con.close();
   pool.freeConnection("ora8", con); //���� ����
%>
	 <script language=javascript>
        location.href ="board_list.jsp"; 
     </script> 
<%

	} catch (Exception e) {
		out.println(e);
	}
%>

<%! 

   String makeKOR(String str)throws java.io.UnsupportedEncodingException{
   String kor="";
   if (str==null) 
    kor=null;
   else
    kor=new String(str.getBytes("ISO-8859-1"),"EUC-KR");
   return kor;
   }
	
	   // ���� ó���� ���� �޼ҵ� 

public static String Replace(String original, String oldString, String newString)
           {
 for(int index = 0; (index = original.indexOf(oldString, index)) >= 0; index += newString.length())
                                   original = original.substring(0, index) + newString + original.substring(index + oldString.length());
                       return original;
           }	

%>
<html>
<head><title>��ǻ���������θ�</title>
<script language="Javascript">
function alrim(){
	alert("���������� ����Ͽ����ϴ�.")
	location.href="reply_list.jsp";
}
</script>
</head>
</html>
