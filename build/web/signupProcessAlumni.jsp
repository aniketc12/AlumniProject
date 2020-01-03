<%@page import="com.pass"%>
<%@page import="java.sql.ResultSet"%>
<%@include file="getConnection.jsp"%>
<%@page import="com.SendMail"%>
<%
try{
    
    String fname = session.getAttribute("fname").toString();
    String lname = session.getAttribute("lname").toString();
    String house = session.getAttribute("house").toString();
    String email = session.getAttribute("email").toString();
    String pwd1 = session.getAttribute("password").toString();
    int batch = Integer.parseInt(session.getAttribute("batch").toString());

    
    
    int h_id = Integer.parseInt(house);
    Statement st2=con.createStatement();
    String sql3="select * from login where username='"+email+"'";
    ResultSet rs5=st2.executeQuery(sql3);
    
        

    String verify = session.getAttribute("ver").toString();
    String check1 = request.getParameter("check");
    int check=Integer.parseInt(check1);
    
    int ver=Integer.parseInt(verify);
    
    pass a=new pass();
int otp=a.decrypt(ver);
    if(otp==check)
    {
        System.out.println("Inside if");

    try{
        System.out.println("Inside try");
        String sql="insert into alumni values(0,'"+fname+"','"+email+"',"+h_id+","
                +"'Not yet inserted','Not yet inserted','noImg.jpg','system',now(),'system',now(),0,'Not yet inserted','Not yet inserted','"+lname+"','Not yet inserted','"+batch+"')";
        
        st.executeUpdate(sql);
        
        String sql2="insert into login values('"+email+"','"+pwd1+"','"+fname+"','alumni','0')";
        st.executeUpdate(sql2);
            SendMail send=new SendMail();
            send.AccountCreated(email);
            
            
            session.setAttribute("username", email);
        session.setAttribute("name", fname);
    
    session.setAttribute("type","alumni");
    session.setAttribute("password",pwd1);
            out.println("<script type=\"text/javascript\">");
   
   out.println("location='profile.jsp';");
   out.println("</script>");
   
   
    }catch(Exception ex){
        System.out.println("Inside catch");
        ex.printStackTrace();
        response.sendRedirect("registerAlumni.jsp");

    }
}
    else
{
    System.out.println("Inside else");
out.println("<script type=\"text/javascript\">");
   out.println("alert('That was not a correct verification code. Please enter your credentials correctly');");
   out.println("location='registerAlumni.jsp';");
   out.println("</script>");

}
}catch(Exception ex)
{
    out.println("<script type=\"text/javascript\">");
   out.println("location='index.jsp';");
   out.println("</script>");


}
    
    



%>