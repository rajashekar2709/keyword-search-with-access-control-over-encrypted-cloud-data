<%@page import="java.sql.*"%>
<%@page import="keywordsearch.Dbconnection"%>
<%@ page session="true" %>


<%
    String uid=session.getAttribute("username").toString();
    String filename = request.getParameter("filename");
    String owner = request.getParameter("owner");
    String keyword = request.getParameter("keyword");
    String department = request.getParameter("department");
    String profession = request.getParameter("profession");

 
    
    try{
       
       Connection con=Dbconnection.getConnection();
        Statement st = con.createStatement();
    PreparedStatement ps = con.prepareStatement("insert into request values(?,?,?,?,?,?,?)");

        ps.setString(1,filename);    
        ps.setString(2,owner);
        ps.setString(3,keyword);
        ps.setString(4,department);
        ps.setString(5,profession);
        ps.setString(6,uid);
        ps.setString(7,"Pending");
        ps.executeUpdate();

response.sendRedirect("user_search1.jsp?message=success");

}
catch(Exception e1)
{
out.println(e1.getMessage());
}

%>
