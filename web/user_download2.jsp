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
            <li class="m1"><a href="userhome.jsp">Home</a></li>
            <li class="m2"><a href="user_search.jsp">Search Files</a></li>
            <li class="m2"><a href="user_download.jsp"  class="active">Download Files</a></li>
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
            
            String filename = request.getParameter("filename");
            String keyword = request.getParameter("keyword");
            String owner = request.getParameter("owner");
           
            %>
     
         <br><br><br><br><br>
      <center>
        <p><font color="#00768e" size="5"> Secret Key Verification and File Download</font></p><br>
         <form name="myform" action="user_download3.jsp" method="post">
         <table border="0" >

            <label>File Name  :&nbsp;&nbsp;&nbsp;</label><input type="text" name="filename" value="<%=filename%>"  style="margin-left: 30px" class="textbox"/><br /><br />
            <label>Owner Name  :</label><input type="text" name="owner" value="<%=owner%>"  style="margin-left: 30px" class="textbox"/><br /><br />
            <tr><td><font color="black"> Enter Secret key&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><input type="text" name="skey" required="" /></td></tr>
                                             
             
        
         <tr rowspan="2" align="center"><td><br><input type="submit" name="submit" value="Download" /></td></tr>
        
         <tr></tr>      
         </table>
         </form>
       </center>
      </div>
      <div id="footer">
        <div class="indent">
          
          
        </div>
      </div>
    </div>
  </div>
</div>
</html>
