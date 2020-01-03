
<%@include file="getConnection.jsp" %>
<%
    try{
String name=request.getParameter("name");
String desc=request.getParameter("desc");

String sql="insert into events values(now(),'"+name+"','"+desc+"')";
st.executeUpdate(sql);
out.println("<script type=\"text/javascript\">");
   out.println("location='events.jsp';");
   out.println("</script>");
    }
    catch(Exception ex)
    {
        
    }


%>