<%@include file="getConnection.jsp"%>

<%try{
String comment=request.getParameter("comment");
String sql="delete from comments where comments='"+comment+"'";
st.executeUpdate(sql);

out.println("<script type=\"text/javascript\">");
   out.println("alert('Comment deleted');");
   out.println("location='adminDashboard.jsp';");
   out.println("</script>");}
catch(Exception ex)
{
    out.println("<script type=\"text/javascript\">");
   out.println("alert('An error occured');");
   out.println("location='adminDashboard.jsp';");
   out.println("</script>");
}


%>