<%@include file="header.jsp" %>
<%@include file="menuBeforeLogin.jsp"%>
<%@include file="getConnection.jsp"%>
<%@page import="java.sql.ResultSet"%>
<%
    System.out.println("loginWrong");

         if(session.getAttribute("username") !=null)
         {
             out.println("<script type=\"text/javascript\">");
   out.println("location='dashboard.jsp';");
   out.println("</script>");

         }
         

%>

<script>
    document.getElementById("login").classList.add('active');

document.getElementById("home").classList.remove('active');
    </script>
    
    
    <br><br><br>
    <center> <h2>Login</h2></center><br>
    <div class="col-sm-2"></div>
<div style="background-color:white" class="control-label col-sm-8">
    <div class="container">
        <br><br>
        
  <form action='loginProcess.jsp' method='post' class="form-horizontal">
    
     
    <div class="form-group">
        
      <label class="control-label col-sm-2" for="email"></label>
      
      <div class="col-sm-4">
          
        <strong> <span style="color:red ">Incorrect Username or Password (or both)</span></strong><br>
      </div>
    </div>
    
    <div class="form-group">
        
      <label class="control-label col-sm-2" for="email">Email:</label>
      
      <div class="col-sm-4">
          
        <input type="email" class="form-control" id="email" name="email" placeholder="Enter email" autofocus="autofocus">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">Password:</label>
      <div class="col-sm-4">          
        <input type="password" class="form-control" id="pwd" name="pwd" placeholder="Enter password">
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-4">
          
        <div class="checkbox">
          <label><input type="checkbox"  name="remember" value="true" checked> Remember me</label>
        </div>
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-4">
          <button type="submit" class="btn btn-default">Submit</button><br><br>
          <a href="lostPwd1.jsp">Forgot your Password?</a><br><br>
          <a href="register.jsp">Sign up here</a><br>
      </div>
    </div>
  
  </form>
         
                <br>
    </div>
</div>


<%@include file="footer.jsp"%> 