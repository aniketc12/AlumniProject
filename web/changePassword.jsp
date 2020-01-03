<%@page import="java.sql.ResultSet"%>
<%@include file="header.jsp"%>
<%try{
    try{
    
         
    if(session.getAttribute("username") !=null){%>
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
      <li id="home" class="active"><a href="index.jsp">Home</a></li>
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
        
        <li id="but">
            <div >
    <span  id="login" class="btn"><a href="#">
                <img src="img/user.png" height="30"></a></span>
            </div></li></nav>
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
<%@include file="getConnection.jsp"%>
<script>
    
    document.getElementById("home").classList.remove('active');
    
</script>
<%    
    
    if(session.getAttribute("username") !=null){
    String type = session.getAttribute("type").toString();
    
    if (type.equals("student")) {
        
        
%>
<script>
    function myFunction() {
    var pass1 = document.getElementById("pwd1").value;
    var pass2 = document.getElementById("pwd2").value;
    var ok = true;
    if (pass1 != pass2) {
        
        $('#message').html('Please ensure that the passwords are identical').css('color', 'red');
        
        ok = false;
    }
    else {
       
document.getElementById('alert').style.display = 'none';
        
    }
    return ok;
}
</script>


<br><br> 



<div class="container"> 
    
    <form method="post" action="changePasswordProcess.jsp" class="form-horizontal" onsubmit="return myFunction()">
        
        <div class="form-group">
      <label class="control-label col-sm-2" for="checkpwd">Type your current Password</label>
      <div class="col-sm-4">          
        <input type="password" class="form-control" name="checkpwd" id="checkpwd" placeholder="Enter password" required>
        
      </div>
    </div>
        
        <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">New Password:</label>
      <div class="col-sm-4">          
        <input type="password" class="form-control" name="pwd1" id="pwd1" placeholder="Enter password" required>
        
      </div>
    </div>
      
      <div class="form-group">
          
      <label class="control-label col-sm-2" for="pwd">Confirm Password:</label>
      <div class="col-sm-4">  
          <div id="alert" >
            
              
                <strong><span id='message'></span></strong>
              
      
              
          </div>
        <input type="password" class="form-control" id="pwd2" name="pwd2" placeholder="Confirm password" required>
        <br>
        <button type="submit" class="btn btn-primary">Submit</button>
        </div>
      </div>
    </form>
        

        </div>














<%
} else if(type.equals("alumni")) {
%>
<script>
    function myFunction() {
    var pass1 = document.getElementById("pwd1").value;
    var pass2 = document.getElementById("pwd2").value;
    var ok = true;
    if (pass1 != pass2) {
        
        $('#message').html('Please ensure that the passwords are identical').css('color', 'red');
        
        ok = false;
    }
    else {
       
document.getElementById('alert').style.display = 'none';
        
    }
    return ok;
}
</script>


<br><br> 



<div class="container"> 
    
    <form method="post" action="changePasswordProcess.jsp" class="form-horizontal" onsubmit="return myFunction()">
        
        <div class="form-group">
      <label class="control-label col-sm-2" for="checkpwd">Type your current Password</label>
      <div class="col-sm-4">          
        <input type="password" class="form-control" name="checkpwd" id="checkpwd" placeholder="Enter password" required>
        
      </div>
    </div>
        
        <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">New Password:</label>
      <div class="col-sm-4">          
        <input type="password" class="form-control" name="pwd1" id="pwd1" placeholder="Enter password" required>
        
      </div>
    </div>
      
      <div class="form-group">
          
      <label class="control-label col-sm-2" for="pwd">Confirm Password:</label>
      <div class="col-sm-4">  
          <div id="alert" >
            
              
                <strong><span id='message'></span></strong>
              
      
              
          </div>
        <input type="password" class="form-control" id="pwd2" name="pwd2" placeholder="Confirm password" required>
        <br>
        <button type="submit" class="btn btn-primary">Submit</button>
        </div>
      </div>
    </form>
        

        </div>





<%
    }
}

else
{
out.println("<script type=\"text/javascript\">");
   
   out.println("location='login.jsp';");
   out.println("</script>");
}}
}catch(Exception ex)
{
out.println("<script type=\"text/javascript\">");
   
   out.println("location='login.jsp';");
   out.println("</script>");
ex.printStackTrace();
}}catch(Exception e)
{

}
%>


<%@include file="footer.jsp"%>
