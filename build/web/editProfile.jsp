<%@page import="java.sql.ResultSet"%>
<%@include file="header.jsp"%>
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
         
         
    username=session.getAttribute("username").toString();
    if(!username.equals(null)){%>
<script>
    
$(function(){
    $('#login').popover({
       
        placement: 'bottom',
//        title: 'Account Details',
        html:true,
        content:  $('#myForm').html()
    }).on('click', function(){
      // had to put it within the on click action so it grabs the correct info on submit
      $('.btn-primary').click(function(){
       $('#result').after("form submitted by " + $('#email').val())
        $.post('/echo/html/',  {
            email: $('#email').val(),
            name: $('#name').val(),
            gender: $('#gender').val()
        }, function(r){
          $('#pops').popover('hide')
          $('#result').html('resonse from server could be here' );
        });
      });
  });
});

</script>
<nav class="navbar navbar-inverse">
    <button type="button" data-target="#navbarCollapse" data-toggle="collapse" class="navbar-toggle">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
    <a href="http://www.saralabirlaacademy.org" class="navbar-brand"><img  src="img/homelogo.png" width="15"></a>
  <div id="navbarCollapse" class="collapse navbar-collapse">
      
    
    <ul class="nav navbar-nav">
      <li id="home" class="active"><a href="index.jsp">Home</a></li>
      <li id="about"><a href="about.jsp">About Us </a>

      </li>
      <li><a href="message.jsp">Pricipal's Message</a></li>
      <li><a target="_blank" href="http://saralabirlaacademy.org/downloads/event_calendar.pdf">Event Calender</a></li>
    </ul>
      <ul class="nav navbar-nav navbar-center">
      <li id="sMember"><a href="studentMembers.jsp">Student Members</a></li>   
      <li id="aMember"><a href="alumniMembers.jsp">Alumni Members</a></li>
          
      </ul>
    <ul class="nav navbar-nav navbar-right">
        
        <li>
            <div >
    <span  id="login" class="btn"><a href="#">
                <img src="img/user.png" height="30"></a></span>
            </div></nav>
<div id="myForm" class="hide">
    <div class="col-sm-13" >
        
    
    
        <center><h2> <%out.println("Hello, "+session.getAttribute("name"));%></h2></center>
        ____________________________
         <center><a href="profile.jsp" class="btn btn-success" role="button">Account</a></center>
        <br>
        <div style="background-color:lavender;">
    <form action="logout.jsp">
        <div class="col-sm-4"></div> <button type="submit" class="btn btn-link">Logout</button>
        
    </form>
        </div>
    </div>
</div>
<script>
    
    document.getElementById("home").classList.remove('active');
    
</script>
<%    
    
    String type = session.getAttribute("type").toString();
    
    if (type.equals("student")) {
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String rollNo = request.getParameter("rollNo");
        String img=request.getParameter("img");
        String lname=request.getParameter("lname");

%>


<br><br> 



<div class="container"> 
    
    <form method="post" action="upload.jsp" class="form-horizontal">
        <div class="form-group">
            <center><img  src="img/<%=img%>" alt="image" height="250" /><br><br>
                <button type="submit" class="btn btn-info">Edit profile picture</button></center>
        </form>
</div>
    <form action="editProcess.jsp" method="post" class="form-horizontal">
        



        <br>
        <div class="form-group">
            <label  for="name" class="control-label col-sm-2">First Name:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="email" value="<%=name%>" name="name" >
            </div>
        </div>

        <div class="form-group">
            <label  for="name" class="control-label col-sm-2">Last Name:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="email" value="<%=lname%>" name="lname" >
            </div>
        </div>

        <div class="form-group">
            <label  for="name" class="control-label col-sm-2">RollNo:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="email" value="<%=rollNo%>" name="rollNo">
            </div>
        </div>

        
        <div class="form-group">        
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-info">Save Changes</button>
            </div>
        </div>




    </form>
            

</div>
<%
} else if (type.equals("alumni")) {

String email = request.getParameter("email");
        String name = request.getParameter("name");
String lname=request.getParameter("lname");
String img=request.getParameter("img");

%>
<br><br> 



<div class="container"> 
    
    <form method="post" action="upload.jsp" class="form-horizontal">
        <div class="form-group">
            <center><img  src="img/<%=img%>" alt="image" height="250" /><br><br>
                <button type="submit" class="btn btn-info">Edit profile picture</button></center>
       
</div>
                 </form>
    <form action="editProcess.jsp" method="post" class="form-horizontal">
        



        <br>
        <div class="form-group">
            <label  for="name" class="control-label col-sm-2">Name:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="email" value="<%=name%>" name="name" >
            </div>
        </div>

        <div class="form-group">
            <label  for="name" class="control-label col-sm-2">Name:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="email" value="<%=lname%>" name="lname" >
            </div>
        </div>

        

        
        <div class="form-group">        
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-info">Save Changes</button>
            </div>
        </div>




    </form>
            

</div>





<%
    }
else
{
out.println("<script type=\"text/javascript\">");
   out.println("alert('Sesion Timed Out');");
   out.println("location='login.jsp';");
   out.println("</script>");
}
}
else
{
out.println("<script type=\"text/javascript\">");
   
   out.println("location='login.jsp';");
   out.println("</script>");
}
}catch(Exception ex)
{out.println("<script type=\"text/javascript\">");
   
   out.println("location='login.jsp';");
   out.println("</script>");

}
%>


<%@include file="footer.jsp"%>
