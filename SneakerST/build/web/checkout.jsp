<%-- 
    Document   : product
    Created on : Oct 11, 2016, 11:18:50 AM
    Author     : DUCHTSE61924
--%>

<%@page import="client.model.Customer"%>
<%@page import="client.model.CartItem"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%if (session.getAttribute("shopping_cart") == null) {
        response.sendRedirect("cart.jsp");
        return;
    }
    if (session.getAttribute("userCustomer") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
    <jsp:include page="header.jsp"></jsp:include> 
        <head>
            <link href="plugins/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">
            <link href="plugins/datatables-responsive/dataTables.responsive.css" rel="stylesheet">
        </head>
    <%ArrayList<Customer> userAccount = (ArrayList<Customer>) session.getAttribute("userCustomer");%>
    <section id="breadcrumb">
        <div class="bg parallax text-white" data-stellar-background-ratio="0.5" style="background-image: url(img/adidas-bg.jpg);">
            <div class="cover"></div>
            <div class="container">
                <div class="text-center wow fadeInDown" data-wow-delay="0.4s">
                    <h2 class="small_h2">Check Out</h2>
                    <hr class="star-primary">
                    <ol class="breadcrumb">
                        <li><a href=".">Home</a></li>
                        <li><a href="cart.jsp">Shopping Cart</a></li>
                        <li class="active">Check Out</li>
                    </ol>
                </div>
            </div> 
        </div>
    </section>
    <section id="contain_cart">
        <div class="container">
            <%if (session.getAttribute("shopping_cart") != null) {%>
            <div class="row">
                <div class="col-lg-12">
                    <h1><%=request.getAttribute("msg-client") != null ? request.getAttribute("msg-client") : "Check out"%></h1>
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
                                        <td><a href="cart?action=remove&id=<%=c.getProductID()%>"><i class="fa fa-close fa-fw" style="margin-right: 5px"></i></a><img src="<%=c.getImageURL()%>" class="img-centered img-cart"></td>
                                        <td><%=c.getProductID()%></td>
                                        <td><%=c.getProductName()%></td>
                                        <td><%=c.getCategoryName()%></td>
                                        <td><%=c.getProductGender()%></td>
                                        <td>US <%=c.getSizeName()%></td>
                                        <td><a href="cart?action=up&id=<%=c.getProductID()%>"><i class="fa fa-plus fa-fw" style="margin-right: 5px"></i></a><%=c.getQuantity()%><a href="cart?action=down&id=<%=c.getProductID()%>"><i class="fa fa-minus fa-fw" style="margin-left: 5px"></i></a></td>
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
                            sum += c.getProductPrice() * c.getQuantity();
                        }%>
                    <h3 class="pull-left">Total: <%=String.format("%.2f USD", sum)%></h3>
                </div>
            </div>
            <div class="row">
                <form action="checkout" method="post">
                    <div class="col-lg-6">
                        <h1>Billing Information</h1>
                        <input type="hidden" name="username" value="<%=userAccount.get(0).getUsername()%>">
                        <%for (Customer c : userAccount) {%>
                        <div class="form-group">
                            <label>First Name</label>
                            <input class="form-control" value="<%=c.getFirstname()%>" type="text" name="firstname" required="">
                        </div>
                        <div class="form-group">
                            <label>Last Name</label>
                            <input class="form-control" value="<%=c.getLastname()%>" type="text" name="lastname">
                        </div>
                        <div class="form-group">
                            <label>Email</label>
                            <input class="form-control" value="<%=c.getEmail()%>" type="text" name="email" required="">
                        </div>
                        <div class="form-group">
                            <label>Address</label>
                            <input class="form-control" value="<%=c.getAddress()%>" type="text" name="address" required="">
                        </div>
                        <div class="form-group">
                            <label>City</label>
                            <input class="form-control" value="<%=c.getCity()%>" type="text" name="city" required="">
                        </div>
                        <div class="form-group">
                            <label>State</label>
                            <input class="form-control" value="<%=c.getState()%>" type="text" name="state">
                        </div>
                        <div class="form-group">
                            <label>Country</label>
                            <input class="form-control" value="<%=c.getCountry()%>" type="text" name="country" required="">
                        </div>
                        <%}%>
                        <div class="form-group">
                            <label>Phone Number</label>
                            <input class="form-control" type="tel" name="phone" required="">
                        </div>
                        <div class="form-group">
                            <label>Payment By</label>
                            <br />
                            <label><input type="radio" name="payment" value="Visa" class="radio-inline">&nbsp;  Visa</label> &nbsp;
                            <label><input type="radio" name="payment" value="Mastercard" class="radio-inline">&nbsp;  Mastercard</label>
                        </div>
                        <div class="form-group payment">
                            <hr>
                            <h3>Payment Information</h3> <br/>
                            <label>Credit number</label>
                            <input class="form-control" name="creditnumber" type="text" required="">
                            <label>Credit Holder</label>
                            <input class="form-control" name="nameholder" type="text" required="">
                            <label>Valid Date</label> <br/>
                            <select name="month" id="month" required="" style="width: 100px"></select><select style="width: 100px" name="year" id="year" required=""></select>
                            <br />
                            <label>CCV</label>
                            <input class="form-control" type="password" name="ccv" required="">
                        </div>
                        <%}%>
                    </div>
                    <div class="col-lg-6">
                        <h1>Devliery Information</h1>
                        <%for (Customer c : userAccount) {%>
                        <div class="form-group">
                            <label>First Name</label>
                            <input class="form-control" value="<%=c.getFirstname()%>" type="text" name="dfirstname" required="">
                        </div>
                        <div class="form-group">
                            <label>Last Name</label>
                            <input class="form-control" value="<%=c.getLastname()%>" type="text" name="dlastname">
                        </div>
                        <div class="form-group">
                            <label>Address</label>
                            <input class="form-control" value="<%=c.getAddress()%>" type="text" name="daddress" required="">
                        </div>
                        <div class="form-group">
                            <label>City</label>
                            <input class="form-control" value="<%=c.getCity()%>" type="text" name="dcity" required="">
                        </div>
                        <div class="form-group">
                            <label>State</label>
                            <input class="form-control" value="<%=c.getState()%>" type="text" name="dstate">
                        </div>
                        <div class="form-group">
                            <label>Country</label>
                            <input class="form-control" value="<%=c.getCountry()%>" type="text" name="dcountry" required="">
                        </div>
                        <%}%>
                        <div class="form-group">
                            <label>Phone Number</label>
                            <input class="form-control" type="tel" name="dphone" required="">
                        </div>
                        <div class="form-group">
                            <label>Delivery Method</label>
                            <br />
                            <label><input type="radio" name="delivery" value="Visa" class="radio-inline">&nbsp;  Standard</label> &nbsp;
                            <label><input type="radio" name="delivery" value="Mastercard" class="radio-inline">&nbsp;  Express</label>
                        </div>
                        <input type="submit" value="Submit" class="btn btn-primary btn-lg">
                        <a href="cart.jsp" class="btn btn-default btn-lg">Cancel</a>
                    </div>
                </form>
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
        });

        $(document).ready(function () {
            var month = document.getElementById('month');
            var year = document.getElementById('year');
            var montht = "";
            var i;
            for (i = 1; i < 13; i++)
            {
                montht = montht + "<option value='" + i + "'>" + i + "</option>";
            }
            var yeart = "";
            for (i = 2016; i < 2025; i++)
            {
                yeart = yeart + "<option value='" + i + "'>" + i + "</option>";
            }
            month.innerHTML = montht;
            year.innerHTML = yeart;
        });
    </script>
</body>
</html>
