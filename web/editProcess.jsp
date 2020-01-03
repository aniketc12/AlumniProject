<%@page import="java.sql.ResultSet"%>
<%@include file="getConnection.jsp"%>
<%
    
    try{
        boolean cook = false;
String username=null;
         Cookie cookie = null;
         Cookie[] cookies = null;
         
         // Get an array of Cookies associated with the this domain
         cookies = request.getCookies();
         
         
         if( cookies != null ) {
            
            for (int i = 0; i < cookies.length; i++) {
               cookie = cookies[i];
               if(cookie.getName().toString().equals("email")){
                  username =cookie.getValue().toString();
                   cook=true;
            }}
         }System.out.println("Username dashboard: "+username);
         if(username.equals("null"))
         {}else{
             String check="select * from login where username='"+username+"'";
             Statement stt=con.createStatement();
             ResultSet results=stt.executeQuery(check);
             System.out.println("before");
             while(results.next())
             {
                             System.out.println("after");
                 if(results.getString(5).equals("1")){
                 System.out.println("1");
                 session.setAttribute("username", results.getString(1).toString());
                 System.out.println("2");
                 session.setAttribute("type", results.getString(4).toString());
                 System.out.println("3");
                 session.setAttribute("name", results.getString(3).toString());
                 System.out.println("4");}
             }
         }
         
         
        
        String type=session.getAttribute("type").toString();
        if(type.equals("student"))
        {
            
    String email=session.getAttribute("username").toString();
    String name=request.getParameter("name");
    String rollNum=request.getParameter("rollNo");
    String lname=request.getParameter("lname");
    int rollNo = Integer.parseInt(rollNum);
    
    String sql3="select * from student where rollNo='"+rollNo+"'";
    Statement st1=con.createStatement();
    ResultSet rs1=st1.executeQuery(sql3);
    if(rs1.next())
    {
        String sql2="select * from student where email='"+email+"' and rollNo='"+rollNo+"'";
         Statement st2=con.createStatement();
    ResultSet rs2=st2.executeQuery(sql3);
    if(rs2.next())
    {
        try
    {
        
        String sql="update student set name='"+name+"',lname='"+lname+"' where email='"+email+"'";
        st.executeUpdate(sql);
        out.println("<script type=\"text/javascript\">");
   out.println("alert('That roll number already exists. Changes in name are saved');");
   out.println("location='profile.jsp';");
   out.println("</script>");
        
    }
    catch(Exception ex)
    {
        ex.printStackTrace();
        out.println("Try updating after some time");
        
    }
    }
    else
    {
        
   
   
   
   String sql="update student set name='"+name+"', rollNo='"+rollNo+"', lname='"+lname+"' where email='"+email+"'";
        st.executeUpdate(sql);
        out.println("<script type=\"text/javascript\">");
   out.println("alert('Profile updated');");
   out.println("location='profile.jsp';");
   out.println("</script>");
    }
    }
    else
    {
        try
    {
        String sql="update student set name='"+name+"', rollNo='"+rollNo+"', lname='"+lname+"' where email='"+email+"'";
        st.executeUpdate(sql);
        out.println("<script type=\"text/javascript\">");
   out.println("alert('Profile updated');");
   out.println("location='profile.jsp';");
   out.println("</script>");
    }
    catch(Exception ex)
    {
        ex.printStackTrace();
        out.println("Try updating after some time");
        
    }
    }
    }
        else
        {
             String name=request.getParameter("name");
              String lname=request.getParameter("lname");
              String email=session.getAttribute("username").toString();
              try{
              String sql="update alumni set name='"+name+"', lname='"+lname+"' where email='"+email+"'";
              st.executeUpdate(sql);
              out.println("<script type=\"text/javascript\">");
   out.println("alert('Account updated');");
   out.println("location='profile.jsp';");
   out.println("</script>");
              
              }
              catch(Exception ex)
              {
                  out.println("<script type=\"text/javascript\">");
   out.println("alert('An error occured please try again after some time');");
   out.println("location='profile.jsp';");
   out.println("</script>");
              }
        }
    }
    catch(Exception ex)
    {
        out.println("<script type=\"text/javascript\">");
   out.println("alert('An error occured please try again after some time');");
   out.println("location='profile.jsp';");
   out.println("</script>");
    }
    
    
    

%>