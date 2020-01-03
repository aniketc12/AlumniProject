
<%@page import="java.sql.ResultSet"%>
<%@include file="header.jsp"%>
<%@include file="menuAfterLogin.jsp"%>
<%@include file="getConnection.jsp"%>
<%try{
    boolean cook = false;
String username=null;
         Cookie cookie = null;
         Cookie[] cookies = null;
         
         // Get an array of Cookies associated with the this domain
         cookies = request.getCookies();
         
         
         if( cookies != null ) {
            
            for (int i = 0; i < cookies.length; i++) {
               cookie = cookies[i];
               if(cookie.getName().toString().equals("email")){
                  username =cookie.getValue().toString();
                   cook=true;
            }}
         }System.out.println("Username dashboard: "+username);
         if(username.equals("null"))
         {}else{
             String check="select * from login where username='"+username+"'";
             Statement stt=con.createStatement();
             ResultSet results=stt.executeQuery(check);
             System.out.println("before");
             while(results.next())
             {
                             System.out.println("after");
                 if(results.getString(5).equals("1")){
                 System.out.println("1");
                 session.setAttribute("username", results.getString(1).toString());
                 System.out.println("2");
                 session.setAttribute("type", results.getString(4).toString());
                 System.out.println("3");
                 session.setAttribute("name", results.getString(3).toString());
                 System.out.println("4");}
             }
         }
         
    if(session.getAttribute("name") !=null)
    {
String type=request.getParameter("type");
String email=request.getParameter("to");
System.out.println(email);

    if(type.equals("student"))
    {

 String sql="select * from student where email='"+email+"'";
    ResultSet rs=st.executeQuery(sql);
    while(rs.next())
    {
    %>
<script>
    document.getElementById("sMember").classList.add('active');

document.getElementById("home").classList.remove('active');
</script>
    <center>
        <div class="container">
            <br><br><br>
            <img  src="img/<%=rs.getString(6) %>" alt="image" height="200" /><br>
            <strong>Name: </strong><%=rs.getString(3) %>  <%=rs.getString(12) %> <br>
            <strong>Roll No: </strong> <%=rs.getString(2) %>  <br>
            <strong>Email: </strong> <%=rs.getString(4) %>  <br>
            <strong>House: </strong>  <%=rs.getString(5) %> <br>
        </div>
    </center>

<%
    }
}
else
{
String sql="select * from alumni where email='"+email+"'";
    ResultSet rs=st.executeQuery(sql);
    while(rs.next())
    {
    
%>
<script>
    document.getElementById("aMember").classList.add('active');

document.getElementById("home").classList.remove('active');
</script>
<br><br> 
    
<center>
    
            
            <div class="container">
                
                
             
                 
             <img  src="img/<%=rs.getString(7) %>" alt="image" width="300" />
            <br>
            <strong>Name:</strong><%=rs.getString(2) %> <%=rs.getString(15) %><br>
            <strong>Email: </strong><%=rs.getString(3) %>
            
            
            
             
            <br>
            <br>
            
            
                    
            
            
        
                
                <div class="form-group">
            <strong>I am attending / attended (College):</strong>
            
                <%=rs.getString(5)%>
                
                <form action="mapView.jsp" method="post">
                    <input type="hidden" name="address" value="<%=rs.getString(5)%>">
                    <button type="submit" class="btn btn-default">View on map</button>
                </form>
                
                </div>
                
               
                
                
                
                <div class="form-group">
            <strong>Field of Job(if any):</strong>
            
                <%=rs.getString(6)%>
            
            
                </div>
                
                <div class="form-group">
            <strong>Course Studied/studying:</strong><br>
            
            <%=rs.getString(16)%><br>
                </div>
            
            <div class="form-group">
            <strong>I currently live in:</strong>
            
                <%=rs.getString(13)%>
                
            <form action="mapView.jsp" method="post">
                    <input type="hidden" name="address" value="<%=rs.getString(5)%>">
                    <button type="submit" class="btn btn-default">View on map</button>
                </form>
                </div>
            
            <div class="form-group">
            <strong>A little bit about me:</strong>
            
            <%=rs.getString(6)%>
            
            
            
            </div><br>
            
            
            
            </div>
            
           
            
            
            
            
        
        
</center>

<%
}

}
}


    else
    {
        out.println("<script type=\"text/javascript\">");
   
   out.println("location='login.jsp';");
   out.println("</script>");

    }
}catch (Exception ex)
{
out.println("<script type=\"text/javascript\">");
   out.println("location='dashboard.jsp';");
   out.println("</script>");

}

%>
<%@include file="footer.jsp"%>