<%@page import="java.sql.ResultSet"%>
<%@include file="header.jsp"%>
<%@include file="getConnection.jsp"%>
<script>
    document.getElementById("sMember").classList.add('active');

document.getElementById("home").classList.remove('active');
</script>

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
          <div class="container">
               <div class="jumbotron">
  <h2>Fill in the following fields:</h2>
  
  <form method="post" action="sendMail.jsp">
      <div class="form-group" >
          <center> <label for="to">To:</label></center>
      <%        
      String to=request.getParameter("to");
      String from=(String)session.getAttribute("username");
      
      session.setAttribute("to", to);
      session.setAttribute("from", from);
    
      %>
          <center> <strong> <%=to%></strong></center>
    </div>
      
    <div class="form-group">
        <center><label for="comment">Comment:</label><br></center>
        <center><div class="input-group">
        <textarea class="form-control" rows="10" cols="70" id="comment" name="comment" autofocus="autofocus"></textarea>
        <input type="hidden" name="to" value="<%=to%>">
            </div></center>
    </div>
    
        
    <center>   
    <button type="submit" class="btn btn-info">Submit</button>
    </center>
  </form>
               </div></div>
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