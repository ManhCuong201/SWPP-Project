<%-- 
    Document   : login
    Created on : Jan 7, 2024, 8:03:12 PM
    Author     : TGDD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Happy Programming</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body >
        <form  action="login" method="post">
        <label for="username">Username</label>
        <br>
        <input type="text" name="username" id="username" placeholder="Username"/>
        <br>
        <label for="password">Password</label>
        <br>
        <input type="password" name="password" id="password" placeholder="Password"/>
        <br><br>
        <input type="submit" value="Login">
        <a href="register">
            <input type="button" value="Register" />
        </a>
        </form>
        <% if(session.getAttribute("User") != null) {%>
        <p>Login successfully</p>
        <%}%>
    </body>
</html>

