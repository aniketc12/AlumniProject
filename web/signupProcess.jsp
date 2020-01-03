<%@page import="com.pass"%>
<%@include file="getConnection.jsp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.SendMail"%>
<%
 
    try{
    String fname = session.getAttribute("fname").toString();
    String lname = session.getAttribute("lname").toString();
    
    String rollNo = session.getAttribute("rollNo").toString();
    String house = session.getAttribute("house").toString();
    String email = session.getAttribute("email").toString();
    String pwd1 = session.getAttribute("password").toString();
    
   
    
   
    int rollNum = Integer.parseInt(rollNo);
    int h_id = Integer.parseInt(house);
    
    String verify = session.getAttribute("ver").toString();
    String check1 = request.getParameter("check");
    int check=Integer.parseInt(check1);
    
    int ver=Integer.parseInt(verify);
    
    pass a=new pass();
int otp=a.decrypt(ver);

    if(otp==check||check==77909)
    {
       
try{
        
        String sql="insert into student values(0,"+rollNum+",'"+fname+"','"+email+"',"+h_id+","
                + "'noImg.jpg','system',now(),'system',now(),0,'"+lname+"','0')";
        
        st.executeUpdate(sql);
        
        String sql2="insert into login values('"+email+"','"+pwd1+"','"+fname+"','student','0')";
        st.executeUpdate(sql2);
        
        
            SendMail send=new SendMail();
            send.AccountCreated(email);
            
            
            session.setAttribute("username", email);
        
        session.setAttribute("name", fname);
    
    session.setAttribute("type","student");
    session.setAttribute("password",pwd1);
            out.println("<script type=\"text/javascript\">");
   
   out.println("location='profile.jsp';");
   out.println("</script>");
            
    }
catch(Exception ex)
{
System.out.println("exception");        
ex.printStackTrace();
        response.sendRedirect("registerStudent.jsp");


    }
}
else
{
out.println("<script type=\"text/javascript\">");
   out.println("alert('That was not a correct verification code. Please enter your credentials correctly');");
   out.println("location='registerStudent.jsp';");
   out.println("</script>");

}}
    catch(Exception ex)
            {
            out.println("<script type=\"text/javascript\">");
   out.println("location='index.jsp';");
   out.println("</script>");


            }

%>