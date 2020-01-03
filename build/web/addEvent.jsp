<%@include file="header.jsp"%>
<form action="addEventProcess.jsp" method="post">
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="name">Event Name:</label>
      <div class="col-sm-4">
          <input type="text" class="form-control" name="name" id="fname" placeholder="Enter your first Name" required autofocus="autofocus">
      </div>
    </div>
    <br><br><br>
      <div class="form-group">
      <label class="control-label col-sm-2" for="name">Event Description:</label>
      <div class="col-sm-4">
         <textarea class="form-control" rows="10" cols="70" id="comment" name="desc" autofocus="autofocus"></textarea>
         <BR> <button class="btn btn-default" type="submit">Submit</button>
      </div>
    </div>
    
</form>


</body></html>