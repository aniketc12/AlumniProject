
<%@include file="getConnection.jsp"%>

<%
String email=session.getAttribute("username").toString();
String sql="update student set change_alumni='1' where email='"+email+"'";

st.executeUpdate(sql);
out.println("<script type=\"text/javascript\">");
   out.println("alert('Your request is being processed by the administrator. Check back soon');");
   out.println("location='profile.jsp';");
   out.println("</script>");


%>