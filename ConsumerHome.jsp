<%-- 
    Document   : ConsumerHome
    Created on : Aug 19, 2015, 9:22:37 AM
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
            /* 
             * To change this template, choose Tools | Templates
             * and open the template in the editor.
             */
            function reg(e)
            {

                // alert("hai iam working");
                //var id = document.getElementById('id').value;
                // var name = document.getElementById('name').value;
                //var evame = document.getElementById('evname').value;
                //var date = document.getElementById('date').value;
                // var mobile = document.getElementById('mobile').value;
                var re5digit = /^\d{10}$/ //regular expression defining a 5 digit number
                var email = /^([0-9a-zA-Z]([-\.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$/;
                var fileforamt = /^.*\.(jpg|JPG)$/;
                var mobile = /(7|8|9)\d{9}/;
                var url = document.getElementById('url').value;
                var re = /^(http[s]?:\/\/){0,1}(www\.){0,1}[a-zA-Z0-9\.\-]+\.[a-zA-Z]{2,5}[\.]{0,1}/;
                if (document.getElementById('file').files.length == 0)
                {
                    alert("Must be upload your ad");
                    return false;
                }
                else if (document.signup.file.value.search(fileforamt) == -1)
                {//if match failed
                    alert("Please Check Your File Format, Accept Only(.jpg) images");
                    return false;
                }
                else if (document.getElementById('tag').value.trim() == "")
                {
                    alert("Enter About this ad");
                    return false;
                }
                else if (document.getElementById('user').selectedIndex == 0)
                {
                    alert("Select to user to post add");
                    return false;
                }
                else if (document.getElementById('url').value.trim() == "")
                {
                    alert("Enter the ad URL");
                    return false;

                }

                else if (!re.test(url)) {
                    alert("Please type valid Url (like..https://www.google.co.in/)");
                    return false;
                }

                alert("Successfully Ad Posted");
                return  true;
            }
        </script>
    </head>

</head>
<body>
    <!-- start header -->
    <div class="header_bg">
        <div class="wrap">
            <div class="header">
                <div class="logo">
                    <h1><a href=""><img src="images/logo.png" alt=""/></a></h1>
                </div>
                <div class="h_right">
                    <ul class="menu">
                        <li class="active"><a href="">home</a></li>
                        <li><a href="postad.jsp">Posted Ads</a></li>
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
                <img src="consumerphoto.jsp?id=<%=session.getAttribute("owner")%>" height="60" width="80" style="border: 1px solid black">
                <h2>Welcome,<%=session.getAttribute("owner")%></h2>
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
                                <form action="consumerupload" name="signup" method="post" enctype="multipart/form-data" onsubmit="return reg(this)">
                                    <input type="hidden" name="owner" value="<%=session.getAttribute("owner")%>">
                                    Post Your Ad<br>
                                    <input type="file" style="border:  2px solid #7ACBE6;color: black;font-family: cursive;font-size: large;padding: 6px;width: 232px;margin-top: 20px" name="file" id="file"><br>
                                    <textarea placeholder="About this Ad" name="tag" style="width: 238px; height: 67px; margin-top: 20px;" id="tag"></textarea><br>

                                    <%
                                        try {
                                            Connection connection = null;
                                            // String stoler
                                            Statement statement, statement1 = null;
                                            ResultSet resultSet1, resultSet2, resultSet3;
                                            Class.forName("com.mysql.jdbc.Driver");
                                            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/data leakage", "root", "admin");
                                            String sql = "select * from register";
                                            statement = connection.createStatement();
                                            statement1 = connection.createStatement();
                                            resultSet1 = statement.executeQuery(sql);
                                            System.out.println(resultSet1);


                                    %>

                                    <select name="userid" style="border:  2px solid #7ACBE6;color: black;font-family: cursive;font-size: large;padding: 6px;width: 248px;margin-top: 20px" id="user">
                                        <option>Select Want to share</option> 
                                        <%
                                            while (resultSet1.next()) {
                                        %>
                                        <option><%=resultSet1.getString("mail")%></option> 
                                        <%

                                            }
                                        %>

                                    </select><br>
                                    <input type="text" name="url" id="url" style="border:  2px solid #7ACBE6;color: black;font-family: cursive;font-size: large;padding: 6px;width: 232px;margin-top: 20px" placeholder="Enter add URL"><br>
                                    <% } catch (Exception e) {
                                            out.println(e);
                                        }

                                    %>
                                    <span><a href=""><input type="submit" value="Post your Ad" style="font-weight: 600;float: right;border: medium none;outline: medium none;display: inline-block;padding: 12px 30px;font-size: 0.8925em;color: #FFF;background: #19BD9B none repeat scroll 0% 0%;text-transform: uppercase;border-radius: 2px;transition: all 0.3s ease-in-out 0s;margin-left: 11px;cursor: inherit;margin-top: 20px;position:absolute "></a></span>
                                </form>
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
                                                <%
                                                    try {
                                                        Connection connection = null;
                                                        // String stoler
                                                        Statement statement = null;
                                                        ResultSet resultSet1, resultSet2, resultSet3;
                                                        Class.forName("com.mysql.jdbc.Driver");
                                                        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/data leakage", "root", "admin");
                                                        String sql = "select * from ad where owner='" + session.getAttribute("owner") + "'";
                                                        statement = connection.createStatement();
                                                        resultSet1 = statement.executeQuery(sql);
                                                        System.out.println(resultSet1);
                                                        while (resultSet1.next()) {

                                                %>

                                                <%                                                            }
                                                    } catch (Exception e) {
                                                        out.println(e);
                                                    }
                                                %>
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
                <div class="span_of_4">



                    <div class="clear"></div>
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