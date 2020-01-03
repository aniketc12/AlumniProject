
<%@include file="header.jsp"%>
<%@include file="menuBeforeLogin.jsp"%>

<%@page import="java.sql.ResultSet"%>
<%@include file="getConnection.jsp" %>
<%
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
    <div class="container">
        
    

  <br>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">

      <div class="item active">
       <a href="about.jsp"> <img src="img/car1.JPG" alt="pic" height="340">
        <div class="carousel-caption">
             <h3>Upcoming Events of the month</h3>
        </div></a>
      </div>

    
      <div class="item">
        <img src="img/car3.jpg" alt="pic" height="345">
        <div class="carousel-caption">
            <h3>View the School annual yearbook</h3>
        </div>
      </div>

      <div class="item">
        <img src="img/car4.jpg" alt="Flower" height="345">
        <div class="carousel-caption">
          <h3>View the Monthly Newsletter</h3>
        </div>
      </div>
  
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
    </div>
    <br>
    <div class="container">
    <div class="jumbotron">
    
       <bold><center> <h2>Welcome</h2></center></bold>
    </div>
    </div>
    
    <%
    
    }
else
{
out.println("<script type=\"text/javascript\">");
     out.println("location='dashboard.jsp';");
   out.println("</script>");
}

    }catch(Exception ex)
{
out.println("<script type=\"text/javascript\">");
     out.println("location='login.jsp';");
   out.println("</script>");


}%>
    

 <%@include file="footer.jsp"%>   
