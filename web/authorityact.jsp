<%@page import="java.sql.*"%>
<%@page import="keywordsearch.Dbconnection"%>
<%@ page session="true" %>
        <%
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        try{

       
        Connection con=Dbconnection.getConnection();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select * from authority where username= '"+username+"' and password='"+password+"'");
        if(rs.next())
        {
      String user = rs.getString(2);
        session.setAttribute("username",username);
        response.sendRedirect("authorityhome.jsp?msg=success");
        }
        else 
        {
        response.sendRedirect("authority.jsp?msg1=LoginFail");
        }
        }
        catch(Exception e)
        {
        System.out.println("Error in owner"+e.getMessage());
        }
        %>