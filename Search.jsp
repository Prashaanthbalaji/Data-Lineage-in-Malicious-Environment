<%-- 
    Document   : Search
    Created on : Aug 18, 2015, 9:09:32 AM
    Author     : sivakumar
--%>


<%@page import="java.lang.String"%>
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
    </head>
    <body>
        <!-- start header -->
        <div class="header_bg">
            <div class="wrap">
                <div class="header">
                    <div class="logo">
                        <h1><a ><img src="images/logo.png" alt=""/></a></h1>
                    </div>
                    <div class="h_right">
                        <ul class="menu">
                            <li class="active"><a href="UserHome.jsp">home</a></li>
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
                                <%
                                    getname.friendchk frd = new getname.friendchk();
                                    getname.friendchk1 frd1 = new getname.friendchk1();
                                    int chk;
                                    try {
                                        Connection connection = null;
                                        // String stoler
                                        Statement statement, statement1, statement2, statement3 = null;
                                        ResultSet resultSet1, resultSet2, resultSet3, resultSet4;
                                        Class.forName("com.mysql.jdbc.Driver");
                                        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/data leakage", "root", "admin");
                                        String sql = "select * from register where name like '%" + request.getParameter("search") + "%'";

                                        statement = connection.createStatement();
                                        resultSet1 = statement.executeQuery(sql);
                                        System.out.println(resultSet1);
                                        while (resultSet1.next()) {


                                %>
                                <div style="height: 50px;width: 50px;">
                                    <form action="friend" method="post" >
                                        <table>
                                            <tr>
                                                <td><img src="retrive.jsp?id=<%=resultSet1.getString("mail")%>" height="60" width="50" style="border: 1px solid black;height: 103px;width: 123px"></td>
                                                <td style="alignment-adjust: central;position: absolute"><h2 style="margin-left: 66px;margin-top:-69px"><%=resultSet1.getString("name")%></h2></td>
                                            <input type="hidden" value="<%=resultSet1.getString("mail")%>" name="toid">
                                            <input type="hidden" value="<%=request.getParameter("search")%>" name="search">
                                            <input type="hidden" value="<%=session.getAttribute("userid")%>" name="fromid">
                                            <input type="hidden" name="name" value="<%=session.getAttribute("name")%>">
                                            <%
                                                String mail = resultSet1.getString("mail").toString();
                                                System.out.println(mail);
                                                String sesString = (String) session.getAttribute("userid");
                                                int chk1 = frd.rsiva(resultSet1.getString("mail"), sesString);

                                                if (chk1 == 1) {
                                                    statement3 = connection.createStatement();
                                                    String sql1 = "select * from friend where fromid='" + resultSet1.getString("mail") + "' and toid='" + sesString + "' and chk=0 ";
                                                    resultSet4 = statement3.executeQuery(sql1);
                                                     int frdchk = 0;
                                                    if(resultSet4.next()) {
                                                        frdchk++;
                                                    }
                                                    if (frdchk == 1) {
                                            %>
                                            <td style="position: absolute"><span><a><input type="" value="Accept Pending" style="font-weight: 600;float: right;border: medium none;outline: medium none;display: inline-block;padding: 12px 30px;font-size: 0.8925em;color: #FFF;background: #E1706C  none repeat scroll 0% 0%;text-transform: uppercase;border-radius: 2px;transition: all 0.3s ease-in-out 0s;margin-left: 262px;cursor: inherit;margin-top: -77px;width: 186px"></a></span></td>
                                                        <%                                                         } else {
                                                        %>
                                            <td style="position: absolute"><span><a><input type="" value="Friend Requset sent " style="font-weight: 600;float: right;border: medium none;outline: medium none;display: inline-block;padding: 12px 30px;font-size: 0.8925em;color: #FFF;background: #BCC018 none repeat scroll 0% 0%;text-transform: uppercase;border-radius: 2px;transition: all 0.3s ease-in-out 0s;margin-left: 262px;cursor: inherit;margin-top: -77px;width: 186px"></a></span></td>
                                                        <%                                                            }
                                                        } else {
                                                            int chk2 = 0;
                                                            statement1 = connection.createStatement();
                                                            statement2 = connection.createStatement();

                                                            String rqchk = "select * from friend where toid='" + resultSet1.getString("mail") + "' and fromid='" + sesString + "' and chk=1 ";
                                                            String rqchk1 = "select * from friend where fromid='" + resultSet1.getString("mail") + "' and toid='" + sesString + "' and chk=1 ";
                                                            resultSet2 = statement1.executeQuery(rqchk);
                                                            resultSet3 = statement2.executeQuery(rqchk1);
                                                            if (resultSet2.next()) {
                                                                chk2++;
                                                            } else if (resultSet3.next()) {
                                                                chk2++;
                                                            }
                                                            if (chk2 == 1) {
                                                        %>
                                            <td style="position: absolute"><span><a><input type="" value="Already friend" style="font-weight: 600;float: right;border: medium none;outline: medium none;display: inline-block;padding: 12px 30px;font-size: 0.8925em;color: #FFF;background: #25B927 none repeat scroll 0% 0%;text-transform: uppercase;border-radius: 2px;transition: all 0.3s ease-in-out 0s;margin-left: 262px;cursor: inherit;margin-top: -77px"></a></span></td>
                                                        <%                                                        } else {
                                                        %> 
                                            <td style="position: absolute"><span><a href=""><input type="submit" value="Sent friend requset" style="font-weight: 600;float: right;border: medium none;outline: medium none;display: inline-block;padding: 12px 30px;font-size: 0.8925em;color: #FFF;background: #19BD9B none repeat scroll 0% 0%;text-transform: uppercase;border-radius: 2px;transition: all 0.3s ease-in-out 0s;margin-left: 262px;cursor: inherit;margin-top: -77px"></a></span></td>
                                                        <%                                                    }
                                                            }
                                                        %>   
                                            </td>    
                                            </tr>
                                        </table>
                                    </form>

                                </div>
                                <br><br><br><br>
                                <%                                        }

                                    } catch (Exception e) {
                                        out.println(e);
                                    }
                                %>
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
                                        <ul class="resp-tabs-list">

                                        </ul>				  	 
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
        </div>    </body>
</html>