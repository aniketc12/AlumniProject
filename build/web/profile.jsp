<%@page import="java.sql.ResultSet"%>
<%@include file="getConnection.jsp"%>
<%@include file="header.jsp"%>



<%try{
    
    boolean cook = false;
String username=null;
         Cookie cookie = null;
         Cookie[] cookies = null;
         
         // Get an array of Cookies associated with the this domain
         cookies = request.getCookies();
         
         
         if( cookies != null ) {
            
            for (int i = 0; i < cookies.length; i++) {
               cookie = cookies[i];
               if(cookie.getName().toString().equals("email")){
                  username =cookie.getValue().toString();
                   cook=true;
            }}
         }System.out.println("Username dashboard: "+username);
         if(username.equals("null"))
         {}else{
             String check="select * from login where username='"+username+"'";
             Statement stt=con.createStatement();
             ResultSet results=stt.executeQuery(check);
             System.out.println("before");
             while(results.next())
             {
                             System.out.println("after");
                 if(results.getString(5).equals("1")){
                 System.out.println("1");
                 session.setAttribute("username", results.getString(1).toString());
                 System.out.println("2");
                 session.setAttribute("type", results.getString(4).toString());
                 System.out.println("3");
                 session.setAttribute("name", results.getString(3).toString());
                 System.out.println("4");}
             }
         }
         
    username=session.getAttribute("username").toString();%>
<script>
    
$(function(){
    $('#login').popover({
       
        placement: 'bottom',
//        title: 'Account Details',
        html:true,
        content:  $('#myForm').html()
    }).on('click', function(){
      // had to put it within the on click action so it grabs the correct info on submit
      $('.btn-primary').click(function(){
       $('#result').after("form submitted by " + $('#email').val())
        $.post('/echo/html/',  {
            email: $('#email').val(),
            name: $('#name').val(),
            gender: $('#gender').val()
        }, function(r){
          $('#pops').popover('hide')
          $('#result').html('resonse from server could be here' );
        });
      });
  });
});

</script>
<nav class="navbar navbar-inverse">
    <button type="button" data-target="#navbarCollapse" data-toggle="collapse" class="navbar-toggle">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
    <a href="http://www.saralabirlaacademy.org" class="navbar-brand"><img  src="img/homelogo.png" width="15"></a>
  <div id="navbarCollapse" class="collapse navbar-collapse">
      
    
    <ul class="nav navbar-nav">
      <li id="home" class="active"><a href="dashboard.jsp">Home</a></li>
      <li id="about"><a href="about.jsp">About Us </a>

      </li>
      <li><a href="message.jsp">Principal's Message</a></li>
      <li><a target="_blank" href="http://saralabirlaacademy.org/downloads/event_calendar.pdf">Event Calender</a></li>
    </ul>
      <ul class="nav navbar-nav navbar-center">
      <li id="sMember"><a href="studentMembers.jsp">Student Members</a></li>   
      <li id="aMember"><a href="alumniMembers.jsp">Alumni Members</a></li>
          
      </ul>
    <ul class="nav navbar-nav navbar-right">
        
        <li>
            <div >
    <span  id="login" class="btn"><a href="#">
                <img src="img/user.png" height="30"></a></span>
            </div></nav>
<div id="myForm" class="hide">
    <div class="col-sm-13" >
        
    
    
        <center><h2> <%out.println("Hello, "+session.getAttribute("name"));%></h2></center>
        ____________________________
        <center><a href="profile.jsp" class="btn btn-success" role="button">Account</a></center>
        <br>
        <div style="background-color:lavender;">
    <form action="logout.jsp">
        <div class="col-sm-4"></div> <button type="submit" class="btn btn-link">Logout</button>
        
    </form>
        </div>
    </div>
</div>
<script>
    
    document.getElementById("home").classList.remove('active');
    
</script>
<%
    
    if(!username.equals(null)){
    try{
String type=session.getAttribute("type").toString();


if(type.equals("student"))
{
  String sql="select * from student where email='"+username+"'";
  ResultSet rs=st.executeQuery(sql);
  if(rs.next())
  {

%>
 
           
<br><br> 
    
<center>
    
            
            <center>
                <form action="editProfile.jsp" method="post">
             
                 
             <img  src="img/<%=rs.getString(6) %>" alt="image" height="250" />
            <br>
            <strong><%=rs.getString(3) %> <%=rs.getString(12) %> </strong>
            <br>
            <strong><%=rs.getString(2) %> </strong>
            
            <br>
            
            <strong><input type="hidden" name="email" value="<%=rs.getString(4) %>"><%=rs.getString(4) %> </strong>
            <input type="hidden" name="name" value="<%=rs.getString(3) %>">
            <input type="hidden" name="lname" value="<%=rs.getString(12) %>">
            <input type="hidden" name="rollNo" value="<%=rs.getString(2) %>">
            <input type="hidden" name="img" value="<%=rs.getString(6) %>">
               
            <br>
            <br>
            <button  class="btn btn-info" role="button" type="submit" >Edit Profile</button>
            
            
            <br>
                </form>
            
            
            <form method="post" action="changePassword.jsp" class="form-horizontal">
                
                
                <button type="submit" class="btn btn-default">Change Password</button>
            
            </form>
            <form method="post" action="upload.jsp" class="form-horizontal">
                
                <center> <button type="submit" class="btn btn-info">Edit profile picture</button></center>
        </form>
            
            <form method="post" action="changeAlumni.jsp" class="form-horizontal">
                
                <center> <button type="submit" class="btn btn-info">Request to be alumni</button></center>
        </form>
       
                 
        </center>


           
           
       
    
    
<%}
else
{
out.println("<script type=\"text/javascript\">");
   out.println("alert('An error occured. Please login again');");
   out.println("location='login.jsp';");
   out.println("</script>");
}
}
else if(type.equals("alumni"))
{
 String sql="select * from alumni where email='"+username+"'";
  ResultSet rs=st.executeQuery(sql);
  if(rs.next())
  {

 %>
 <br><br> 
    
<center>
    
            
            <div class="container">
                <div class="col-sm-12">
                    
                    <div class="col-sm-4">
                <form action="editProfile.jsp" method="post">
             
                 
             <img  src="img/<%=rs.getString(7) %>" alt="image" width="250" />
            <br>
            <strong><%=rs.getString(2) %> <%=rs.getString(15) %></strong><br>
            <strong><%=rs.getString(3) %> </strong>
            
            
            
            
            <input type="hidden" name="name" value="<%=rs.getString(2) %>">
            
            <input type="hidden" name="img" value="<%=rs.getString(7) %>">
            <input type="hidden" name="lname" value="<%=rs.getString(15) %>">
               
            <br>
            <br>
            
            <button  class="btn btn-info" role="button" type="submit" >Edit Profile</button>
            
            
            <br>
                </form>
                    
            
            <form method="post" action="changePassword.jsp" class="form-horizontal">
                
            
                
                <button type="submit" class="btn btn-default">Change Password</button>
            
            </form>
            <form method="post" action="upload.jsp" class="form-horizontal">
       
            
                <button type="submit" class="btn btn-info">Edit profile picture</button>
       

                 </form>
        </div>
            <div class="col-sm-8">
                 <form method="post" action="editDescription.jsp">
                <div class="form-group">
            <label  for="name" class="control-label col-sm-4">I am attending / attended (College):</label>
            <div class="col-sm-8">
                <div align="left" style="background-color: white; border-radius: 3px"><%=rs.getString(5)%>
                    <input type="hidden" value="<%=rs.getString(5)%>" name="college">
                <br>
                <a href="mapCollege.jsp">Change on map</a>
                </div>
                    
            
                </div>
                </div>
                
                <br><br><br>
                
                <div class="form-group">
            <label  for="name" class="control-label col-sm-4">I currently live in:</label>
            <div class="col-sm-8">
                <div align="left" style="background-color: white; border-radius: 3px"> <%=rs.getString(13)%>
                    <input type="hidden" value="<%=rs.getString(13)%>" name="live">
                <br>
                <a href="mapLive.jsp">Change on map</a>
                </div><br>
            </div>
            </div><br><br>
                
                
                
                <div class="form-group">
            <label  for="name" class="control-label col-sm-4">Field of Job(if any):</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" id="email" value="<%=rs.getString(6)%>" name="job" >
            </div>
            <br><br>
                </div>
            
            <div class="form-group">
            <label  for="name" class="control-label col-sm-4">Course studied/studying:</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" id="email" value="<%=rs.getString(16)%>" name="studied" >
            </div>
            <br><br>
                </div>
            
            
            
            <div class="form-group">
            <label  for="name" class="control-label col-sm-4">A little bit about me:</label>
            <div class="col-sm-8">
               
                <textarea class="form-control" rows="3" cols="25" id="comment" name="desc"><%=rs.getString(14)%></textarea>
            </div>
            
            
            
            <br><br><br>
            
            
            </div><br>
            
            
            <button type="submit" class="btn btn-primary">Save Changes</button>
                </form>
            </div>
            
            </div>
            </div>
            
            
            
        
        
</center>
 
 
 
 
 
 <%
     }
else
{
out.println("<script type=\"text/javascript\">");
   out.println("alert('An error occured. Please login again');");
   out.println("location='login.jsp';");
   out.println("</script>");
}

}else{
out.println("<script type=\"text/javascript\">");
   out.println("alert('Sesion Timed Out');");
   out.println("location='login.jsp';");
   out.println("</script>");}

}catch(Exception ex)
{
out.println("<script type=\"text/javascript\">");
   out.println("alert('Sesion Timed Out');");
   out.println("location='login.jsp';");
   out.println("</script>");
}
}
else
{
out.println("<script type=\"text/javascript\">");
   
   out.println("location='login.jsp';");
   out.println("</script>");
}

}catch(Exception e)
{
out.println("<script type=\"text/javascript\">");
   out.println("alert('Sesion Timed Out');");
   out.println("location='login.jsp';");
   out.println("</script>");
}
%>


<%@include file="footer.jsp"%>