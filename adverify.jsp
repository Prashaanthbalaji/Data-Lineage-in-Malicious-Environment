<%-- 
    Document   : adverify
    Created on : Aug 19, 2015, 11:14:26 AM
    Author     : sivakumar
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String connectionURL = "jdbc:mysql://localhost:3306/data leakage";
            Connection connection = null;
            Statement st = null;
            ResultSet rs = null;

            try {
                // String name = request.getParameter("name");  
                String id = request.getParameter("id");
                connection = DriverManager.getConnection(connectionURL, "root", "admin");
                PreparedStatement pst = connection.prepareStatement("update ad set verify=? where id='" + id + "' ");//try2 is the name of the table  
                pst.setString(1, "1");
                int i = pst.executeUpdate();
                if (i != 0) {
                    response.sendRedirect("Adminhome.jsp");

                } else {
                }
            } catch (Exception e) {
                out.println(e);
            }


        %>
    </body>
</html>
