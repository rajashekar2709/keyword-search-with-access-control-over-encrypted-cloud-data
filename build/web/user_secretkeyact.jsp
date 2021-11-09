<%@page import="java.sql.*"%>
<%@page import="keywordsearch.Dbconnection"%>
<%@ page session="true" %>
        <%
        String secretkey = request.getParameter("secretkey");
       
        try{

       
        Connection con=Dbconnection.getConnection();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select * from user where secretkey= '"+secretkey+"'");
        if(rs.next())
        {
        String email=rs.getString("email");
        String user = rs.getString(3);
        session.setAttribute("email",email);
        response.sendRedirect("userhome.jsp?msg=LoginFail");
        }
        else 
        {
        response.sendRedirect("user_secretkey.jsp?msg1=LoginFail");
        }
        }
        catch(Exception e)
        {
        System.out.println("Error in user"+e.getMessage());
        }
        %>