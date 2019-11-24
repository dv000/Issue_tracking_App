<!DOCTYPE html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <link type="text/css" rel="stylesheet" href="style.css">

</head>

	
	
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<body>
   <div class="container">
      <div class="col-md-6 mx-auto text-center">
         <div class="header-title">
            <h1 style: class="wv-heading--title">
               Issue tracking app
            </h1>
            <h2 class="wv-heading--subtitle">
               Hop in. Everyone's invited
            </h2>
         </div>
      </div>
      <div class="row">
         <div class="col-md-4 mx-auto">
            <div class="myform form ">
               <form action="Signup" method="post" name="Signup">
                  <div class="form-group">
                     <input type="text" name="uname"  class="form-control my-input" id="name" placeholder="Username" required>
                  </div>
                  <div class="form-group">
                     <input type="password" name="pass"  class="form-control my-input" id="email" placeholder="Password" required>
                  </div>
                  </div>
                  <div class="form-group">
                     <input type="password" name="pass2"  class="form-control my-input" id="email" placeholder="Confirm Password" required>
                  </div>
                  <div class="text-center ">
                     <button type="submit" class=" btn btn-block send-button tx-tfm" name="Signup">Sign up</button>
                  </div>
                  <div class="col-md-12 ">
                     <div class="login-or">
                        <hr class="hr-or">
                        <span class="span-or"> </span>
                     </div>
                  </div>
                  
                  <p class="small mt-3">Sign up to create an account for free. If you already have an account <a href="index.jsp">Back to log in</a>
                  </p>
               </form>
                <p style="color: red";>${errormessage}</p>
            </div>
         </div>
      </div>
   </div>

</body>
</html>