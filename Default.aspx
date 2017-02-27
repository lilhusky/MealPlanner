<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="The description of my page" />
    <title>What's cooking?</title>
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <!-- SmartMenus jQuery Bootstrap Addon CSS -->
    <link href="css/jquery.smartmenus.bootstrap.css" rel="stylesheet">
    <link href="css/owl/owl.carousel.css" rel="stylesheet" type="text/css" />
    <link href="css/owl/owl.theme.css" rel="stylesheet" type="text/css" />
    <link href="css/owl/owl.transitions.css" rel="stylesheet" type="text/css" />
    <!-- Custom CSS -->
    <link href="css/1-col-portfolio.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Ubuntu:300,400,700' rel='stylesheet'
        type='text/css'>
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400italic,700italic,400,700"
        rel="stylesheet" type="text/css" />
    <!-- Required plugin - Animate.css -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.4.0/animate.min.css">
    <link href="fonts/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <!-- Header Navbar fixed top -->
        <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <asp:HyperLink runat="server" CssClass="navbar-brand" NavigateUrl="Login/Home.aspx"><i class="fa fa-cutlery"></i>&nbsp What's cooking?</asp:HyperLink>
                </div>

            </div>
        </div>

        <!-- Carousel -->
        <div id="carousel-example-generic" class="carousel slide carousel-fade" data-ride="carousel">
            <!-- Wrapper for slides -->
            <div class="carousel-inner">
                <div class="item active one">
                    <!--<img src="img/12.jpg" alt="" />-->
                    <div class="main-text hidden-xs">
                        <div class="col-md-12 text-center" dir="auto">
                            <h1>Live life with a little spice.</h1>
                            <div class="">
                                <asp:LinkButton ID="btnLogin" runat="server" CssClass="btn btn-clear btn-sm btn-min-block" href="/Modals/modalDefaultLogin.aspx" data-target="#myModal" data-toggle="modal">
                                    Login
                                </asp:LinkButton>

                                <asp:LinkButton ID="btnRegister" runat="server" CssClass="btn btn-clear btn-sm btn-min-block" data-target="#myModal" data-toggle="modal" href="/Modals/modalDefaultRegister.aspx">
                                    Register
                                </asp:LinkButton>


                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%-- Empty modal that will be filed in with data--%>
       
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content"></div>

            </div>
        </div>
   
        <!-- Carousel -->

        <footer id="fh5co-footer" class="padding100">
            <div>
                <p class="fh5co-copyright">
                    <small>&copy; 2017 Alexandra Mocan. All Rights Reserved.</small>
                </p>

            </div>
        </footer>
        <!-- jQuery -->
        <script src="js/jquery.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>
        <script src="js/wow.min.js" type="text/javascript"></script>
        <script src="css/owl/owl.carousel.js" type="text/javascript"></script>
        <!-- SmartMenus jQuery plugin -->
        <script type="text/javascript" src="js/jquery.smartmenus.js"></script>

        <!-- SmartMenus jQuery Bootstrap Addon -->
        <script type="text/javascript" src="js/jquery.smartmenus.bootstrap.js"></script>
        <script src="js/contact.js" type="text/javascript"></script>

    </form>
</body>
</html>
