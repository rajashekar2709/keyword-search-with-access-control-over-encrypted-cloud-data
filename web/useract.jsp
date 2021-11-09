<%@page import="java.sql.*"%>
<%@page import="keywordsearch.Dbconnection"%>
<%@ page session="true" %>
        <%
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        try{

       
        Connection con=Dbconnection.getConnection();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select * from user where email= '"+username+"' and password='"+password+"'");
        if(rs.next())
        {
      String user = rs.getString(3);
      String department = rs.getString(7);
      String profession = rs.getString(8);
        session.setAttribute("username",username); 
        session.setAttribute("department",department);
         session.setAttribute("profession",profession);
        
        response.sendRedirect("user_secretkey.jsp?msg=LoginFail");
}
        else 
        {
        response.sendRedirect("user.jsp?msg1=LoginFail");
        }
        }
        catch(Exception e)
        {
        System.out.println("Error in user"+e.getMessage());
        }
        %>