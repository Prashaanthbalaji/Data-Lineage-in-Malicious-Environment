<%-- 
    Document   : Home
    Created on : Aug 17, 2015, 3:26:04 PM
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
        <title>The Calm Website Template | Home :: w3layouts</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <!--  jquery plguin -->
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <!-- start gallery -->
        <script type="text/javascript" src="js/jquery.easing.min.js"></script>	
        <script type="text/javascript" src="js/jquery.mixitup.min.js"></script>
        <script type="text/javascript">
            $(function() {

                var filterList = {
                    init: function() {

                        // MixItUp plugin
                        // http://mixitup.io
                        $('#portfoliolist').mixitup({
                            targetSelector: '.portfolio',
                            filterSelector: '.filter',
                            effects: ['fade'],
                            easing: 'snap',
                            // call the hover effect
                            onMixEnd: filterList.hoverEffect()
                        });

                    },
                    hoverEffect: function() {

                        // Simple parallax effect
                        $('#portfoliolist .portfolio').hover(
                                function() {
                                    $(this).find('.label').stop().animate({bottom: 0}, 200, 'easeOutQuad');
                                    $(this).find('img').stop().animate({top: -30}, 500, 'easeOutQuad');
                                },
                                function() {
                                    $(this).find('.label').stop().animate({bottom: -40}, 200, 'easeInQuad');
                                    $(this).find('img').stop().animate({top: 0}, 300, 'easeOutQuad');
                                }
                        );

                    }

                };

                // Run the show!
                filterList.init();

            });
        </script>
        <!-- Add fancyBox main JS and CSS files -->
        <link href="themes/6/js-image-slider.css" rel="stylesheet" type="text/css" />
        <script src="themes/6/mcVideoPlugin.js" type="text/javascript"></script>
        <script src="themes/6/js-image-slider.js" type="text/javascript"></script>
        <link href="generic.css" rel="stylesheet" type="text/css" />
        <link href="css/magnific-popup.css" rel="stylesheet" type="text/css">
        <script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
        <script>
            $(document).ready(function() {
                $('.popup-with-zoom-anim').magnificPopup({
                    type: 'inline',
                    fixedContentPos: false,
                    fixedBgPos: true,
                    overflowY: 'auto',
                    closeBtnInside: true,
                    preloader: false,
                    midClick: true,
                    removalDelay: 300,
                    mainClass: 'my-mfp-zoom-in'
                });
            });
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
                            <li class="active"><a href="">home</a></li>
                            <li><a href="Login.jsp">User login</a></li>
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
                                <li class="nav-item" style="color:black "><a href="index.html">Home</a></li>
                                <li class="nav-item" style="color: black"><a href="about.html">About</a></li>
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
                <div class="header_btm">


                    <div class="clear"></div>
                </div>
            </div>
        </div>
        <!-- start main -->
        <div class="main_bg" style="background: #DAE7E9 none repeat scroll 0% 0%">
            <div class="wrap">
                <div class="main">
                    <!-- start popup -->
                    <div id="small-dialog" class="mfp-hide">
                        <div class="pop_up">
                            <h2>Lorem Ipsum is simply dummy text of the printing and industry</h2>
                            <img src="images/zoom.jpg" title="image-name">
                            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic</p>
                            <a class="btn" href="details.html">Read more</a>
                        </div>
                    </div>
                    <!-- end popup -->
                    <!-- start gallery  -->
                    <div class="container">

                        <div id="portfoliolist">

                            <div id="sliderFrame">
                                <div id="slider"  style="height: 347px; width: 959px;margin-left:-118px ">
                                    <a>
                                        <img src="images/img1.jpg" alt="Welcome to Menucool Video Slider" style="height: 347px; width: 959px" />
                                    </a>

                                    <a >
                                        <img src="images/img2.jpg" alt="Welcome to Menucool Video Slider" style="height: 347px; width: 959px" />
                                    </a>
                                    <a >
                                        <img src="images/img3.jpg" alt="Welcome to Menucool Video Slider" style="height: 347px; width: 959px" />
                                    </a>
                                    <a >
                                        <img src="images/img4.jpg" alt="Welcome to Menucool Video Slider" style="height: 347px; width: 959px" />
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div><!-- end container -->
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
        </div>   </body>
</html>