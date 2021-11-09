<%@page import="keywordsearch.Mail"%>
<%@page import="java.sql.*"%>
<%@page import="keywordsearch.Dbconnection"%>
<%@ page session="true" %>


<%
   
    String username = request.getParameter("username");
    String email = request.getParameter("email");
   
    try{
       
    Connection con=Dbconnection.getConnection();
    Statement st = con.createStatement();
    PreparedStatement ps = con.prepareStatement("update user set status='DeActivated' where email='"+email+"'");
    ps.executeUpdate();
    Mail m = new Mail();
          String msg ="User Name:"+username+"\nEmail :"+email+"\nMessage :"+"Your Account Deactivated by Authority";
          m.secretMail(msg,email,email);
    response.sendRedirect("authority_user.jsp?msg1=success");

}
catch(Exception e1)
{
out.println(e1.getMessage());
}

%>
