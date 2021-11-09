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
        <script>alert('File Uploaded Successfully');</script>
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
            <li class="m1"><a href="ownerhome.jsp">Home</a></li>
            <li class="m2"><a href="owner_upload.jsp" class="active">File Upload</a></li>
            <li class="m3"><a href="owner_files.jsp">View Files</a></li>
            <li class="m5"><a href="index.html">Logout</a></li>
          </ul>
        </div>
          <center>
        <div class="row-2"><br><img src="images/arc1.jpg" alt="" height="270" width="850"/>
       
        </div>
      </div>
     <br><br><br><br><br>
       <form name="myform" action="Upload" method="post" enctype="multipart/form-data">
    <center>
<table align="center">
    
    <br>
    <center><p><font size="6" color="#00b1cf">&nbsp;&nbsp;&nbsp;&nbsp;Upload File</font></p></center>
   
        <tr>
              <td>
                   <tr>
            
                  <tr>
              <td>
                  
               <td><strong><font size="3" color="black">File Name:</font></strong></td>
        
                <td><input type="text" name="filename" id="filename" placeholder="File Name" required style="height:30px; width:200px" required=""> </input></td>
            
              </td>
        </tr>
        
       
           <tr>
              <td>
                <td><strong><font size="3" color="black">Search keyword: </font></strong></td>
               <td><input type="text" name="description" id="Description" placeholder= "Search keyword" style="height:30px; width:200px" required=""></input></td> 
              </td>
        </tr> 
            
         
             
      <tr>
      <td>
      <td><strong><font size="3" color="black">Department: </font></strong></td> 
      <td><select id="loc" name="department" required style="height:34px; width:205px" required="">
      <option value="na" selected="" >Select Department:</option>
      <option value="Accident and Emergency" >Accident and Emergency</option>
      <option value="cardiology">Cardiology</option>
      <option value="Diagnostic Imaging">Diagnostic Imaging</option>
      <option value="General Services">General Services</option>
      <option value="Otolaryngology">Otolaryngology</option>
     </select></td>
     </td>
     </tr>
                       
        <tr>
      <td>
      <td><strong><font size="3" color="black">Profession: </font></strong></td> 
      <td><select id="loc" name="profession" required style="height:34px; width:205px" required="">
      <option value="na" selected="" >Select Profession:</option>
      <option value="Physician" >Physician</option>
      <option value="Pharmacist">Pharmacist</option>
      <option value="Dietitian">Dietitian</option>
      <option value="Radiographer">Radiographer</option>
      <option value="Psychiatrist">Psychiatrist</option>
     </select></td>
     </td>
     </tr> 
              
         
       <tr>
              <td>
                <td><strong><font size="3" color="black">File: </font></strong></td>
               <td><input type="file" name="file" id="file"  style="height:30px; width:200px" required=""></input></td> 
              </td>
        </tr>                  
                       
                       
            <tr>
             <td>
                <br><br><br>    
               <td><input type="submit" value="Upload" style="height:30px; width:70px" />
              </td>
          </tr>
                            
           <form> 
           </table>
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
