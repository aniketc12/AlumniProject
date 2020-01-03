<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Date"%>
<%@page import="com.ImgFile"%>
<%@include file="getConnection.jsp"%>
<%@page import="com.SendMail"%>

<%
try{
String t=new Timestamp(new Date().getTime()).toString();
ImgFile a=new ImgFile();
String date=a.changeDate(t);
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String email=request.getParameter("email");
String h_id=request.getParameter("h_id");
String img=request.getParameter("img");
String sql="insert into alumni values(0,'"+fname+"','"+email+"',"+h_id+","
                +"'Not yet inserted','Not yet inserted','"+img+"','system',now(),'system',now(),0,'Not yet inserted','Not yet inserted','"+lname+"','Not yet inserted','"+date+"')";

st.executeUpdate(sql);

Statement st1=con.createStatement();
String sql1="update login set type='alumni' where username='"+email+"'";
st1.executeUpdate(sql1);

Statement st2=con.createStatement();
String sql2="delete from student where email='"+email+"'";
st2.executeUpdate(sql2);

out.println("<script type=\"text/javascript\">");
   out.println("alert('Student has now become an alumni');");
   out.println("location='adminDashboard.jsp';");
   out.println("</script>");


}
catch(Exception ex)
        {
            ex.printStackTrace();
        }

%>
