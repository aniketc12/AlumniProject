
<%@include file="getConnection.jsp" %>
<%try{
    
    Statement s=con.createStatement();
        String update="UPDATE login SET remember='0' WHERE username='"+session.getAttribute("username") +"'";
        s.executeUpdate(update);
    session.invalidate();
               response.sendRedirect("index.jsp");
    
}catch(Exception ex)
{
    out.println("<script type=\"text/javascript\">");
   out.println("location='login.jsp';");
   out.println("</script>");


}
%>
