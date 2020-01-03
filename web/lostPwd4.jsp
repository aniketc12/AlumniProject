<%@page import="java.sql.ResultSet"%>
<%@include file="header.jsp" %>
<%@include file="menuBeforeLogin.jsp"%>
<%@include file="getConnection.jsp"%>
<%@page import="com.SendMail"%>
<%
 
    try{
    String pwd = request.getParameter("Pwd");
    String email = session.getAttribute("email").toString();
   
     
        String sql="update login  set password='"+pwd+"' where username='"+email+"'";
        st.executeUpdate(sql);
        out.println("<script type=\"text/javascript\">");
   out.println("alert('Password Change sucessful');");
   out.println("location='login.jsp';");
   out.println("</script>");
    }
    catch(Exception ex1)
    {
           
    ex1.printStackTrace();
    
    response.sendRedirect("lostPwd1.jsp"); 
    System.out.println("Inside catch");
            }
%>