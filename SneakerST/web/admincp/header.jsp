<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Admin CP</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--Include Libary CSS-->
    <link href="/sneakerst/css/bootstrap.min.css" rel="stylesheet">
    <link href="/sneakerst/css/font-awesome.min.css" rel="stylesheet">
    <link href="/sneakerst/css/admincp.css" rel="stylesheet">
    <link href="/sneakerst/plugins/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">
    <link href="/sneakerst/plugins/datatables-responsive/dataTables.responsive.css" rel="stylesheet">
    <link href="/sneakerst/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">
</head>
<body>
    <%if (session.getAttribute("userCP") != null) {%>
    <div id="wrapper">
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href=".">SNEAKERST CONTROL PANEL</a>
            </div>
            <ul class="nav navbar-top-links navbar-right"> 
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="logout"><i class="fa fa-sign-out fa-fw"></i>Logout</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                            <a href="/sneakerst/admincp"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-shopping-cart fa-fw"></i> Order<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="#"> View All Order</a>
                                </li>
                                <li>
                                    <a href="#"> Add New Order</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-product-hunt fa-fw"></i> Stock<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="/sneakerst/admincp/productmanagement.jsp"> Product Management</a>
                                </li>
                                <li>
                                    <a href="/sneakerst/admincp/addproduct.jsp"> Add Product</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-cubes fa-fw"></i> Category<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="/sneakerst/admincp/categorymanagement.jsp"> Category Management</a>
                                </li>
                                <li>
                                    <a href="/sneakerst/admincp/addcategory.jsp"> Add Product</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-feed fa-fw"></i> Feedback<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="./feedbackmanagement.jsp"> Feedback Management</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
    <script src="/sneakerst/js/jquery.min.js"></script>
    <script src="/sneakerst/js/bootstrap.min.js"></script>
    <script src="/sneakerst/js/admincp.js"></script>
    <script src="/sneakerst/plugins/metisMenu/metisMenu.js"></script>
    <script src="/sneakerst/plugins/datatables/js/jquery.dataTables.min.js"></script>
    <script src="/sneakerst/plugins/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="/sneakerst/plugins/datatables-responsive/dataTables.responsive.js"></script>
    <%}%>
