<%@page import="keywordsearch.Mail"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.*"%>
<%@page import="keywordsearch.Dbconnection"%>
<%@ page session="true" %>


<%
   
     Random r= new Random();
     int i=r.nextInt(10000 - 5000) + 5000;
      String secretkey = i+"";
    String email = request.getParameter("email");
    String username = request.getParameter("username");
   
    try{
       
    Connection con=Dbconnection.getConnection();
    Statement st = con.createStatement();
    PreparedStatement ps = con.prepareStatement("update user set status='Activated',secretkey='"+secretkey+"' where email='"+email+"'");
    ps.executeUpdate();
    Mail m = new Mail();
          String msg ="User Name:"+username+"\nEmail :"+email+"\nSecret key :"+secretkey;
          m.secretMail(msg,email,email);
    response.sendRedirect("authority_user.jsp?msg=success");

}
catch(Exception e1)
{
out.println(e1.getMessage());
}

%>
