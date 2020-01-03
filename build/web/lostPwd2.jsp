<%@page import="com.pass"%>
<%@page import="java.sql.ResultSet"%>
<%@include file="header.jsp" %>
<%@include file="menuBeforeLogin.jsp"%>
<%@include file="getConnection.jsp"%>
<%@page import="com.SendMail"%>
<%
 try{
    String email=request.getParameter("email");
    String pass = session.getAttribute("tmpPwd").toString();
    int pwd1=Integer.parseInt(pass);
     pass a=new pass();
    int pwd2=a.decrypt(pwd1);
    
        
        String sql="select * from login where username='"+email+"'";
        
        ResultSet rs=st.executeQuery(sql);
    if(rs.next())
    {
        
        SendMail mail=new SendMail();
      mail.ForgotPassword(email, pwd2);
      
session.setAttribute("email", email);

%>

      <form method="post" action="lostPwd3.jsp">
    
    
        <label class="control-label col-sm-10" for="name">A mail has been sent to <%=email%> with a one time verification code to change the password. Please enter it below:</label><br>
      <div class="col sm-8">
        <input type="password" class="form-control" name="OTP" id="OTP" placeholder="Verification Password" required><br>
      </div>
          
          <button class="btn btn-info" type="submit">Next</button>
      
</form>
      
<%  



    }

else
{
out.println("<script type=\"text/javascript\">");
   out.println("alert('That email does not exist in SBA alumni. Please enter a valid email');");
   out.println("location='lostPwd1.jsp';");
   out.println("</script>");

}
    }
    catch(Exception ex1)
    {
        ex1.printStackTrace();
        response.sendRedirect("lostPwd1.jsp");
    }

    
   


    

    


%>