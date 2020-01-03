<%@page import="com.SendMail"%>

<%@page import="java.sql.ResultSet"%>
<%@include file="getConnection.jsp" %>
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
         
String to=session.getAttribute("to").toString();
String from = session.getAttribute("from").toString();
String name=session.getAttribute("name").toString();
String content=request.getParameter("comment");
System.out.println(to);
System.out.println(from);

SendMail a = new SendMail();
boolean status=a.MailContent(to,content,from,name);

if(status){
out.println("<script type=\"text/javascript\">");
   out.println("alert('Mail sent successfully');");
   out.println("location='dashboard.jsp';");
   out.println("</script>");
}else
{
    out.println("<script type=\"text/javascript\">");
   out.println("alert('We are having problems connecting. Please check your internet connection and try again');");
   out.println("location='dashboard.jsp';");
   out.println("</script>");
}

}catch(Exception ex)
{
    out.println("<script type=\"text/javascript\">");
   out.println("alert('OOPS. An unexpected error occured');");
   out.println("location='dashboard.jsp';");
   out.println("</script>");
}

%>