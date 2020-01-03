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
         
         
String password=request.getParameter("checkpwd");
String email=session.getAttribute("username").toString();


    System.out.println("Inside first try");
    String sql="select * from login where username='"+email+"' and password='"+password+"'";
    System.out.println("Inside first try1");
    ResultSet rs=st.executeQuery(sql);
    System.out.println("Inside first try2");
    
    if(rs.next())
    {
        System.out.println("Inside first if");
        try
        {
            System.out.println("Inside second try");
            String newPassword=request.getParameter("pwd1");
            String sql1="update login  set password='"+newPassword+"' where username='"+email+"'";
            Statement st1=con.createStatement();
            st1.executeUpdate(sql1);
            
               System.out.println("Inside seconf if");
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Password successfully changed ');");
                out.println("location='profile.jsp';");
                out.println("</script>");
            
        }
        catch(Exception ex1)
    
        {
           System.out.println("Inside first catch");
            out.println("<script type=\"text/javascript\">");
   out.println("alert('An unexpected error occured. Please login again');");
   out.println("location='login.jsp';");
   out.println("</script>");
        }
    }
    else
    {
        out.println("<script type=\"text/javascript\">");
   out.println("alert('Incorrect Password');");
   out.println("location='changePassword.jsp';");
   out.println("</script>");
    }
}
catch(Exception ex)
{
    System.out.println("Inside main catch");
    out.println("<script type=\"text/javascript\">");
   out.println("alert('Sesion Timed Out');");
   out.println("location='login.jsp';");
   out.println("</script>");
   ex.printStackTrace();
}
%>