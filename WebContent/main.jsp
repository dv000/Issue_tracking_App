


<%@page import ="java.sql.*" 
 import ="java.servlet.*" 
 import ="issue_tracking_app.connection" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>




<html>
<head>
	<title></title>
	
	
	 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
      <link rel="stylesheet" href="bootstrap.css">
  
    <link rel="stylesheet" href="style.css">
  

	
</head>
<body>


<%



response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");



if(session.getAttribute("user")==null)//allagh apo username
{
	
response.sendRedirect("index.jsp");



}


%>









<!-- //////////////////////////////////////     <div class="navbar-header">   NAVBAR </form>  /////////////////////////////////////////////////////////////////// ---->
<form action="Logout">

<nav class="navbar navbar-expand-lg navbar navbar-dark bg-primary">
  <a class="navbar-brand" href="#">Issue tracking App</a>
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
    <h1 class="display-4">Issue tracking app</h1>
    <p class="lead">Track your project issues easier than ever adress your issue  <font color="#dc3545"> <b>bellow!!.</b></font></div></p>
  </div>
</div>








<div class="container">






<!-- /////////////////////////////////////////////FORM//////////////////////////////////////////////////////////// ---->

<form action="IssueServlet" method="post" onsubmit="return productsAdd()">
  <div class="form-group">
    <label for="exampleInputEmail1">Title</label>
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter title" name="title" required>

  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">Description</label>
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter description" name="description" required>

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
  <div class="form-group form-check">
    <input type="checkbox" class="form-check-input" id="exampleCheck1" required>
    <label class="form-check-label" for="exampleCheck1">Check me out</label>
  </div>
  <button type="submit" class="btn btn-primary" >Add issue</button>
</form>

  	
 ${id}

<!-- /////////////////////////////////////////////TABLE//////////////////////////////////////////////////////////// ---->

 <br>
  	
  	


<!-- /////////////////////////////////////////////TABLE//////////////////////////////////////////////////////////// ---->




<table class="table table-bordered">



<tr>

<th	>Title</th>
<th	>Description</th>
<th	>Type</th>
<th	>User Assigned</th>
<th	>Date created</th>
<th	>Date edited</th>
<th	>Last user edited</th>
<th	>User created</th>
<th	>Status</th>
<th	>Action</th>


</tr>

<tr>


<% 

 		
		connection c= new connection();
		
	
		
		
		try{
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn= DriverManager.getConnection(c.getUrl(),c.getUsername(),c.getPassword());
			String sql="SELECT * FROM issues order by editDate desc";
			Statement st =conn.createStatement();
			ResultSet rs= st.executeQuery (sql);
			
			
			while(rs.next())
			{
			
				
				
				%>
				
				
				<form action="EditServlet" method="post">
				
				<input type=text name="idIssue" hidden value=<%=rs.getString("idIssue")%>></input>
				<tr bgcolor="<%=colorRow(rs.getString("type"))%>" >
				
				
				<td><%=rs.getString("title") %></td>
				<td><%=rs.getString("description") %></td>
				<td><%=rs.getString("type") %></td>
				<td><%=rs.getString("assignedTo") %></td>
				<td><%=rs.getString("createDate") %></td>
				<td><%=rs.getString("editDate") %></td>
				<td><%=rs.getString("lastUserEdit") %></td>
		 		<td><%=rs.getString("userCreated") %></td>
				<td><%=rs.getString("Status") %></td> 
				<td> <button class="btn btn-danger navbar-btn" type="submit"> Edit</button></td>
				</tr>
				
				</form>
				
				<% 
				
				
			
			}
				
		
			
			
			
			
		}catch(Exception e) {
			out.println("Exception:"+e.getMessage());
			e.printStackTrace();
		}
			
		
		






		%>












</table>




<%! public String colorRow(String type){
	String color;
	switch(type){
	        case "Bug": color = "#f2dede" ;
	        break;

	        case "Feature": color = "#d9edf7";
	        break;

	        case "Business logic": color = "dff0d8";
	        break;
			
	        default : color="whatever";
	       
	}

	return color;
	} %>







<!-- /////////////////////////////////////////////TABLE//////////////////////////////////////////////////////////// ---->


</body>
</html>
















