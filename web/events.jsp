
<%@page import="java.sql.ResultSet"%>
<%@include file="getConnection.jsp" %>
<%@include file="header.jsp"%>
<style>
div.scroll {
    
    width: 1300px;
    height: 500px;
    overflow: scroll;
    align-self: center;
}
</style>
<%
if(session.getAttribute("username")==null&&session.getAttribute("admin")==null){

String sql="select * from events";
ResultSet rs=st.executeQuery(sql);

%>
<%@include file="menuBeforeLogin.jsp"%>
<center><div class="scroll">
        
<%
while(rs.next()){
%>

    
        Posted on: <%=rs.getString(1)%><br>
        <strong><%=rs.getString(2)%></strong><br>
        <p><%=rs.getString(3)%></p>

        <%}%>
        </div>
        <br><br></center>

<%}
else if(session.getAttribute("username")!=null&&session.getAttribute("admin")==null){
String sql="select * from events";
ResultSet rs=st.executeQuery(sql);

%>
<%@include file="menuAfterLogin.jsp"%>

<center><div class="scroll">
        
<%
while(rs.next()){
%>

    
        Posted on: <%=rs.getString(1)%><br>
        <strong><%=rs.getString(2)%></strong><br>
        <p><%=rs.getString(3)%></p>

        <%}%>
        </div>
        <br><br></center>

<%
   } else if(session.getAttribute("admin")!=null){
String sql="select * from events ORDER BY date desc";
ResultSet rs=st.executeQuery(sql);
%>
<%@include file="menuAfterLogin.jsp"%>

    <a href="addEvent.jsp"><button class="btn btn-info">Add an event</button></a><br><br>

<div class="scroll">
        
<%
while(rs.next()){
%>

    
       <%=rs.getString(1)%><br>
        <center>
            <div class="col sm-8" style="background-color: floralwhite">
        <strong><%=rs.getString(2)%></strong><br>
        <p><%=rs.getString(3)%></p></div></center>

        <%}%>
        </div>
        <br><br>
<%}%>

</body></html>