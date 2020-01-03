<%@page import="java.sql.ResultSet"%>
<%@include file="getConnection.jsp" %>
<%try
{
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
         
         
String college=request.getParameter("college");
String job=request.getParameter("job");
String live=request.getParameter("live");
String desc=request.getParameter("desc");
String studied=request.getParameter("studied");


 String email=session.getAttribute("username").toString();
 

    String sql="update alumni set college='"+college+"', job_field='"+job+"', living_in='"+live+"', description='"+desc+"',studied='"+studied+"' where email='"+email+"'";
    st.executeUpdate(sql);
    out.println("<script type=\"text/javascript\">");
   out.println("alert('Changes saved');");
   out.println("location='profile.jsp';");
   out.println("</script>");

}
catch(Exception ex)
{
    out.println("<script type=\"text/javascript\">");
   out.println("alert('An error ocurred. Please try again later');");
   out.println("location='profile.jsp';");
   out.println("</script>");
}
%>
