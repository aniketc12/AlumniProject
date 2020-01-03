<%@include file="header.jsp"%>
<%@page import="java.sql.ResultSet"%>
<%@include file="getConnection.jsp" %>
<% try{
    System.out.println("index");
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
                 }
                 }
         }}
             
         
         if( session.getAttribute("username")!=null )
    {
%>

<%@include file="menuAfterLogin.jsp"%>

    <script>
    document.getElementById("principal").classList.add('active');

document.getElementById("home").classList.remove('active');
</script>
<br><br>

<center><img src="img/principal.jpg" class="img-circle" alt="Cinque Terre" height="100"></center>
<p>
      
    
</p>
<%@include file="footer.jsp"%>
<%}
else
{
%>
<%@include file="menuBeforeLogin.jsp"%>
<%@include file="footer.jsp"%>

    <script>
    document.getElementById("principal").classList.add('active');

document.getElementById("home").classList.remove('active');
</script>
<br><br>

<center><img src="img/principal.jpg" class="img-circle" alt="Cinque Terre" height="100"></center>
<p>
    
    
</p><%}}
catch(Exception ex)
{
out.println("<script type=\"text/javascript\">");
   out.println("location='login.jsp';");
   out.println("</script>");

}
%>

<%@include file="footer.jsp"%>
