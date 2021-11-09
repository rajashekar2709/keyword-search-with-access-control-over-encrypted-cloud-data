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
     <%
            if (request.getParameter("msg") != null) {%>
        <script>alert('Owner Registration Done!');</script>
        <%}
            if (request.getParameter("msg1") != null) {%>
        <script>alert('username/password wrong');</script> 
        
        <%}
        %>

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
            <li class="m1"><a href="index.html" >Home</a></li>
            <li class="m2"><a href="owner.jsp" class="active">Owner</a></li>
            <li class="m3"><a href="authority.jsp">Authority</a></li>
            <li class="m4"><a href="cloud.jsp">Cloud Server</a></li>
            <li class="m5"><a href="user.jsp">User</a></li>
          
          </ul>
        </div>
          <center>
        <div class="row-2"><br><img src="images/arc1.jpg" alt="" height="270" width="850"/>
       
        </div>
      </div>
      <br><br><br><br><br>
      <center>
<p><font color="#00768e" size="5"> Owner Login</font></p><br>
         <form name="myform" action="owneract.jsp" method="post">
         <table border="0" >

         <tr><td><font color="black"> User Name</td><td><input type="text" name="username" required="" /></td></tr>
         <tr><td><font color="black">Password</td><td><input type="password" name="password" required="" /></td></tr>

         <tr rowspan="2" align="center"><td><br><input type="submit" name="submit" value="    Login    " /></td></tr>
        
         <tr></tr>      
         </table>
         </form>
         <a href="ownerreg.jsp">New User Sign UP?</a>
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
