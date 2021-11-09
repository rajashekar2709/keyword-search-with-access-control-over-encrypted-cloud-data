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
            <li class="m1"><a href="ownerhome.jsp">Home</a></li>
            <li class="m2"><a href="owner_upload.jsp">File Upload</a></li>
            <li class="m3"><a href="owner_files.jsp" class="active">View Files</a></li>
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
        String owner=session.getAttribute("username").toString();
        try {
            Connection con;
            Statement st;
            ResultSet rs;
            con = Dbconnection.getConnection();
            st = con.createStatement();
            rs = st.executeQuery("select * from upload where owner='"+owner+"'");
                                                      
            %>
     
        <table style="width:60%;color: black" border="2" >

  <h2>View Cloud File Details</h2><br><br>
 <tr>
     
     <th><font color="#007ebf"> File Name</th>
     <th><font color="#007ebf"> Owner</th>
     <th><font color="#007ebf"> Search keyword</th>
     <th><font color="#007ebf"> Department</th>
     <th><font color="#007ebf"> Profession</th>
     <th><font color="#007ebf"> Data</th>
     <th><font color="#007ebf"> Download</th>
    
  
   
     
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
      <th><font color="black"><textarea><%=rs.getString(2)%></textarea></th>
     <td><a href="download1?filename=<%=rs.getString(1)%>&owner=<%=rs.getString(3)%>"><font color="#007ebf">Download</a> </td>

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
