<%@page import="java.sql.*"%>
<%@page import="keywordsearch.Dbconnection"%>
<%@ page session="true" %>


<%
   
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String email = request.getParameter("email");
    String dob = request.getParameter("dob");
    String address = request.getParameter("address");
    String cno = request.getParameter("cno");
    String department = request.getParameter("department");
    String profession = request.getParameter("profession");
   
    
    try{
       
       Connection con=Dbconnection.getConnection();
        Statement st = con.createStatement();
    PreparedStatement ps = con.prepareStatement("insert into user values(?,?,?,?,?,?,?,?,?,?)");

        ps.setString(1,username);    
        ps.setString(2,password);
        ps.setString(3,email);
        ps.setString(4,dob);
        ps.setString(5,address);
        ps.setString(6,cno);
        ps.setString(7,department);
        ps.setString(8,profession);
        ps.setString(9,"Pending");
        ps.setString(10,"Pending");
        ps.executeUpdate();

response.sendRedirect("user.jsp?msg=success");

}
catch(Exception e1)
{
out.println(e1.getMessage());
}

%>
