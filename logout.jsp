<%-- 
    Document   : logout.jsp
    Created on : Aug 20, 2015, 2:14:50 PM
    Author     : sivakumar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      <%
      session.invalidate();
      response.sendRedirect("Home.jsp");
      
      %>
    </body>
</html>
