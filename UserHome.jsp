<%-- 
    Document   : UserHome
    Created on : Aug 17, 2015, 4:40:52 PM
    Author     : sivakumar
--%>
<%@page import="getname.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>

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


                if (document.getElementById('tag').value.trim() == "")
                {
                    alert("Enter your tag");
                    return false;

                }
                else if (document.getElementById('file').files.length == 0)
                {
                    alert("Must be upload your photo");
                    return false;
                }
                else if (document.signup.file.value.search(fileforamt) == -1)
                {//if match failed
                    alert("Please Check Your File Format, Accept Only(.jpg) images");
                    return false;
                }

                alert("Successfully uploaded your tag");

                return  true;
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
                            <li class="active"><a>home</a></li>
                            <li><a href="Notification.jsp">Notification</a></li>
                            <li><a href="Friends.jsp">Friends</a></li>
                            <li><a href="sharefiles.jsp">Shared Tag</a></li>
                            <li><a href="logout.jsp">Logout</a></li>
                        </ul>
                        <div id="sb-search" class="sb-search">
                            <form action="Search.jsp">
                                <input class="sb-search-input" placeholder="Enter your search term..." type="text" value="" name="search" id="search" style="color:black">
                                <input class="sb-search-submit" type="submit" value="">
                                <span class="sb-icon-search"></span>
                            </form>
                        </div>
                        <script src="js/classie.js"></script>
                        <script src="js/uisearch.js"></script>
                        <script>
            new UISearch(document.getElementById('sb-search'));
                        </script>
                        <!-- start smart_nav * -->
                        <nav class="nav">
                            <ul class="nav-list">
                                <li class="nav-item"><a href="index.html">Home</a></li>
                                <li class="nav-item"><a href="Notification.jsp">Notification</a></li>
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
        <%
            name n = new name();
            consumername c = new consumername();
            try {

                Connection connection = null;
                // String stoler
                Statement statement, statement1 = null;
                ResultSet resultSet1, resultSet2, resultSet3;
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/data leakage", "root", "admin");
                String sql = "select * from userupload where userid='" + session.getAttribute("userid") + "'";
                String ad = "select * from ad where userid='" + session.getAttribute("userid") + "'";
                statement = connection.createStatement();
                statement1 = connection.createStatement();
                resultSet1 = statement.executeQuery(sql);
                System.out.println(resultSet1);


        %>
        <!-- start main -->
        <div class="main_bg">
            <div class="wrap">
                <div class="main">
                    <div class="content">
                        <!-- start blog_left -->

                        <div class="blog_left"style="height: 1059px;overflow-y: auto">	
                            <%
                                while (resultSet1.next()) {
                            %>
                            <div class="blog_main">	

                                <div class="b_left">
                                    <img src="retrive.jsp?id=<%=session.getAttribute("userid")%>" height="60" width="80" style="border: 1px solid black">
                                </div>
                                <div class="b_right">
                                    <h4><%=n.rsiva(session.getAttribute("userid").toString())%></h4>
                                    <div class="blog_list">             
                                        <ul>
                                            <li><a href="#"> <i class="date"> </i><span><%=resultSet1.getString("time")%></span></a></li>



                                        </ul>
                                        <div class="clear"></div>
                                    </div>

                                </div>
                                <h4><%=resultSet1.getString("tag")%></h4>
                                <div class="clear"></div>
                                <img src="image.jsp?id=<%=resultSet1.getString("id")%>" alt=""/>

                                <a class="btn" href="share.jsp?id=<%=resultSet1.getString("id")%>">Share this</a>
                            </div>
                            <br><br>
                            <%

                                }
                                resultSet2 = statement.executeQuery(ad);
                                while (resultSet2.next()) {
                            %>
                            <div class="blog_main">	

                                <div class="b_left">
                                    <img src="consumerphoto.jsp?id=<%=resultSet2.getString("owner")%>" height="60" width="80" style="border: 1px solid black">
                                </div>
                                <div class="b_right">
                                    <h4><%=c.rsiva(resultSet2.getString("owner"))%></h4>
                                    <div class="blog_list">             
                                        <ul>
                                            <li><a href="#"> <i class="date"> </i><span><%=resultSet2.getString("time")%></span></a></li>
                                                <%
                                                    if (resultSet2.getString("verify").equals("1")) {
                                                %>
                                            <li style="margin-top: 20px"><i class="v"><img src="verify.png" style="height: 20px; width: 20px "></i><span></span></li>
                                                    <%                                        } else {
                                                    %>

                                            <li style="margin-top: 20px"><i class="v"><img src="warning.jpg" style="height: 20px; width: 20px "></i><span></span></li>
                                                    <%                                                        }
                                                    %>

                                        </ul>
                                        <div class="clear"></div>
                                    </div> 

                                </div>
                                <h4><%=resultSet2.getString("tag")%></h4>
                                <div class="clear"></div>
                                <br><br>
                                <%
                                    if (resultSet2.getString("verify").equals("1")) {
                                %>
                                <a href="<%=resultSet2.getString("url")%>"><img src="addisplay.jsp?id=<%=resultSet2.getString("id")%>" alt=""/></a>
                                    <%
                                    } else {
                                    %>
                                <a href="javascript:void(0)"><img src="addisplay.jsp?id=<%=resultSet2.getString("id")%>" alt=""/></a>
                                    <%
                                        }
                                    %>
                            </div>


                            <%                                }
                            %>
                        </div>
                        <%

                            } catch (Exception e) {
                                out.println(e);
                            }
                        %>
                        <!-- start blog_sidebar -->
                        <div class="blog_sidebar">
                            <div class="sidebar">
                                <!-- start social_network_likes -->
                                <div class="social_network_likes" style="border:1px solid #19BD9B">
                                    <ul>
                                        <form action="userupload" name="signup" method="post"  enctype="multipart/form-data" onsubmit="return reg(this)">
                                            Upload your Tag
                                            <input type="hidden" value="<%=session.getAttribute("userid")%>" name="userid">
                                            <input type="file" id="file" name="file" style="border:  2px solid #7ACBE6;color: black;font-family: cursive;font-size: large;padding: 6px;width: 232px;margin-top: 20px">
                                            <textarea id="tag" placeholder="About this tag" name="tag" style="width: 238px; height: 67px; margin-top: 20px;"></textarea>

                                            <span><a href=""><input type="submit" value="Upload new Tag" style="font-weight: 600;float: right;border: medium none;outline: medium none;display: inline-block;padding: 12px 30px;font-size: 0.8925em;color: #FFF;background: #19BD9B none repeat scroll 0% 0%;text-transform: uppercase;border-radius: 2px;transition: all 0.3s ease-in-out 0s;margin-left: 0px;cursor: inherit;margin-top: 20px"></a></span>

                                            <div class="clear"> </div>
                                        </form>
                                    </ul>
                                    <br> <br>
                                </div>
                                <!-- start sap_tabs -->
                                <div class="sap_tabs">	
                                    <div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
                                        <ul class="resp-tabs-list" style="width: 1000px">
                                            <li class="resp-tab-item" aria-controls="tab_item-0" role="tab" style="cursor: default"><span>Friends</span></li>

                                            <div class="clear"></div>
                                        </ul>				  	 
                                        <div class="resp-tabs-container">
                                            <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
                                                <div class="facts">
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
                                                            resultSet1 = statement.executeQuery(sql);
                                                            System.out.println(resultSet1);
                                                            while (resultSet1.next()) {

                                                    %>
                                                    <ul class="tab-left">
                                                        <span class="tab-img"><img src="retrive.jsp?id=<%=resultSet1.getString("fromid")%>" alt=""/></span>
                                                        <div class="tab-text">

                                                            <div class="post-meta">
                                                                <p style="margin-top: 20px"><%=resultSet1.getString("name")%></a></p>
                                                            </div>
                                                        </div>
                                                        <div class="clear"></div>
                                                    </ul>	
                                                    <%                                        }
                                                        resultSet2 = statement.executeQuery(sql1);
                                                        while (resultSet2.next()) {
                                                    %>
                                                    <ul class="tab-left">
                                                        <span class="tab-img"><img src="retrive.jsp?id=<%=resultSet2.getString("toid")%>" alt=""/></span>
                                                        <div class="tab-text">

                                                            <div class="post-meta">
                                                                <p style="margin-top:20px"><a href="#"><%=n.rsiva(resultSet2.getString("toid"))%></a></p>
                                                            </div>
                                                        </div>
                                                        <div class="clear"></div>
                                                    </ul>	
                                                    <%
                                                            }
                                                        } catch (Exception e) {
                                                            out.println(e);
                                                        }
                                                    %>
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