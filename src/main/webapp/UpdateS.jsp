<%@page import="java.io.PrintWriter"%>
<%@page import="Student.Student"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Student</title>
</head>
<body>
<%
int id1=Integer.parseInt(request.getParameter("Id"));
EntityManagerFactory emf=Persistence.createEntityManagerFactory("siddharth");
EntityManager em=emf.createEntityManager();
Student t=em.find(Student.class, id1);
if(t==null)
{
	PrintWriter pw=response.getWriter();
	pw.write("No Student Found");
	RequestDispatcher rd=request.getRequestDispatcher("UpdateS.html");
	rd.include(request, response);
}	
%>
<form action="updateS" method="post">
		id: <input type="number" value="<%=t.getId()%>" name="id"><br>
		name: <input type="text" value="<%=t.getName()%>" name="name"><br>
		Stream: <input type="text" value="<%=t.getStream()%>" name="stream"><br>
		Fees: <input type="number" value="<%=t.getFees()%>"name="fees"><br>
		<input type="submit" value="UPDATE">
	</form>

</body>
</html>