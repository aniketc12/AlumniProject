<%@page import="java.net.CookieStore"%>
<%@page import="java.sql.ResultSet"%>
<%@include file="getConnection.jsp" %>
<%try
{
    System.out.println("login");
    String remember = request.getParameter("remember");
    if(remember==null){
   
    }else
    {
        System.out.println("remember remember");
        Cookie email = new Cookie("email", request.getParameter("email")); 
   email.setMaxAge(60*60*24); 
   response.addCookie( email );
    }

    String username=request.getParameter("email");
    String password=request.getParameter("pwd");
    System.out.println("password"+password);
 String sql="select s.name from login l inner join student s on l.username=s.email where l.username='"+username+"' and l.password= BINARY '"+password+"'";
    
    
    String sql1="select a.name from login l inner join alumni a on l.username=a.email where l.username='"+username+"' and  l.password= BINARY '"+password+"'";
           
            
    ResultSet rs=st.executeQuery(sql);
    Statement st1=con.createStatement();
    ResultSet rs1=st1.executeQuery(sql1);
    if(remember!=null)
    {
        Statement s=con.createStatement();
        String update="UPDATE login SET remember='1' WHERE username='"+username+"'";
        s.executeUpdate(update);
        
    }
   //student
    if(rs.next())
    {
        
        session.setAttribute("username", username);
        session.setAttribute("name", rs.getString(1));
    session.setAttribute("type","student");
    session.setAttribute("password",password);
    out.println("<script type=\"text/javascript\">");
   
   out.println("location='dashboard.jsp';");
   out.println("</script>");
    }
    else if(rs1.next())
    {
        session.setAttribute("username", username);
        session.setAttribute("name", rs1.getString(1));
    session.setAttribute("type","alumni");
    session.setAttribute("password",password);
    out.println("<script type=\"text/javascript\">");
   out.println("location='dashboard.jsp';");
   out.println("</script>");
    }
    
    
    else
    {
       out.println("<script type=\"text/javascript\">");
   
   out.println("location='loginWrong.jsp';");
   out.println("</script>");
//        request.getRequestDispatcher("login.jsp").include(request, response);

    

    }
}
catch(Exception ex)
{
    ex.printStackTrace();
    
    out.println("<script type=\"text/javascript\">");
   out.println("location='login.jsp';");
   out.println("</script>");

}
%>