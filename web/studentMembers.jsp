<%@page import="java.sql.ResultSet"%>
<%@include file="header.jsp"%>
<%@include file="getConnection.jsp"%>

<%
    
    try{
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
         
    if(session.getAttribute("name") !=null){
    
        String sql="select * from student where del_flag=0";
        ResultSet rs=st.executeQuery(sql);
        Statement st1=con.createStatement();
        String sql1="select * from student where del_flag=0";
        ResultSet rs1=st1.executeQuery(sql1);
       %>
       
<%@include file="menuAfterLogin.jsp"%>
<script>
    document.getElementById("sMember").classList.add('active');

document.getElementById("home").classList.remove('active');
</script>
       <style> 
input[type=text] {
    width: 130px;
    box-sizing: border-box;
    border: 2px solid #ccc;
    border-radius: 4px;
    font-size: 16px;
    background-color: white;
    background-image: url('img/search.JPG');
    
    background-position: 10px 10px; 
    background-repeat: no-repeat;
    padding: 12px 20px 12px 40px;
    -webkit-transition: width 0.4s ease-in-out;
    transition: width 0.4s ease-in-out;
}

input[type=text]:focus {
    width: 100%;
    
}
</style>
       <div class="container">
           <div >
               <center><form action='searchResultsStudents.jsp' method='post' id="search">
  <input type="text" name="search" placeholder="Search ... search by name, roll.no etc">
            </form></center>
<div style="overflow-y: scroll; height: 370px; margin-top: 1px;">
    
    <div class="col-sm-12">
        
        <% %>
        <% 
            while(rs.next()){ %>
            
            
        <div class="col-sm-6">
            
            <center>
             
                 <form method="post" action="searchProfile.jsp"> 
                 <button class="btn btn-default" role="button" type="submit" style="height:250px;width:250px">
             <img  src="img/<%=rs.getString(6) %>" alt="image" height="100" />
            <br>
            <strong><%=rs.getString(3) %> <%=rs.getString(12) %></strong>
            <br>
            <strong><%=rs.getString(2) %> </strong>
            
            <br>
            
            <strong><input type="hidden" name="to" value="<%=rs.getString(4) %>"><%=rs.getString(4) %> </strong>
            <input type="hidden" name="type" value="student">
            </button>   
            <br>
                 </form>
            <form method="post" action="sendMailStudent.jsp"> 
            <input type="hidden" name="to" value="<%=rs.getString(4) %>">
            <button  class="btn btn-success" role="button" type="submit" >Send me an Email</button>
            
            </form>
            <br>
        </center>
        </div>
            
            
            
        <% } %>
        
    </div>
</div>
           </div>
           
       </div>
       <%  
    

    }else{
        
        response.sendRedirect("login.jsp");
    }
}catch(Exception ex){
        ex.printStackTrace();
out.println("<script type=\"text/javascript\">");
   out.println("location='dashboard.jsp';");
   out.println("</script>");

    }
%>



<%@include file="footer.jsp"%>