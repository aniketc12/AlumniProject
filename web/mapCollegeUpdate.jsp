
<%@include file="getConnection.jsp"%>
<%
    try{
String address=request.getParameter("address");
String username=session.getAttribute("username").toString();
String sql="update alumni set college='"+address+"' where email='"+username+"'";
st.executeUpdate(sql);
out.println("<script type=\"text/javascript\">");
   out.println("location='profile.jsp';");
   out.println("</script>");
    }
    catch(Exception ex)
    {
        out.println("<script type=\"text/javascript\">");
   out.println("alert('An unexpected error occurred');");
   out.println("location='index.jsp';");
   out.println("</script>");

    }

%>