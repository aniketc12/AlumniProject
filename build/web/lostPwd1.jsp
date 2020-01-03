<%@page import="com.pass"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.ResultSet"%>
<%@include file="header.jsp" %>
<%@include file="menuBeforeLogin.jsp"%>
<%@include file="getConnection.jsp"%>
<%@page import="com.SendMail"%>

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
         

Random rand = new Random();
int n = 0;

        n=rand.nextInt(9999) + 412;

pass a=new pass();
int pass=a.encrypt(n);
session.setAttribute("tmpPwd",pass);
%>

<form method="post" action="lostPwd2.jsp">
    
    
        <label class="control-label col-sm-2" for="name">Enter you Email:</label>
      <div class="col-sm-6">
          <input type="text" class="form-control" name="email" id="email" placeholder="Email" required><br>
      </div>
           <br><br>
          
          <button class="btn btn-info" type="submit">Next</button>
      
</form>


<%@include file="footer.jsp"%>
<%}
catch(Exception ex)
{
out.println("<script type=\"text/javascript\">");
   out.println("location='login.jsp';");
   out.println("</script>");

}
%>