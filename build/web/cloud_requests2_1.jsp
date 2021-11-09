<%@page import="keywordsearch.Mail"%>
<%@page import="java.sql.*"%>
<%@page import="keywordsearch.Dbconnection"%>
<%@ page session="true" %>


<%
   
    String filename = request.getParameter("filename");
    String keyword = request.getParameter("keyword");
    String owner = request.getParameter("owner");
    String uid = request.getParameter("uid");
    String department = request.getParameter("department");
    String profession = request.getParameter("profession");
    int hashkeyword=Integer.parseInt(request.getParameter("hashkeyword"));
   
    try{
       
    Connection con=Dbconnection.getConnection();
    Statement st = con.createStatement();
    
    ResultSet rs = st.executeQuery("select * from upload where department='"+department+"' and profession='"+profession+"' and hash="+hashkeyword+"");
        if(rs.next())
        {
         String Secretkey=rs.getString("skey");
         
    PreparedStatement ps = con.prepareStatement("update request set status='File Verified' where uid='"+uid+"' and hashkeyword="+hashkeyword+" and keyword='"+keyword+"'");
    ps.executeUpdate();
    Mail m = new Mail();
          String msg ="User Name:"+uid+"\nFile Name :"+filename+"\nHash Keyword :"+hashkeyword+"\nSearch Keyword :"+keyword+"\nSecret Key :"+Secretkey+"\nMessage :"+"Search with File Name and Hash Code";
          m.secretMail(msg,uid,uid);
    response.sendRedirect("cloud_requests.jsp?msg=success");
        }
    
        else{
            
         response.sendRedirect("cloud_requests.jsp?msg1=failed");   
        }
    
  
}
catch(Exception e1)
{
out.println(e1.getMessage());
}

%>
