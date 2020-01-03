<%@page import="com.pass"%>
<%@page import="java.sql.ResultSet"%>
<%@include file="header.jsp" %>
<%@include file="menuBeforeLogin.jsp"%>
<%@include file="getConnection.jsp"%>

<%@page import="com.SendMail"%>


<%
    
  try{  
    
    String appNo = request.getParameter("appNo");
    String fname = request.getParameter("fname");
    String rollNo = request.getParameter("rollNo");
    String house = request.getParameter("house");
    String email = request.getParameter("email");
    String pwd1 = request.getParameter("pwd1");
    String pwd2 = request.getParameter("pwd2");
    String lname = request.getParameter("lname");
    
    int rollNum = Integer.parseInt(rollNo);
    int h_id = Integer.parseInt(house);
    
    Statement st2=con.createStatement();
    Statement st3=con.createStatement();
    
    String sql3="select * from login where username='"+email+"'";
    String sql4="select * from student where rollNo='"+rollNum+"'";
    ResultSet rs5=st2.executeQuery(sql3);
    ResultSet rs6=st3.executeQuery(sql4);
    
    if(rs5.next())
        {
            out.println("<script type=\"text/javascript\">");
   out.println("alert('Sorry, but that email-id is already in use');");
   out.println("location='registerStudent.jsp';");
   out.println("</script>");
//            response.sendRedirect("registerStudent.jsp");
            
       
        }
        else if(rs6.next())
        {
          out.println("<script type=\"text/javascript\">");
   out.println("alert('Sorry, but that Roll No. is already in use');");
   out.println("location='registerStudent.jsp';");
   out.println("</script>");  
        }
else
{

String verify=session.getAttribute("ver").toString();
session.setAttribute("email", email);
session.setAttribute("fname", fname);
session.setAttribute("lname", lname);
session.setAttribute("rollNo", rollNo);
session.setAttribute("house", house);
session.setAttribute("password",pwd1);

int ver=Integer.parseInt(verify);
pass a=new pass();
int otp=a.decrypt(ver);

session.setAttribute("ver", verify);



%>
<%

%>
<form method="post" action="signupProcess.jsp">
    <div class="container">
    <h5>An Email has been sent to <%=email%> with a one time verification code. Copy-paste it into the following box-</h5>
    <input type="text" name="check" ><br>

<br>
<button type="submit" class="btn btn-info">submit</button><br>
<a href="registerStudent.jsp">Or change your Email address</a>
    </div>

</form>
<%
   try{ SendMail mail=new SendMail();
      mail.Verify(email, otp);}
   catch(Exception ex)
   {
       out.println("<script type=\"text/javascript\">");
   out.println("alert('Check your internet and try again');");
   out.println("location='registerStudent.jsp';");
   out.println("</script>");

   }
}
}
catch(Exception e)
{
out.println("<script type=\"text/javascript\">");
   
   out.println("location='registerStudent.jsp';");
   out.println("</script>");
}
%>