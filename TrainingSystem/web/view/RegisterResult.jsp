x<%-- 
    Document   : RegisterResult
    Created on : Sep 24, 2022, 5:40:25 PM
    Author     : tuand
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <center>
		<h3><%=request.getAttribute("Message")%></h3>
	</center>
        <center>
		<div class="heading-bx left">
					<h2 class="title-head">Sign Up <span>Now</span></h2>
					<p>Login Your Account <a href="http://localhost:8080/TrackingSystem/Login">Click here</a></p>
				</div>
	</center>
        
    </body>
</html>
