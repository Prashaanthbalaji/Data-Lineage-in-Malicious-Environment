<%-- 
    Document   : Login.jsp
    Created on : Aug 17, 2015, 3:31:51 PM
    Author     : sivakumar
--%>
<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
    <head>
        <title>The Calm Website Template | About :: w3layouts</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <!--  jquery plguin -->
        <script type="text/javascript" src="js/jquery.min.js"></script>
    </head>
    <body>
        <!-- start header -->
        <div class="header_bg">
            <div class="wrap">
                <div class="header">
                    <div class="logo">
                        <h1><a><img src="images/logo.png" alt=""/></a></h1>
                    </div>
                    <div class="h_right">
                        <ul class="menu">
                            <li><a href="Home.jsp">home</a></li>
                            <li class="active"><a href="Login.jsp">User login</a></li>
                            <li><a href="Consumerlogin.jsp">Consumer Login</a></li>
                            <li><a href="Register.jsp">Register</a></li>
                            <li><a href="Adminlogin.jsp ">Admin</a></li>

                        </ul>
                        <script src="js/classie.js"></script>
                        <script src="js/uisearch.js"></script>
                        <script>
                            new UISearch(document.getElementById('sb-search'));
                        </script>
                        <!-- start smart_nav * -->
                        <nav class="nav">
                            <ul class="nav-list">
                                <li class="nav-item"><a href="index.html">Home</a></li>
                                <li class="nav-item"><a href="about.html">About</a></li>
                                <li class="nav-item"><a href="portfolio.html">Portfolio</a></li>
                                <li class="nav-item"><a href="blog.html">Blog</a></li>
                                <li class="nav-item"><a href="contact.html">Contact</a></li>
                                <div class="clear"></div>
                            </ul>
                        </nav>
                        <script type="text/javascript" src="js/responsive.menu.js"></script>
                        <!-- end smart_nav * -->
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
        <!-- start slider -->
        <div class="slider_bg">
            <div class="wrap">
                <div class="slider">
                    <h2>Login Your Account</h2>
                    <h3>What we Think, get in touch</h3>
                </div>
            </div>
        </div>
        <!-- start main -->
        <div class="main_bg">
            <div class="wrap">
                <div class="main">
                    <div class="content">
                        <!-- start about -->
                        <div class="about">
                            <div class="cont-grid-img img_style">
                                <img src="images/about_pic.jpg" alt="">
                            </div>
                            <div class="cont-grid">
                                <div class="contact-form">
                                    <form action="login" method="post">
                                        <table style="margin-left: 79px;margin-top: 56px">
                                            <tr>
                                                <td>
                                                    <input type="text" name="user" placeholder="Enter your valid EMail-id" style="margin-left: 1px;width:330px;color: black;font-size: large;height:24px;border:  1px solid orange" required="" >
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <input type="password" name="pass"  placeholder="Enter Password" style="margin-left: 0px;width: 352px;color: black;font-size: large;height: 42px;margin-top: 20px;border:  1px solid orange" required=""><br><br>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <span>
                                                        <input type="submit" value="Login" style="height:44px;width: 137px">
                                                    </span>
                                                </td>
                                            </tr>
                                        </table>
                                    </form>
                                </div>
                            </div>
                            <div class="clear"></div>

                        </div>
                        <!-- end about -->
                    </div>
                </div>
            </div>
        </div>
        <div class="footer_bg">
            <div class="wrap">
                <div class="footer">

                    <div class="footer_top">
                        <div class="f_nav1">

                        </div>
                        <div class="copy">
                            <p class="link"><span>© All rights reserved <a>Data Lineage in Malicious Environments</a></span></p>
                        </div>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>
        </div> 
    </body>
</html>