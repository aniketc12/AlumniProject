<%@page import="java.sql.ResultSet"%>
<%@include file="header.jsp"%>

<%@include file="getConnection.jsp"%>
<%@page import="com.SendMail"%>

<%try{
    if(session.getAttribute("admin") !=null){
    String sql="select * from comments ORDER BY time desc limit 15";
    ResultSet rs=st.executeQuery(sql);
        
    
    System.out.println("hello");
    

%>
<%@include file="menuAfterLogin.jsp"%>
<style>
div.scroll {
    
    width: 600px;
    height: 300px;
    overflow: scroll;
}

div.scroll1 {
    
    width: 600px;
    height: 200px;
    overflow: scroll;
}
</style>


<center>
    
    
<div class="scroll">
    <%while(rs.next())
{%>
    
    
     <div class="col-sm-12" style="background-color:lightgray; height: 40px; border-radius: 15px" align="left"><strong><%=rs.getString(2)%></strong> at: <%=rs.getString(5)%>
        <br><strong><%=rs.getString(3)%></strong></div>
    <div class="col-sm-12" style="background-color:whitesmoke;border-radius: 15px" align="justify"><%=rs.getString(4)%>
    <br>
    <form action="adminDeleteComment.jsp" method="post">
        <button type="submit" class="btn btn-link">Delete</button>
        <input type="hidden" value="<%=rs.getString(4)%>" name="comment">
    </form>
    </div>

    
    
    <br><br><br><br><br><br><br>
    
    <%

}%>
</div>
<div class="scroll1">
    <%
        String sql1="select * from student where change_alumni='1'";
        Statement st1=con.createStatement();
        ResultSet rs1=st1.executeQuery(sql1);
        while(rs1.next())
{%>
    <div class="col-sm-12" align="left">
    Name: <%=rs1.getString(3)%> <%=rs1.getString(12)%>
    <br>
    Email: <%=rs1.getString(4)%>
     
     
    <form action="adminChangeStudent.jsp" method="post">
        <input type="hidden" name="fname" value="<%=rs1.getString(3)%>">
        <input type="hidden" name="lname" value="<%=rs1.getString(12)%>">
        <input type="hidden" name="email" value="<%=rs1.getString(4)%>">
        
        <input type="hidden" name="h_id" value="<%=rs1.getString(5)%>">
        <input type="hidden" name="img" value="<%=rs1.getString(6)%>">
        <button type="submit" class="btn btn-link">Allow</button>
        
    </form>
    </div>
    <br><br><br><br><br><br><br>
    
    <%

}%>
</div>
<br>

<a href="adminViewEmail.jsp"><button class="btn-success">View alumni email list</button></a>

</center>




<%
    }
else
{
response.sendRedirect("login.jsp");
}
}
catch(Exception ex)
{
System.out.println("catch");        
ex.printStackTrace();
response.sendRedirect("login.jsp");
}


%>


<%@include file="footer.jsp"%>