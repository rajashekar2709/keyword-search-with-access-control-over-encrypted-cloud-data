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
        <script>alert('Login Success');</script>
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
            <li class="m1"><a href="authorityhome.jsp" class="active">Home</a></li>
            <li class="m2"><a href="authority_user.jsp">View Users</a></li>
            <li class="m2"><a href="authority_owner.jsp">View Owners</a></li>
            <li class="m2"><a href="authority_files.jsp">View Cloud Files</a></li>
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
                    <center>
                  <h3>Abstract</h3>
                <p>we study the problem of keyword
search with access control over encrypted data in cloud computing.
We first propose a scalable framework where user can use
his attribute values and a search query to locally derive a search
capability, and a file can be retrieved only when its keywords
match the query and the user?s attribute values can pass the
policy check. Using this framework, we propose a novel scheme
called KSAC, which enables Keyword Search with Access Control
over encrypted data. KSAC utilizes a recent cryptographic
primitive called HPE to enforce fine-grained access control and
perform multi-field query search. Meanwhile, it also supports the
search capability deviation, and achieves efficient access policy
update as well as keyword update without compromising data
privacy. To enhance the privacy, KSAC also plants noises in the
query to hide users? access privileges. Intensive evaluations on
real-world dataset are conducted to validate the applicability of
the proposed scheme and demonstrate its protection for user?s
access privilege.</p>
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
