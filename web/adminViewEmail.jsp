<%@page import="java.sql.ResultSet"%>
<%@include file="header.jsp"%>

<%@include file="getConnection.jsp"%>
<%@page import="com.SendMail"%>
<script>
    
    $(document).ready(function() {
  $("#btnExport").click(function(e) {
    e.preventDefault();

    //getting data from our table
    var data_type = 'data:application/vnd.ms-excel';
    var table_div = document.getElementById('table_wrapper');
    var table_html = table_div.outerHTML.replace(/ /g, '%20');

    var a = document.createElement('a');
    a.href = data_type + ', ' + table_html;
    a.download = 'Alumni_Email_List.xls';
    a.click();
  });
});
</script>

<%try{
    if(session.getAttribute("admin") !=null){
    
    

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
    <button class="btn btn-info" id="btnExport">Export email list to excel</button><br><br>
    <div  id="table_wrapper">
        
<div class="scroll">
    
        
    <table>
        
    <tr>
        
        <th>Alumni email list</th>
    </tr>
    </table><br><br>

    <%
        String sql="select * from alumni";
        ResultSet rs=st.executeQuery(sql);
        while(rs.next())
{%>
<center>
<table>

    <tr>
        
        <td width="10%"><%=rs.getString(3)%></td>
    </tr>
</table>

</center>
    

<%}%>
</div>
</div>
</center>
<%}
}catch(Exception ex)
{

}
%>