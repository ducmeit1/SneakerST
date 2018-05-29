<%-- 
    Document   : product
    Created on : Oct 11, 2016, 11:18:50 AM
    Author     : DUCHTSE61924
--%>

<%@page import="client.model.Customer"%>
<%@page import="client.model.FeedbackManagement"%>
<%@page import="client.dao.DatabaseContextClient"%>
<%@page import="client.model.FeedbackUser"%>
<%@page import="java.util.Random"%>
<%@page import="client.model.CartItem"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%if (session.getAttribute("userCustomer") == null) {
        response.sendRedirect("./login.jsp");
        return;
    }
    if (session.getAttribute("userCP") != null) {
        response.sendRedirect("./admincp");
        return;
    }%>
<%
    Random rc = new Random();
%>
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
                        <h2 class="small_h2">Your FeedBack</h2>
                        <hr class="star-primary">
                        <ol class="breadcrumb">
                            <li><a href=".">Home</a></li>
                            <li class="active">Your FeedBack</li>
                        </ol>
                    </div>
                </div> 
            </div>
        </section>
        <section id="contain_cart">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <h1>Your FeedBack List</h1>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Here is your feed back
                            </div>
                            <div class="panel-body">
                                <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>User Name</th>
                                            <th>Your Address</th>
                                            <th>Your Phone</th>
                                            <th>Product ID</th>
                                            <th>Product Name</th>
                                            <th>Date Buy</th>
                                            <th>Your Comment</th>
                                            <th>Feedback Management</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                        ArrayList<Customer> userAccount = (ArrayList<Customer>) session.getAttribute("userCustomer");
                                        String username = userAccount.get(0).getUsername();
                                        DatabaseContextClient dt = new DatabaseContextClient();
                                        ArrayList<FeedbackUser> fb = dt.userFilter(username);
                                        for (FeedbackUser s : fb) {
                                    %>
                                    <tr>
                                        <td><%=s.getName()%></td>
                                        <td><%=s.getAddress()%></td>
                                        <td><%=s.getPhone()%></td>
                                        <td><%=s.getProductID()%></td>
                                        <td><%=s.getProductName()%></td>
                                        <td><%=s.getDatebuy()%></td>
                                        <td><%=s.getComment()%></td>
                                        <td><%=s.getStatus()%></td>
                                    </tr>
                                    <%}%>
                                </tbody> 
                            </table>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12">
                    <a href="inputfeedback.jsp" class="pull-right btn btn-primary btn-lg">Add FeedBack</a>
                    <a href="login.jsp" class="pull-right btn btn-primary btn-lg">Cancel</a>
                </div>

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
    </script>
</body>
</html>
