<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Results</title>
<link rel="stylesheet" type="text/css" href="styles.css">

<%
	String a[]=new String[100];
	Class.forName("com.mysql.cj.jdbc.Driver");
	java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineVoting","root","123456");
	
	PreparedStatement preparedStatement=con.prepareStatement("select party,count(party) as c from vote group by party");
	ResultSet rs=((java.sql.Statement)preparedStatement).executeQuery("select party,count(party) as c from vote group by party");
	
	int i=0;
	while(rs.next()){
		String temp=rs.getString("c");
		int temp2=Integer.valueOf(temp)-1;
		a[i]=Integer.toString(temp2);
		i++;
	}
%>

</head>
<%@ include file="adminNavBar.jsp"%>
<body>
<div class="checkTable">
<table>
<tr>
<th>
Parties
</th>
<th>
Names
</th>
<th>
Votes
</th>
</tr>

<tr>
<td>
<img src="images/AAP.jpg" alt="AAP">
</td>
<td>Aam Aadmi Party</td>
<td><%=a[0]%></td>
</tr>

<tr>
<td>
<img src="images/bjp.jpg" alt="BJP">
</td>
<td>BJP</td>
<td><%=a[1]%></td>
</tr>

<tr>
<td>
<img src="images/congress.jpg" alt="congress">
</td>
<td>Congress</td>
<td><%=a[2]%></td>
</tr>

<tr>
<td>
<img src="images/cpim.jpg" alt="CPIM">
</td>
<td>CPIM</td>
<td><%=a[3]%></td>
</tr>

<tr>
<td>
<img src="images/tmc.jpg" alt="TMC">
</td>
<td>TMC</td>
<td><%=a[4]%></td>
</tr>

</table>
</div>
</body>
</html>