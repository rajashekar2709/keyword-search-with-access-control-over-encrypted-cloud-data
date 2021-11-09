<%@page import="java.sql.PreparedStatement"%>
<%@page import="keywordsearch.Dbconnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

        <%
            String keyword = request.getParameter("keyword");
            String department = request.getParameter("department");
            String profession = request.getParameter("profession");
            String uid = request.getParameter("uid");
            int hashkeyword=Integer.parseInt(request.getParameter("hashkeyword"));
            
            
        try {
            Connection con;
            Statement st;
            ResultSet rs;
            con = Dbconnection.getConnection();
            st = con.createStatement();
            rs = st.executeQuery("select * from upload where department='"+department+"'");
             
         if(rs.next()){
    PreparedStatement ps = con.prepareStatement("update request set status='Department Verified' where uid='"+uid+"' and hashkeyword="+hashkeyword+" and keyword='"+keyword+"'");
    ps.executeUpdate(); 
    response.sendRedirect("cloud_requests2.jsp?"+ keyword + "," + department+ "," + profession+ "," + uid+ "," + hashkeyword);
    
         }
         
          else
        {
           
       PreparedStatement psa = con.prepareStatement("update request set status='Department Verification Failed' where uid='"+uid+"' and hashkeyword="+hashkeyword+" and keyword='"+keyword+"'");
       psa.executeUpdate();
       response.sendRedirect("cloud_requests.jsp?msg1=failed");
        }   
            
            
            %>
     
            
                           
            <%
              }catch(Exception e)
	{
		System.out.println(e);
	}
	%>
     