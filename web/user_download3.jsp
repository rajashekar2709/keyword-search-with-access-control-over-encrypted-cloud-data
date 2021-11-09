<%@page import="keywordsearch.Dbconnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    String filename = request.getParameter("filename");
    String skey = request.getParameter("skey");
    String owner = request.getParameter("owner");
    try {
            
       con = Dbconnection.getConnection();
       st = con.createStatement();
       rs = st.executeQuery("select * from upload where filename='"+filename+"' and skey='"+skey+"'"); 
       
        
        if (rs.next()) {
         response.sendRedirect("download?" +filename+ "," + owner+ "," + skey);
            
        } 
         else {
            response.sendRedirect("user_download.jsp?msg=Failed");
        }
    } catch (Exception ex) {
        response.sendRedirect("user_download.jsp?msg1=Failed");
        ex.printStackTrace();
    }

%>