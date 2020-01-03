<%@page import="org.eclipse.jdt.internal.compiler.flow.FinallyFlowContext"%>
<%@page import="java.sql.ResultSet"%>
<%@include file="header.jsp"%>

<%@include file="getConnection.jsp"%>
<%@page import="com.SendMail"%>
<%
    
  System.out.println("dashboard");  
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
    String sql="select * from comments ORDER BY time desc limit 15";
    ResultSet rs=st.executeQuery(sql);
        
    
    
    

%>
<%@include file="menuAfterLogin.jsp"%>
<style>
div.scroll {
    
    width: 600px;
    height: 300px;
    overflow: scroll;
}

</style>


<center>
    
    
<div class="scroll">
    <%while(rs.next())
{
    
    if(session.getAttribute("username").equals(rs.getString(3))){%>
    <div class="col-sm-12" style="background-color:#4d79ff; height: 40px; border-radius: 15px" align="right"><strong><%=rs.getString(2)%></strong> at: <%=rs.getString(5)%>
        <br><strong><%=rs.getString(3)%></strong></div>
    <div class="col-sm-12" style="background-color:#b3c6ff;border-radius: 15px" align="right"><%=rs.getString(4)%></div>
    <br><br><br><br>
    
    <%}else
{%>
     <div class="col-sm-12" style="background-color:lightgray; height: 40px; border-radius: 15px" align="left"><strong><%=rs.getString(2)%></strong> at: <%=rs.getString(5)%>
        <br><strong><%=rs.getString(3)%></strong></div>
    <div class="col-sm-12" style="background-color:whitesmoke;border-radius: 15px" align="justify"><%=rs.getString(4)%></div>
    <br><br><br><br>
    
    <%

}}%>
</div>
<br>
    
    <form method="post" action="postMessage.jsp">
       <div class="input-group">
        <textarea class="form-control" rows="2" cols="65" id="comment" name="comment"></textarea>
        <button type="submit" class="btn btn-default">Post message</button>
        
            </div>
    
</form>
</center>




<%
    }
else
{
response.sendRedirect("login.jsp");
}
}
catch(Exception ex)
{
System.out.println("catch");        
ex.printStackTrace();
response.sendRedirect("login.jsp");
}


%>


<%@include file="footer.jsp"%>