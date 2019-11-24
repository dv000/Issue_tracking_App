<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
      <link rel="stylesheet" href="bootstrap.css">
  
    <link rel="stylesheet" href="style.css">
  


</head>



<%




response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");


if(session.getAttribute("user")==null)//
{
	
response.sendRedirect("index.jsp");



}


%>






<body>











<!-- //////////////////////////////////////     <div class="navbar-header">   NAVBAR </form>  /////////////////////////////////////////////////////////////////// ---->
<form action="Logout">

<nav class="navbar navbar-expand-lg navbar navbar-dark bg-primary">
  <a class="navbar-brand" href="main.jsp">Issue tracking App</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarText">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="main.jsp"> <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#" > <font color="white">Welcome ${user}</font> </a>
      </li>
      
    </ul>
    <span class="navbar-text">
   <button class="btn btn-danger navbar-btn" type="submit">Log out</button>
    </span>
  </div>
</nav>

</form>




<!-- //////////////////////////////////////  #54C7C3  Jumbo   /////////////////////////////////////////////////////////////////// ---->


<div class="jumbotron jumbotron-fluid">
  <div class="container">
    <h3 class="display-4">Issue tracking app</h3>
    <p class="lead">Edit, delete, or chage the status of the issue <font color="#dc3545"> <b>bellow!!.</b></font></div></p>
  </div>
</div>



<div class="container">



<form action="IssueServlet" method="post">
<input type="text" hidden name="id"value = "<%=request.getAttribute("id")%>" >
  <div class="form-group">
    <label for="exampleInputEmail1">Title</label>
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Edit title" name="title" required>

  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">Description</label>
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Edit description" name="description" required>

  </div>
  
  <div class="form-group">
    <label for="exampleInputPassword1">Assigned to</label>
    <input type="text" class="form-control" id="exampleInputPassword1" placeholder="Assigned to" name="assignedTo" required>
  </div>
  
  
  <div class="form-group">
      <label for="inputState">Type of issue</label>
      <select id="inputState" class="form-control" name="type" required>
        <option >Bug</option>
        <option>Feature</option>
        <option>Business logic</option>
      </select>
    </div>
    <div class="form-group">
      <label for="inputState">Status</label>
      <select id="inputState" class="form-control" name="status" >
        <option >New</option>
        <option>In progress</option>
        <option>Resolved</option>
      </select>
    </div>
  <div class="form-group form-check">
    <input type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">Check me out</label>
  </div>
  <button type="submit" class="btn btn-primary" >Edit</button>
  </form>
  <br>
  <form action="IssueServlet" method="post"> <input type="text" value="<%=request.getAttribute("id")%>" hidden name="delete"> <button class="btn btn-danger navbar-btn" type="submit">Delete</button><form>



</div>












</body>
</html>