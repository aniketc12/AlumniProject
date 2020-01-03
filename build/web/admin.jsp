<%
if(session.getAttribute("admin")==null){
%>
<%@include file="header.jsp" %>
<%@include file="menuBeforeLogin.jsp"%>
<div class="col-sm-2"></div>
<div style="background-color:white; border-radius: 5px" class="control-label col-sm-8 " >
    <div class="container">
        <br><br>
        
  <form action='adminLogin.jsp' method='post' class="form-horizontal">
    
      <div class="col-sm-8" align="right">
          
          <center> <h2>Login</h2></center><br><br>
      </div>
      <br><br><br><br><br><br>
    <div class="form-group">
        
        
      <label class="control-label col-sm-2" for="email">Username:</label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="email" name="username" placeholder="Enter email" autofocus="autofocus">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">Password:</label>
      <div class="col-sm-4">          
        <input type="password" class="form-control" id="pwd" name="password" placeholder="Enter password">
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-4">
          <button type="submit" class="btn btn-default">Submit</button><br><br>
      </div>
    </div>
     
  
  </form>
    </div></div>
</body>
</html>
}
<%}
else
{
        out.println("<script type=\"text/javascript\">");
   out.println("location='adminDashboard.jsp';");
   out.println("</script>");

        }
%>