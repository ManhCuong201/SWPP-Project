<%-- 
    Document   : courseCRDU
    Created on : Jan 7, 2024, 10:14:53 PM
    Author     : TGDD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Beans.Course, java.util.ArrayList" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Course CRUD</title>
    </head>
    <body>
        <%
            Course c = null;
           if(request.getAttribute("course") != null) {
                c = (Course)request.getAttribute("course");
                
        }%>
        <form action="<%=c != null ? "edit" : "add"%>" method="post">
        <%if(c != null) {%>
        <input type="hidden" name="id" value="<%=c.getId()%>">
        <%}%>
        <input type="text" name="name" placeholder="course name" value="<%=c != null ? c.getName() : ""%>"/>
        <br>
        <input type="text" name="description" placeholder="course description" value="<%=c != null ? c.getDescription() : ""%>"/>
        <br>
        <input type="date" name="date" placeholder="course time" <%=c != null ? "value=\""+c.getCourseTime()+"\"" : ""%>/>
        <br>
        <input type="submit" value="<%=c != null ? "Edit Course" : "Add Course"%>"/>
        </form>
    </body>
</html>
