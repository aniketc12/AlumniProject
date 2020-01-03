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
    {
    %>
<script>
    document.getElementById("signUp").classList.add('active');

document.getElementById("home").classList.remove('active');
</script>
<div class="row">
    <center><h1>Create your Account</h1></center>
    <div class="col-sm-4">
<img class="img-responsive" src="img/signup.png" alt="Sign Up" width="460" height="345">
    </div>
    <div class="col-sm-6"  >
        <div class="container" class="control-label col-sm-4 row-sm-4" >
            <div class="col-sm-8"><center><h3>Choose one below:</h3></center></div>
        </div>
            
    
        <div class="container" class="control-label col-sm-4 row-sm-4" >
            
            <div class="col-sm-2"></div>
            <div class="col-sm-2"><a href="registerStudent.jsp" class="btn btn-info btn-lg" role="button">I am a Student</a></div>
            <div class="col-sm-2"><a href="registerAlumni.jsp" class="btn btn-info btn-lg" role="button">I am an alumni</a></div>
    
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