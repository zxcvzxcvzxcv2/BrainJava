<%@ page  import="java.sql.*,oracle.dbpool.*" contentType="text/html;charset=euc-kr" %>

<%
try {

   //DBǮ �޴��� ��ü ���� ���
DBConnectionManager pool = DBConnectionManager.getInstance();
Connection con = pool.getConnection("ora8");
 	
	String b_name=makeKOR(request.getParameter("name"));
    String pwd = request.getParameter("pwd");
	String b_email=request.getParameter("email");
	String b_title=makeKOR(request.getParameter("title"));
	String b_content=makeKOR(request.getParameter("content"));
	String ip = request.getRemoteAddr(); // IP �˾Ƴ���

   //������ '�� ���� ������ �߻��ϹǷ� replace ó�����ش�.
   b_title = Replace(b_title,"'","''");
   b_content = Replace(b_content,"'","''");
  

 //HTML �±�(tag) ȿ���� �����ϰ� �ʹٸ�
 if(request.getParameter("tag") != null){
 b_title = Replace(b_title,"&","&amp;");
 b_title = Replace(b_title,"<","&lt;");
 b_title = Replace(b_title,">","&gt;");
 
 b_content = Replace(b_content,"&","&amp;");
 b_content = Replace(b_content,"<","&lt;");
 b_content = Replace(b_content,">","&gt;");
 }

String b_id = request.getParameter("b_id");
     
  	Statement stmt= con.createStatement();
    ResultSet rs = stmt.executeQuery("select pwd from re_board where b_id="+b_id); 

	if(rs.next()){	
       	if(pwd.equals(rs.getString("pwd"))) { 
       		String  sql = "update re_board set b_name='"+b_name ;
	   		sql = sql + "' ,b_email='"+b_email +"' , b_title='"+b_title;
	   		sql = sql + "' ,b_content='"+b_content+"' where b_id="+b_id;

			stmt.executeUpdate(sql);
        } else { 
%>
            <script language=javascript>
            	alert("���� ������ �� �����ϴ�.");
                history.back();
            </script>
<%
        }

	}
	
	rs.close();
	stmt.close(); 
	pool.freeConnection("ora8", con);
%>
    <script language=javascript>
    	alert("���� �Ͽ����ϴ�.");
    	location.href="board_list.jsp";
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
	alert("���������� �����Ͽ����ϴ�.");
	location.href="board_list.jsp";
}
</script>
</head>
<body onload="alrim();">
</body>
</html>
