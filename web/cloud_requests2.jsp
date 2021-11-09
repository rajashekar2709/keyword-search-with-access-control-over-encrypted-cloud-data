<%@page import="keywordsearch.Dbconnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>Keyword Search with Access Control</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script src="js/cufon-yui.js" type="text/javascript"></script>
<script src="js/cufon-replace.js" type="text/javascript"></script>
<script src="js/Myriad_Pro_300.font.js" type="text/javascript"></script>

</head>
<body id="page1">
<div class="tail-top">
  <div class="tail-bottom">
    <div class="body-bg">
      <!-- HEADER -->
      <div id="header">
        
        <div class="row-1">
          <div class="fleft"><h1><font color="#00b1cf">Keyword Search with Access Control over
                      Encrypted Cloud Data</font></h1></div>
         
        </div>
        <div class="row-2">
         <ul>
            <li class="m1"><a href="cloudhome.jsp" class="active">Home</a></li>
            <li class="m2"><a href="cloud_user.jsp">View Users</a></li>
            <li class="m3"><a href="cloud_owner.jsp">View Owners</a></li>
            <li class="m3"><a href="cloud_files.jsp">Cloud Files</a></li>
            <li class="m4"><a href="cloud_requests.jsp">View Requests</a></li>
            <li class="m5"><a href="index.html">Logout</a></li>
         </ul>
        </div>
          <center>
        <div class="row-2"><br><img src="images/arc1.jpg" alt="" height="270" width="850"/>
       
        </div>
      </div>
     <br><br><br><br><br>
      <center>
        <%
           String[] filedetails = request.getQueryString().split(",");
            
            String keyword = filedetails[0];
            String department = filedetails[1];
            String profession = filedetails[2];
            String uid = filedetails[3];
            String hashkeyword=filedetails[4];
            
            System.out.println("nikil"+keyword+department+profession+uid+hashkeyword);
           
        try {
            Connection con;
            Statement st;
            ResultSet rs;
            con = Dbconnection.getConnection();
            st = con.createStatement();
            rs = st.executeQuery("select * from request where department='"+department+"' and profession='"+profession+"' and hash='"+hashkeyword+"'");
             
         
            
            
            
            %>
     
        <table style="width:60%;color: black" border="2" >

  <h2>User keywordsearch Matched Files</h2><br><br>
  <tr>
     
     <th><font color="#007ebf"> File Name</th>
     <th><font color="#007ebf"> Email</th>
     <th><font color="#007ebf"> Keyword</th>
     <th><font color="#007ebf"> Department</th>
     <th><font color="#007ebf"> Profession</th>
     <th><font color="#007ebf"> Hash_Code for Search Keyword</th>
     <th><font color="#007ebf"> Cipher Data</th>
     <th><font color="#007ebf"> User</th>
     <th><font color="#007ebf"> Send_File Details</th>
  
  
   
     
</tr>
    <%
while(rs.next()){
%>
<tr>
      <th><font color="black"><%=rs.getString(1)%></th>              
      <th><font color="black"><%=rs.getString(3)%></th>
      <th><font color="black"><%=rs.getString(4)%></th>
      <th><font color="black"><%=rs.getString(5)%></th>
      <th><font color="black"><%=rs.getString(6)%></th>
      <th><font color="black"><%=rs.getString(8)%></th>
      <th><font color="black"><textarea><%=rs.getString(2)%></textarea></th>
      <th><font color="black"><%=uid%></th>
      <td><a href="cloud_requests2.jsp?filename=<%=rs.getString(1)%>&keyword=<%=rs.getString(4)%>&owner=<%=rs.getString(3)%>&uid=<%=uid%>&hashkeyword=<%=rs.getInt("hash")%>"><font color="#007ebf">Send_File Details</a> </td>
 </tr> 
                 <br>
                
                           
            <%}
              }catch(Exception e)
	{
		System.out.println(e);
	}
	%>
             </table>
       </center>
  <br><br><br>
      </div>
      <div id="footer">
        <div class="indent">
          
          
        </div>
      </div>
    </div>
  </div>
</div>
</html>
