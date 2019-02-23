<%-- 
    Document   : image
    Created on : Aug 18, 2015, 5:58:53 PM
    Author     : sivakumar
--%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"   %>
<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>MindDotEditor posted Data</title>
        <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
                <meta name="viewport" content="width=device-width, initial-scale=1">

                    <link href="../sample.css" rel="stylesheet" type="text/css" />
                    <link rel="shortcut icon" href="../fckeditor.gif" type="image/x-icon" />
                    </head>
                    <body>

                        <%
                            String url = "jdbc:mysql://localhost:3306/data leakage";
                            String id = request.getParameter("id");
                            Blob photo = null;

                            Connection con = null;
                            Statement stmt = null;
                            ResultSet rs = null;
                            try {
                                Class.forName("com.mysql.jdbc.Driver").newInstance();
                                con = DriverManager.getConnection(url, "root", "admin");
                                stmt = con.createStatement();
                                rs = stmt.executeQuery("SELECT file FROM register where mail='" + id + "'");
                                ServletOutputStream out1 = response.getOutputStream();
                                int i = 1;
                                if (rs.next()) {
                                    photo = rs.getBlob(1);
                                } else {
                                    response.setContentType("text/html");
                                    out.println("<html><head><title>Person Photo</title></head>");
                                    out.println("<body><h1>No photo found for id= 001 </h1></body></html>");
                                    return;
                                }
                                response.setContentType("image/gif");
                                InputStream in = photo.getBinaryStream();
                                int length = (int) photo.length();

                                int bufferSize = 1024;
                                byte[] buffer = new byte[bufferSize];

                                while ((length = in.read(buffer)) != -1) {
                                    System.out.println("writing " + length + " bytes");
                                    out1.write(buffer, 0, length);
                                }
                               
                                response.flushBuffer();

                            } catch (Exception ex) {
                                out.println(ex);
                            }
                        %>

                        <br>
                            <center><input type="button" value="Print" onclick="window.print();
                                    return false;"   />        </center>
                    </body>
                    </html>    