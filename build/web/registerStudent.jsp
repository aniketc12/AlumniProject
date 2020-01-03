<%@page import="com.pass"%>
<%@page import="java.util.Random"%>
<%@include file="header.jsp"%>
<%@include file="menuBeforeLogin.jsp"%>

<%@include file="getConnection.jsp"%>
<%@page import="java.sql.ResultSet"%>
<%System.out.println("index");
    try{
        boolean cook = false;
    boolean re=false;
String username=null;
         Cookie cookie = null;
         Cookie[] cookies = null;
         cookies = request.getCookies();
         
         
         if( cookies != null ) {
            
            for (int i = 0; i < cookies.length; i++) {
               cookie = cookies[i];
               if(cookie.getName().toString().equals("email")){
                  username =cookie.getValue().toString();
                   cook=true;
            }}
         System.out.println("Username: "+username);
         
         if(cook)
         {
             String check="select * from login where username='"+username+"'";
             Statement stt=con.createStatement();
             ResultSet results=stt.executeQuery(check);
             System.out.println("before");
             while(results.next())
             {
                             System.out.println("after");
                 if(results.getString(5).equals("1")){
                 session.setAttribute("username", results.getString(1).toString());
                 session.setAttribute("type", results.getString(4).toString());
                 session.setAttribute("name", results.getString(3).toString());
                 re=true;}
                 }
         }}
             
         
         if( !re )
    {%>


<script>
$(function() {
  $('#rollN').on('keydown', '#rollNo', function(e){-1!==$.inArray(e.keyCode,[46,8,9,27,13,110,190])||/65|67|86|88/.test(e.keyCode)&&(!0===e.ctrlKey||!0===e.metaKey)||35<=e.keyCode&&40>=e.keyCode||(e.shiftKey||48>e.keyCode||57<e.keyCode)&&(96>e.keyCode||105<e.keyCode)&&e.preventDefault()});
})

 





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
document.getElementById("signUp").classList.add('active');

document.getElementById("home").classList.remove('active');


 
               


</script>
<%
Random rand = new Random();
int n = rand.nextInt(9000) + 1782;
pass a=new pass();
int pass=a.encrypt(n);
session.setAttribute("ver",pass);


%>

<div class="row">
    <center><h1>Create your Student account</h1></center>
    <div class="col-sm-4">
<img class="img-responsive" src="img/signup.png" alt="Sign Up" width="460" height="345">
    </div>
    
    <div class="col-sm-6"  >
        
        <div class="container" class="control-label col-sm-4 row-sm-4" >
            <br><br>
  <form class="form-horizontal" method="post" action="verifyStudent.jsp" onsubmit="return myFunction()">
      
    
      
      <div class="form-group">
      <label class="control-label col-sm-2" for="name">First Name:</label>
      <div class="col-sm-4">
          <input type="text" class="form-control" name="fname" id="fname" placeholder="Enter your first Name" required autofocus="autofocus">
      </div>
    </div>
      
      <div class="form-group">
      <label class="control-label col-sm-2" for="name">Last Name:</label>
      <div class="col-sm-4">
          <input type="text" class="form-control" name="lname" id="lname" placeholder="Enter your last Name" required>
      </div>
    </div>
      
      <div class="form-group">
      <label class="control-label col-sm-2" for="rollNo">Roll No:</label>
      <div class="col-sm-2" id="rollN">
        <input type="text" class="form-control" id="rollNo" name="rollNo" placeholder="Enter Roll No" required>
      </div>
    </div>
      
      <div class="form-group row">
      <div class="control-label col-sm-2">
              <label for="house" >Select your House :</label>
      </div>
      
      <div class="col-sm-2">
      <select class="form-control" name="house">
        <option>1</option>
        <option>2</option>
        <option>3</option>
        <option>4</option>
      </select>
      </div>
      </div>
      
      <div class="form-group">
      <label class="control-label col-sm-2" for="email">Email:</label>
      <div class="col-sm-4">
          <input type="email" class="form-control" id="email" name="email" placeholder="Enter email" required>
      </div>
    </div>
      <div id="formCheckPassword">
    
          
          <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">Password:</label>
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
        
        
            
        
        
      </div>
      <div class="col-sm-3" >
          
          
</div>
          
      </div>
      
    
      
      
    
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-4">
        <button type="submit" class="btn btn-default" >Register</button>
        
      </div>
    </div>
          </div>
      
  </form>

    </div>
    </div>
</div>
      
    
    
<%@include file="footer.jsp"%>
<%}
else
{
out.println("<script type=\"text/javascript\">");
   out.println("location='dashboard.jsp';");
   out.println("</script>");
}
}
catch(Exception ex)
{
out.println("<script type=\"text/javascript\">");
   out.println("location='index.jsp';");
   out.println("</script>");

}
%>