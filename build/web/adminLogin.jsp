<%
String username = request.getParameter("username");
String password = request.getParameter("password");

if(username.equals("admin")&&password.equals("admin"))
{
    session.setAttribute("admin", "Active");
    
    out.println("<script type=\"text/javascript\">");
   out.println("alert('Correct Credentials');");
   out.println("location='adminDashboard.jsp';");
   out.println("</script>");

}
else
{
    out.println("<script type=\"text/javascript\">");
   out.println("location='index.jsp';");
   out.println("</script>");
}

%>