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
        <style>
            table, th, td {
                border: 1px solid black;
            }
        </style>
    </head>
    <body>
        <div class="container">
        <table>
            <tr>
            <th>course ID</th>
            <th>Course Time</th>
            <th>Course Name</th>
            <th>Course Description</th>
            <th>create At</th>
            <th></th>
            <th></th>
            </tr>
            <tr>
            <%  ArrayList<Course> arr = Course.getCourses();
                for(int i = 0; i < arr.size(); i++) {
            %>
            <td><%=arr.get(i).getId()%></td>
            <td><%=arr.get(i).getCourseTime()%></td>
            <td><%=arr.get(i).getName()%></td>
            <td><%=arr.get(i).getDescription()%></td>
            <td><%=arr.get(i).getCreateAt()%></td>
            <td><a href="edit?id=<%=arr.get(i).getId()%>">Edit</a></td>
            <td><a href="course?id=<%=arr.get(i).getId()%>">Delete</a></td>
        </tr>
            <%}%>
        </table>
        <a href="add"><input type="button" value="Add Course"/></a>
        </div>
    </body>
</html>
