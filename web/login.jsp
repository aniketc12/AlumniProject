<%@include file="header.jsp" %>
<%@include file="menuBeforeLogin.jsp"%>

<%@include file="getConnection.jsp"%>
<%@page import="java.sql.ResultSet"%>
<%
//boolean cook = false;
//String username=null;
//         Cookie cookie = null;
//         Cookie[] cookies = null;
//         
//         // Get an array of Cookies associated with the this domain
//         cookies = request.getCookies();
//         
//         
//         if( cookies != null ) {
//            
//            for (int i = 0; i < cookies.length; i++) {
//               cookie = cookies[i];
//               if(cookie.getName().toString().equals("email")){
//                  username =cookie.getValue().toString();
//                   cook=true;
//            }}
//         }System.out.println("Username dashboard: "+username);
//         if(username.equals("null"))
//         {}else{
//             String check="select * from login where username='"+username+"'";
//             Statement stt=con.createStatement();
//             ResultSet results=stt.executeQuery(check);
//             System.out.println("before");
//             while(results.next())
//             {
//                             System.out.println("after");
//                 if(results.getString(5).equals("1")){
//                 System.out.println("1");
//                 session.setAttribute("username", results.getString(1).toString());
//                 System.out.println("2");
//                 session.setAttribute("type", results.getString(4).toString());
//                 System.out.println("3");
//                 session.setAttribute("name", results.getString(3).toString());
//                 System.out.println("4");}
//             }
//         }
//         if(session.getAttribute("username") !=null)
//         {
//             out.println("<script type=\"text/javascript\">");
//   out.println("location='dashboard.jsp';");
//   out.println("</script>");
//
//         }
//         

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
          <label><input type="checkbox" name="remember" value="true" checked> Remember me</label>
        </div>
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-4">
          <button type="submit" class="btn btn-default">Submit</button><br><br>
        <a href="lostPwd1.jsp">Forgot your Password?</a><br>
      </div>
    </div>
  
  </form>
         
                <br>
    </div>
</div>


<%@include file="footer.jsp"%> 