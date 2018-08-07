<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>

<!DOCTYPE html>

<html>

<head>

<title>책 정보</title>

<meta charset="UTF-8">




</head>

<body>

	<%
		Class.forName("com.mysql.jdbc.Driver"); // mysql 연동

		String url = "jdbc:mysql://localhost:3306/webdb"; // mysql 데이터베이스명

		String mysql_id = "root"; // mysql id값

		String mysql_pw = "12345"; // mysql pw값

		int total = 0;

		try {

			Connection conn = DriverManager.getConnection(url, mysql_id, mysql_pw); // 실제 DB 연동시도

			Statement stmt = conn.createStatement();

			String totalSql = "select count(*) from goodsinfo;"; // 총 글갯수를 찾는 sql문

			ResultSet rs = stmt.executeQuery(totalSql);

			if (rs.next()) { // 결과가 있다면 true값을 반환합니다

				total = rs.getInt(1); // total에 전체 글 갯수 값 대입

			}

			// total은 나중에 페이징 처리시 사용

			String listSql = "select gcode, title, writer, price from goodsinfo;"; // 전체 리스트를 가져오는 sql문

			rs = stmt.executeQuery(listSql);

			// try catch에서 오류가없을시에 출력되는 내용입니다
	%>


	<%
		// total이 0일때, 곧 게시글이 아무것도 없을때 출력되는 내용입니다.

			if (total == 0) {
	%>

	<%
		// total이 0이 아닐때 변수를 선언해주고 출력되는 내용을 순서에 맞게 대입하는 내용입니다.

			} else {

				while (rs.next()) { //rs값이 있을때까지 반복합니다.

					int gcode = rs.getInt(1); // sql문의 첫번째 컬럼내용을 담습니다.

					String title = rs.getString(2); // sql문의 두번째 컬럼내용을 담습니다.

					String writer = rs.getString(3); // sql문의 세번째 컬럼내용을 담습니다.

					int price = rs.getInt(4); // sql문의 네번째 컬럼내용을 담습니다.

					// 실제 리스트가 출력되는 부분 입니다.
	%>



	코드: <%=gcode%><br /> 
	제목: <%=title%><br /> 
	저자: <%=writer%><br /> 
	가격: <%=price%><br /><br />



	<%
		}

			}

			rs.close();

			conn.close();

			stmt.close();

		} catch (SQLException e) {

			out.println(e.toString());

		}
	%>



</body>

</html>