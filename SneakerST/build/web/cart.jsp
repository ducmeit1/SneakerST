<%-- 
    Document   : product
    Created on : Oct 11, 2016, 11:18:50 AM
    Author     : DUCHTSE61924
--%>

<%@page import="client.model.CartItem"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <jsp:include page="header.jsp"></jsp:include> 
        <head>
            <link href="plugins/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">
            <link href="plugins/datatables-responsive/dataTables.responsive.css" rel="stylesheet">
        </head>
        <section id="breadcrumb">
            <div class="bg parallax text-white" data-stellar-background-ratio="0.5" style="background-image: url(img/adidas-bg.jpg);">
                <div class="cover"></div>
                <div class="container">
                    <div class="text-center wow fadeInDown" data-wow-delay="0.4s">
                        <h2 class="small_h2">Shopping Cart</h2>
                        <hr class="star-primary">
                        <ol class="breadcrumb">
                            <li><a href=".">Home</a></li>
                            <li class="active">Shopping Cart</li>
                        </ol>
                    </div>
                </div> 
            </div>
        </section>
        <section id="contain_cart">
            <div class="container">
                <div class="row"><%if (session.getAttribute("shopping_cart") == null) {%>
                <div class="col-lg-12">
                    <h1>Your cart is empty!</h1>
                    <%} else {%>
                    <h1><%=request.getAttribute("msg-client") != null ? request.getAttribute("msg-client") : "List Item"%></h1>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Your Cart List
                        </div>
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>Thumb</th>
                                        <th>ID</th>
                                        <th>Name</th>
                                        <th>Category</th>
                                        <th>Gender</th>
                                        <th>Size</th>
                                        <th>Quantity</th>
                                        <th>Price</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%ArrayList<CartItem> cartList = (ArrayList<CartItem>) session.getAttribute("shopping_cart");
                                        for (CartItem c : cartList) {%>
                                    <tr>
                                        <td><a href="cart?action=remove&id=<%=c.getProductID()%>&size=<%=c.getSizeName()%>"><i class="fa fa-close fa-fw" style="margin-right: 5px"></i></a><img src="<%=c.getImageURL()%>" class="img-centered img-cart"></td>
                                        <td><%=c.getProductID()%></td>
                                        <td><%=c.getProductName()%></td>
                                        <td><%=c.getCategoryName()%></td>
                                        <td><%=c.getProductGender()%></td>
                                        <td>US <%=c.getSizeName()%></td>
                                        <td><a href="cart?action=up&id=<%=c.getProductID()%>&size=<%=c.getSizeName()%>"><i class="fa fa-plus fa-fw" style="margin-right: 5px"></i></a><%=c.getQuantity()%><a href="cart?action=down&id=<%=c.getProductID()%>&size=<%=c.getSizeName()%>"><i class="fa fa-minus fa-fw" style="margin-left: 5px"></i></a></td>
                                        <td><%=c.getQuantity() * c.getProductPrice()%> $</td>
                                    </tr>
                                    <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12">
                    <%float sum = 0;
                    for (CartItem c : cartList) {
                        sum+= c.getProductPrice() * c.getQuantity();
                    }%>
                    <h1 class="pull-left">Total: <%=String.format("%.2f USD", sum)%></h1>
                    <a href="checkout.jsp" class="pull-right btn btn-primary btn-lg">CHECK OUT <i class="fa fa-shopping-cart fa-x2"></i></a>
                </div>
                <%}%>
            </div>
        </div>
    </section>
    <jsp:include page="footer.jsp"></jsp:include>
    <script src="plugins/datatables/js/jquery.dataTables.min.js"></script>
    <script src="plugins/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="plugins/datatables-responsive/dataTables.responsive.js"></script>
    <script>
        $(document).ready(function () {
            $('#dataTables-example').DataTable({
                responsive: true
            });
        });</script>
</body>
</html>
