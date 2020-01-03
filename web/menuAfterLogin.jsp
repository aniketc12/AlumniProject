
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

<style>
    .form-control {width:120px;}
.popover {max-width:400px;}
    
</style>
<%try{%>
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
      <li id="principal"><a href="message.jsp" >Principal's Message</a></li>
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
</div>
            
<div id="myForm" class="hide">
    <div class="col-sm-13" >
        
    
    
        <center><h2> <%out.println("Hello, "+session.getAttribute("name"));%></h2></center>
        ____________________________<br>
        <center><a href="profile.jsp" class="btn btn-success" role="button">Account</a></center>
    
        <br>
        <div style="background-color:lavender;">
    <form action="logout.jsp">
        <div class="col-sm-4"></div> <button type="submit" class="btn btn-link">Logout</button>
        
    </form>
        </div>
    </div>
</div>

    
</nav>
<%}
catch(Exception t)
{
out.println("<script type=\"text/javascript\">");
   out.println("location='login.jsp';");
   out.println("</script>");


}%>