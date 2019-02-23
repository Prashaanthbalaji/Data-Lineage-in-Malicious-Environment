<%-- 
    Document   : signature
    Created on : Aug 19, 2015, 3:56:28 PM
    Author     : sivakumar
--%>


<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
    <head>
        <title>The Calm Website Template | Blog :: w3layouts</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600' rel='stylesheet' type='text/css'>
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <script type="text/javascript">
            function user(e)
            { 
                if (document.getElementById('sig').value=="")
                {
                    alert("Must be enter the signature");
                    return false;
                }
                alert("sucessfully shared")
                return true;
            }
        </script>
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
                            <li><a href="UserHome.jsp">home</a></li>
                            <li><a href="Notification.jsp">Notification</a></li>
                            <li><a href="Friends.jsp">Friends</a></li>
                            <li class="active"><a href="sharefiles.jsp">Shared Tag</a></li>
                            <li><a href="logout.jsp">Logout</a></li>
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
                                <li class="nav-item"><a href="about.html">Notification</a></li>
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
                    <img src="retrive.jsp?id=<%=session.getAttribute("userid")%>" height="60" width="80" style="border: 1px solid black">
                    <h2>Welcome,<%=session.getAttribute("userid")%></h2>
                    <h3>What we Think, latest news</h3>
                </div>       
            </div>
        </div>
        <!-- start main -->
        <div class="main_bg">
            <div class="wrap">
                <div class="main">
                    <div class="content">
                        <!-- start blog_left -->
                        <div class="blog_left">		
                            <div class="blog_main">
                                <div style="margin-left: 213px">
                                    Enter Signature to Share<br>



                                    <%
                                        try {
                                            Connection connection = null;
                                            // String stoler
                                            Statement statement, statement1 = null;
                                            ResultSet resultSet1, resultSet2, resultSet3;
                                            Class.forName("com.mysql.jdbc.Driver");
                                            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/data leakage", "root", "admin");
                                            String sql = "select * from friend where toid='" + session.getAttribute("userid") + "' and chk=1";
                                            String sql1 = "select * from friend where fromid='" + session.getAttribute("userid") + "' and chk=1";
                                            statement = connection.createStatement();
                                            statement1 = connection.createStatement();
                                            resultSet1 = statement.executeQuery(sql);
                                            System.out.println(resultSet1);


                                    %>
                                    <form action="share" method="post" onsubmit="return user(this)">
                                        <input type="hidden" value="<%=request.getParameter("tag")%>" name="tag">
                                        <input type="hidden" value="<%=request.getParameter("id")%>" name="id">
                                        <input type="hidden" value="<%=request.getParameter("fromid")%>" name="fromid">
                                        <input type="hidden" value="<%=request.getParameter("toid")%>" name="toid">
                                        <input type="text" value="" style="border:  2px solid #7ACBE6;color: black;font-family: cursive;font-size: large;padding: 6px;width: 232px;margin-top: 20px" placeholder="Enter Signature to share" name="sig" id="sig"><br>
                                        <span><a href=""><input type="submit" value="share" style="font-weight: 600;float: right;border: medium none;outline: medium none;display: inline-block;padding: 12px 30px;font-size: 0.8925em;color: #FFF;background: #19BD9B none repeat scroll 0% 0%;text-transform: uppercase;border-radius: 2px;transition: all 0.3s ease-in-out 0s;margin-left: 11px;cursor: inherit;margin-top: 20px;position:absolute "></a></span>

                                    </form><br>
                                    <% } catch (Exception e) {
                                            out.println(e);
                                        }

                                    %>


                                    <div class="clear"> </div>
                                </div>

                            </div>
                            <br><br>

                        </div>
                        <!-- start blog_sidebar -->
                        <div class="blog_sidebar">
                            <div class="sidebar">
                                <!-- start social_network_likes -->

                                <!-- start sap_tabs -->
                                <div class="sap_tabs">	
                                    <div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">

                                        <div class="resp-tabs-container">
                                            <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
                                                <div class="facts">
                                                    <ul class="tab-left">
                                                        <span class="tab-img"><img src="images/tab_pic1.jpg" alt=""/></span>
                                                        <div class="tab-text">
                                                            <p><a href="#">Lorem ipsum dolor sitsad.</a></p>
                                                            <div class="post-meta">
                                                                <img src="images/date.png" alt=""><a href="#" class="date"> 21 March 2013</a>
                                                            </div>
                                                        </div>
                                                        <div class="clear"></div>
                                                    </ul>	
                                                    <ul class="tab-left">
                                                        <span class="tab-img"><img src="images/tab_pic2.jpg" alt=""/></span>
                                                        <div class="tab-text">
                                                            <p><a href="#">Lorem ipsum dolor sitsah.</a></p>
                                                            <div class="post-meta">
                                                                <img src="images/date.png" alt=""><a href="#" class="date"> 21 March 2013</a>
                                                            </div>
                                                        </div>
                                                        <div class="clear"></div>
                                                    </ul>	
                                                    <ul class="tab-left">
                                                        <span class="tab-img"><img src="images/tab_pic3.jpg" alt=""/></span>
                                                        <div class="tab-text">
                                                            <p><a href="#">Lorem ipsum dolor sitsah.</a></p>
                                                            <div class="post-meta">
                                                                <img src="images/date.png" alt=""><a href="#" class="date"> 21 March 2013</a>
                                                            </div>
                                                        </div>
                                                        <div class="clear"></div>
                                                    </ul>	
                                                    <ul class="tab-left">
                                                        <span class="tab-img"><img src="images/tab_pic4.jpg" alt=""/></span>
                                                        <div class="tab-text">
                                                            <p><a href="#">Lorem ipsum dolor sitsah.</a></p>
                                                            <div class="post-meta">
                                                                <img src="images/date.png" alt=""><a href="#" class="date"> 21 March 2013</a>
                                                            </div>
                                                        </div>
                                                        <div class="clear"></div>
                                                    </ul>			              
                                                </div>
                                            </div>	
                                            <div class="tab-2 resp-tab-content" aria-labelledby="tab_item-1">
                                                <div class="facts">
                                                    <ul class="tab-left">
                                                        <span class="tab-img"><img src="images/tab_pic5.jpg" alt=""/></span>
                                                        <div class="tab-text">
                                                            <p><a href="#">Lorem ipsum dolor sitsah.</a></p>
                                                            <div class="post-meta">
                                                                <img src="images/date.png" alt=""><a href="#" class="date"> 21 March 2013</a>
                                                            </div>
                                                        </div>
                                                        <div class="clear"></div>
                                                    </ul>	
                                                    <ul class="tab-left">
                                                        <span class="tab-img"><img src="images/tab_pic2.jpg" alt=""/></span>
                                                        <div class="tab-text">
                                                            <p><a href="#">Lorem ipsum dolor sitsah.</a></p>
                                                            <div class="post-meta">
                                                                <img src="images/date.png" alt=""><a href="#" class="date"> 21 March 2013</a>
                                                                <span class="author">Author: <a href="#">Lorem</a></span>
                                                            </div>
                                                        </div>
                                                        <div class="clear"></div>
                                                    </ul>	
                                                    <ul class="tab-left">
                                                        <span class="tab-img"><img src="images/tab_pic1.jpg" alt=""/></span>
                                                        <div class="tab-text">
                                                            <p><a href="#">Lorem ipsum dolor sitsah.</a></p>
                                                            <div class="post-meta">
                                                                <img src="images/date.png" alt=""><a href="#" class="date"> 21 March 2013</a>
                                                            </div>
                                                        </div>
                                                        <div class="clear"></div>
                                                    </ul>	
                                                    <ul class="tab-left">
                                                        <span class="tab-img"><img src="images/tab_pic4.jpg" alt=""/></span>
                                                        <div class="tab-text">
                                                            <p><a href="#">Lorem ipsum dolor sitsah.</a></p>
                                                            <div class="post-meta">
                                                                <img src="images/date.png" alt=""><a href="#" class="date"> 21 March 2013</a>
                                                            </div>
                                                        </div>
                                                        <div class="clear"></div>
                                                    </ul>			              
                                                </div>
                                            </div>				        					 
                                            <div class="tab-3 resp-tab-content" aria-labelledby="tab_item-2">
                                                <div class="facts">
                                                    <ul class="tab-left">
                                                        <span class="tab-img"><img src="images/tab_pic3.jpg" alt=""/></span>
                                                        <div class="tab-text">
                                                            <p><a href="#">Lorem ipsum dolor sitsah.</a></p>
                                                            <div class="post-meta">
                                                                <img src="images/date.png" alt=""><a href="#" class="date"> 21 March 2013</a>
                                                            </div>
                                                        </div>
                                                        <div class="clear"></div>
                                                    </ul>	
                                                    <ul class="tab-left">
                                                        <span class="tab-img"><img src="images/tab_pic1.jpg" alt=""/></span>
                                                        <div class="tab-text">
                                                            <p><a href="#">Lorem ipsum dolor sitsah.</a></p>
                                                            <div class="post-meta">
                                                                <img src="images/comment.png" alt=""><a href="#" class="comments"> 3 Comments</a>
                                                            </div>
                                                        </div>
                                                        <div class="clear"></div>
                                                    </ul>	
                                                    <ul class="tab-left">
                                                        <span class="tab-img"><img src="images/tab_pic3.jpg" alt=""/></span>
                                                        <div class="tab-text">
                                                            <p><a href="#">Lorem ipsum dolor sitsah.</a></p>
                                                            <div class="post-meta">
                                                                <img src="images/date.png" alt=""><a href="#" class="date"> 21 March 2013</a>
                                                            </div>
                                                        </div>
                                                        <div class="clear"></div>
                                                    </ul>	
                                                    <ul class="tab-left">
                                                        <span class="tab-img"><img src="images/tab_pic5.jpg" alt=""/></span>
                                                        <div class="tab-text">
                                                            <p><a href="#">Lorem ipsum dolor sitsah.</a></p>
                                                            <div class="post-meta">
                                                                <img src="images/date.png" alt=""><a href="#" class="date"> 21 March 2013</a>
                                                            </div>
                                                        </div>
                                                        <div class="clear"></div>
                                                    </ul>			              
                                                </div>           	      
                                            </div>	
                                        </div>	
                                    </div>	
                                </div>
                                <script src="js/jquery.min.js"></script>
                                <script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
                                <script type="text/javascript">
            $(document).ready(function() {
                $('#horizontalTab').easyResponsiveTabs({
                    type: 'default', //Types: default, vertical, accordion           
                    width: 'auto', //auto or any width like 600px
                    fit: true   // 100% fit in a container
                });
            });
                                </script>
                                <!-- end sap_tabs -->
                                <!-- start flicker images -->
                                <h4>Advertisement</h4>
                                <ul class="ads_nav">
                                    <li><a href="#"><img src="sidead.jpg" alt=""> </a></li>
                                    <li><a href="#"><img src="sidead1.jpg" alt=""> </a></li>
                                    <li><a href="#"><img src="sidead2.jpg" alt=""> </a></li>
                                    <li><a href="#"><img src="sidead3.jpg" alt=""> </a></li>
                                    <div class="clear"></div>
                                </ul>

                                <!-- start flicker images -->

                                <!-- start tag_nav -->

                                <!-- start news_letter -->

                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer_bg">
            <div class="wrap">
                <div class="footer">

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
            </div>
        </div>
    </div>
</body>
</html>