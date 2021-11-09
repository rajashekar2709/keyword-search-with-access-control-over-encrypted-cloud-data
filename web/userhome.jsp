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
        <script>alert('login success');</script>
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
            <li class="m1"><a href="userhome.jsp" class="active">Home</a></li>
            <li class="m2"><a href="user_search.jsp">Search Files</a></li>
            <li class="m2"><a href="user_download.jsp">Download Files</a></li>
            <li class="m5"><a href="index.html">Logout</a></li>
          
          </ul>
        </div>
          <center>
        <div class="row-2"><br><img src="images/arc1.jpg" alt="" height="270" width="850"/>
       
        </div>
      </div>
      <!-- CONTENT -->
      <div class="tail-right">
          <div class="wrapper">
            <div class="col-1">
              <div class="indent">
                <div class="indent1">
                    
             <%
            HttpSession ses=request.getSession(true);
            String uid=ses.getAttribute("username").toString();
           
            %> 
            
            <br><br><br>
                    <center>
                  <h4>welcome <%=uid%></h4>
               
           </div>
               
              </div>
            </div>
            
          </div>
        </div>
      </div>
      <div id="footer">
        <div class="indent">
          
          
        </div>
      </div>
    </div>
  </div>
</div>
</html>
