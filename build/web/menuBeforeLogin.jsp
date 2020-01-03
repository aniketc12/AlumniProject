<%@page import="java.util.Random"%>



<nav class="navbar navbar-inverse">
    <button type="button" data-target="#navbarCollapse" data-toggle="collapse" class="navbar-toggle">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
    <a href="http://www.saralabirlaacademy.org" class="navbar-brand"><img  src="img/homelogo.png" width="15"></a>
  <div  id="navbarCollapse" class="collapse navbar-collapse">
    
    <ul class="nav navbar-nav">
      <li id="home" class="active"><a href="index.jsp">Home</a></li>
      <li id="about"><a href="about.jsp">About Us </a>

      </li>
      <li id="principal"><a href="message.jsp">Principal's Message</a></li>
      <li><a target="_blank" href="http://saralabirlaacademy.org/downloads/event_calendar.pdf">Event Calendar</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li id="signUp"><a href="register.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li id="login"   style="display: block; "><a href="#myModal" data-toggle="modal" ><span class="glyphicon glyphicon-log-in" ></span> Login</a></li>
  </ul> 

<div class="bs-example">
    <div id="myModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                   <center> <h2 class="modal-title">Login</h2></center>
                </div>
                <div class="modal-body">
                    
                </div>
                <form action='loginProcess.jsp' method='post' class="form-horizontal">
    
      
    <div class="form-group">
        <div class="col-sm-2">
        </div>
      <label class="control-label col-sm-2" for="email">Email:</label>
      <div class="col-sm-6">
        <input type="email" class="form-control" id="email" name="email" placeholder="Enter email" autofocus="autofocus">
      </div>
    </div>
    <div class="form-group">
        <div class="col-sm-2">
        </div>
      <label class="control-label col-sm-2" for="pwd">Password:</label>
      <div class="col-sm-6">          
        <input type="password" class="form-control" id="pwd" name="pwd" placeholder="Enter password">
      </div>
    </div>
    <div class="form-group"> 
        <div class="col-sm-2">
        </div>
      <div class="col-sm-offset-2 col-sm-6">
        <div class="checkbox">
          <label><input type="checkbox" name="remember" value="true" checked> Remember me</label>
        </div>
      </div>
    </div>
    <div class="form-group">
<div class="col-sm-2">
</div>
      <div class="col-sm-offset-2 col-sm-6">
        <button type="submit" class="btn btn-info">Log In</button>
      </div>
    </div>
  
  </form>
                
                <center> <a href="lostPwd1.jsp">Forgot your Password?</a></center>
                <br>
                
            </div>
            
<!--            <div class="modal-footer">
                <a href="register.jsp"><button type="button" class="btn btn-default">Or Sign up now!</button></a>
      </div>-->

        </div>
        
    </div>
</div>
    
  </div>
</nav>
