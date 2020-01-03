  

<% 
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
    {%>
<%@include file="menuAfterLogin.jsp"%>
<%@include file="footer.jsp"%>

<%} else{%>
<%@include file="menuBeforeLogin.jsp"%>
<center><h3>Upcoming Events:</h3>
    <br>
    <h5>Event 1</h5>
    <br>
    <h5>Event 2</h5>
    <br>
    <h5>Event 3</h5>
    <br>
    <h5>Event </h5>
</center>
<%@include file="footer.jsp"%>

<%}%>