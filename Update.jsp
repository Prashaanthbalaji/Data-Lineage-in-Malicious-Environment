<%-- 
    Document   : Update
    Created on : 20 Mar, 2016, 4:41:03 PM
    Author     : VAIO Local
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
            try
            {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/data leakage", "root", "admin");
                    Statement st = con.createStatement();
                    ResultSet rs;
                    
                    String query = "update consumer set chk='1' where mail='"+request.getParameter("mail")+"'";
                    int i = st.executeUpdate(query);
                    response.sendRedirect("consumerip.jsp");
                     
            }
            catch(Exception e)
            {
             out. println(e);   
            }
        
        %>
    </body>
</html>
