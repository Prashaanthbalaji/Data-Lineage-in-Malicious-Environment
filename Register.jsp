<%-- 
    Document   : Register
    Created on : Aug 17, 2015, 3:47:21 PM
    Author     : sivakumar
--%>
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
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600' rel='stylesheet' type='text/css'>
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <!--  jquery plguin -->
        <script type="text/javascript" src="js/jquery.min.js"></script>
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
                var plengh = document.getElementById('pass').value;

                if (document.getElementById('rtype').selectedIndex == 0)
                {
                    alert("Select your Register type");
                    return false;
                }

                if (document.getElementById('name').value.trim() == "")
                {
                    alert("Enter your name");
                    return false;
                }
                else if (document.getElementById('email').value.trim() == "")
                {
                    alert("Enter Your Valid Email");
                    return false;
                }
                else if (document.signup.email.value.search(email) == -1)
                {//if match failed
                    alert("Please proper Email Address");
                    return false;
                }
                else if (document.getElementById('pass').value == "")
                {
                    alert("Enter your password");
                    return false;
                }
                else if (plengh.length !== 6)
                {
                    alert("Password length should be in 6  characters");
                    return false;
                }
                else if (document.getElementById('mobile').value.trim() == "")
                {
                    alert("Enter your mobile number");
                    return false;
                }
                else if (document.signup.mobile.value.search(mobile) == -1)
                {//if match failed
                    alert("Please proper Mobile number");
                    return false;
                }
                else if (document.getElementById('address').value.trim() == "")
                {
                    alert("Enter your Address");
                    return false;

                }
                else if (document.getElementById('sig').value.trim() == "")
                {
                    alert("Enter your signature");
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
                alert("SucessFully Register");
                return  true;
            }
            function isNumber(evt)
            {

                evt = (evt) ? evt : window.event;
                var charCode = (evt.which) ? evt.which : evt.keyCode;
                if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                    return false;
                }
                return true;
            }
            function onlyAlphabets(e, t) {

                try {

                    if (window.event) {

                        var charCode = window.event.keyCode;
                        if (charCode == 32)
                        {
                            return true;
                        }
                    }

                    else if (e) {

                        var charCode = e.which;
                        //  alert(charCode);
                        if (charCode == 8 || charCode == 0 || charCode == 32)
                        {
                            return true;
                        }
                    }

                    else {
                        return true;
                    }

                    if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123))
                        return true;

                    else
                        return false;

                }

                catch (err) {

                    alert(err.Description);

                }

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
                            <li ><a href="Home.jsp">home</a></li>
                            <li><a href="Login.jsp">User login</a></li>
                            <li><a href="Consumerlogin.jsp">Consumer Login</a></li>
                            <li class="active"><a href="Register.jsp">Register</a></li>
                            <li><a href="Adminlogin.jsp ">Admin</a></li>

                        </ul><script src="js/classie.js"></script>
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
                                <div class="contact-form" style="margin-left: 46px">
                                    <form method="post" action="File_Upload" name="signup" enctype="multipart/form-data" onsubmit="return reg(this)">
                                        <select id="rtype"name="rtype" style="border:  2px solid #7ACBE6;color: black;font-family: cursive;font-size: large;padding: 6px;width: 371px;margin-top: 20px">
                                            <option>Select your Register type</option>
                                            <option>User</option>
                                            <option>Consumer</option>
                                        </select>
                                        <input type="text" class="textbox" name="name" id="name" placeholder="Enter your Name" style="border:  2px solid #7ACBE6;color: black;font-family: cursive;font-size: large;padding: 6px;width: 357px;margin-top: 20px" maxlength="20"onkeypress="return onlyAlphabets(event, this);">
                                        <input type="text" class="textbox" name="email" id="email" placeholder="Enter your Valid Email" style="border:  2px solid #7ACBE6;color: black;font-family: cursive;font-size: large;padding: 6px ;margin-top: 20px;width: 357px">
                                        <input type="password" class="textbox" name="pass" id="pass" placeholder="Enter your Password" style="border:  2px solid #7ACBE6;color: black;font-family: cursive;font-size: large;padding: 6px;width: 409px;margin-top: 20px;width: 357px" maxlength="8" >                                  
                                        <input type="text" class="textbox" name="mobile" id="mobile" placeholder="Enter your Mobile Number" style="border:  2px solid #7ACBE6;color: black;font-family: cursive;font-size: large;padding: 6px;width: 357px;margin-top: 20px" maxlength="10" onkeypress="return isNumber(event);">                                     
                                        <textarea placeholder="Enter Your Address" name="address" id="address" class="textbox" style="border: 2px solid #7ACBE6;color: black;font-family: cursive;font-size: large;padding: 6px;width: 357px;margin-top: 20px"></textarea>
                                        <input type="text" class="textbox" name="sig" id="sig" placeholder="Enter share signature" style="border:  2px solid #7ACBE6;color: black;font-family: cursive;font-size: large;padding: 6px;width: 357px;margin-top: 20px" maxlength="20"onkeypress="return onlyAlphabets(event, this);">
                                        <br> 
                                        Upload Your Photo<br>
                                        <input type="file" class="textbox" name="file" id="file" style="border:  2px solid #7ACBE6;color: black;font-family: cursive;font-size: large;padding: 6px;width: 357px;margin-top: 20px">
                                        <div><br></div>
                                        <%
                                        String ip=request.getHeader("X-FORWARDED-FOR");
                                        if(ip==null)
                                        {
                                            ip=request.getRemoteAddr();
                                        }
                                                
                                        %>
                                        <input type="hidden" value="<%=ip%>" name="ip">
                                        <input type="submit" value="Register Now" style="margin-left: 215px;position: absolute">
                                    </form>
                                    <div><br></div>
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