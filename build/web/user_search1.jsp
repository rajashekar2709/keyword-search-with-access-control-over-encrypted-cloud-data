<%@page import="java.sql.*"%>
<%@page import="keywordsearch.Dbconnection"%>
<%@ page session="true" %>


<%
    
    String department=session.getAttribute("department").toString();
    String profession=session.getAttribute("profession").toString();
    
    String uid=session.getAttribute("username").toString();
    String filename = request.getParameter("filename");
    String owner = request.getParameter("owner");
    String keyword = request.getParameter("keyword");
   
    
    int hashkeyword=keyword.hashCode();
 
    
    try{
       
       Connection con=Dbconnection.getConnection();
        Statement st = con.createStatement();
    PreparedStatement ps = con.prepareStatement("insert into request values(?,?,?,?,?,?)");

   
        ps.setString(1,keyword);
        ps.setString(2,department);
        ps.setString(3,profession);
        ps.setString(4,uid);
        ps.setInt(5,hashkeyword);
        ps.setString(6,"Pending");
        ps.executeUpdate();

response.sendRedirect("user_search.jsp?msg=success");

}
catch(Exception e1)
{
out.println(e1.getMessage());
}

%>
