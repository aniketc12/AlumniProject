<%@page import="com.pass"%>
<%@include file="header.jsp" %>
<%@include file="menuBeforeLogin.jsp"%>

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
<%
 
    try{
    String otp1=request.getParameter("OTP");
    String passd = session.getAttribute("tmpPwd").toString();
    String email = session.getAttribute("email").toString();
    int check=Integer.parseInt(passd);
    pass a=new pass();
    int pwd=a.decrypt(check);
    int otp=Integer.parseInt(otp1);
    
   
    if(otp==pwd)
    {
        %>
<div class="container">
        <form method="post" action="lostPwd4.jsp" onsubmit="return myFunction()">
    
<div class="form-group">
    <label class="control-label" for="pwd">Password:</label><br>
      <div class="col-sm-4">          
        <input type="password" class="form-control" name="Pwd" id="pwd1" placeholder="Enter password" required>
        
      </div>
    </div>
      <br>
      <br>
      
      <div class="form-group">
          
          <label class="control-label" for="pwd">Confirm Password:</label><br>
      <div class="col-sm-4">
          <input type="password" class="form-control" name="Pwd" id="pwd2" placeholder= "Confirm password" required>
          <div id="alert" >
            
              
                <strong><span id='message'></span> </strong>
                </div> <br>
          <button class="btn btn-default" type="submit">Change Password</button>
          </div>
          
          
      </div>
</form>
</div>
    <%
        }
    else
    {
        out.println("<script type=\"text/javascript\">");
   out.println("alert('else');");
   out.println("location='lostPwd1.jsp';");
   out.println("</script>");
}
}catch(Exception ex)
{
out.println("<script type=\"text/javascript\">");
   out.println("location='lostPwd1.jsp';");
   out.println("</script>");


}
    %>
    
      