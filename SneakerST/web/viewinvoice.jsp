<%-- 
    Document   : viewinvoice
    Created on : Oct 14, 2016, 1:21:09 PM
    Author     : Nguyen Bao
--%>

<%@page import="client.model.InvoiceStatus"%>
<%@page import="client.model.DeliveryInvoice"%>
<%@page import="client.model.BillingInvoice"%>
<%@page import="client.dao.DatabaseContextClient"%>
<%@page import="client.model.Customer"%>
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
    <%
        String invoiceid = request.getParameter("invoice");
        DatabaseContextClient db = new DatabaseContextClient();
        ArrayList<Object> arr = db.getInvoice(invoiceid);
        BillingInvoice bill = new BillingInvoice();
        DeliveryInvoice deli = new DeliveryInvoice();
        InvoiceStatus inv = new InvoiceStatus();
        if (arr.size() > 0) {
            bill = (BillingInvoice) arr.get(0);
            deli = (DeliveryInvoice) arr.get(1);
            inv = (InvoiceStatus) arr.get(2);
        }
    %>
    <section id="breadcrumb">
        <div class="bg parallax text-white" data-stellar-background-ratio="0.5" style="background-image: url(img/adidas-bg.jpg);">
            <div class="cover"></div>
            <div class="container">
                <div class="text-center wow fadeInDown" data-wow-delay="0.4s">
                    <h2 class="small_h2">Invoice</h2>
                    <hr class="star-primary">
                    <ol class="breadcrumb">
                        <li><a href=".">Home</a></li>
                        <li><a href="cart.jsp">Shopping Cart</a></li>
                        <li class="active">Invoice <%=bill.getInvoiceID()%></li>
                    </ol>
                </div>
            </div> 
        </div>
    </section>
    <section id="contain_cart">
        <div class="container">
            <div class="row">
                <div class="col-lg-12"><h1>Invoice Information</h1></div>
                <div class="col-lg-6">

                    <table width="100%" class="table-bordered table-responsive table-striped text-uppercase">
                        <tr>
                            <td>Invoice ID:</td>
                            <td><%=bill.getInvoiceID()%></td>
                        </tr>
                        <tr>
                            <td>First Name:</td>
                            <td><%=bill.getBfName()%></td>
                        </tr>
                        <tr>
                            <td>Last Name:</td>
                            <td><%=bill.getBlName()%></td>
                        </tr>
                        <tr>
                            <td>Email:</td>
                            <td><%=bill.getbEmail()%></td>
                        </tr>
                        <tr>
                            <td>Address:</td>
                            <td><%=bill.getbAddress()%></td>
                        </tr>
                        <tr>
                            <td>City:</td>
                            <td><%=bill.getbCity()%></td>
                        </tr>
                        <tr>
                            <td>State:</td>
                            <td><%=bill.getbState()%></td>
                        </tr>
                        <tr>
                            <td>Country</td>
                            <td><%=bill.getbCountry()%></td>
                        </tr>
                        <tr>
                            <td>Payment Method</td>
                            <td><%=bill.getbPayment()%></td>
                        </tr>
                        <tr>
                            <td>Phone:</td>
                            <td><%=bill.getbPhone()%></td>
                        </tr>
                    </table>
                </div>
                <div class="col-lg-6">
                    <table width="100%" class="table-bordered table-responsive table-striped">
                        <tr>
                            <td>Delivery First Name:</td>
                            <td><%=deli.getDfName()%></td>
                        </tr>
                        <tr>
                            <td>Delivery Last Name:</td>
                            <td><%=deli.getDlName()%></td>
                        </tr>
                        <tr>
                            <td>Delivery Address:</td>
                            <td><%=deli.getdAddress()%></td>
                        </tr>
                        <tr>
                            <td>Delivery Phone:</td>
                            <td><%=deli.getdPhone()%></td>
                        </tr>
                        <tr>
                            <td>Delivery Method</td>
                            <td><%=deli.getdMethod()%></td>
                        </tr>
                    </table>
                </div>
                <div class="col-lg-12">
                    <%String[] status = {"Processing", "Delivered", "Cancel"};%>
                    <h1>Delivery Status: <%=status[inv.getInvoiceStatusID() - 1]%></h1>
                </div>
            </div>
        </div>
    </section>
    <jsp:include page="footer.jsp"></jsp:include>
    <script src="plugins/datatables/js/jquery.dataTables.min.js"></script>
    <script src="plugins/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="plugins/datatables-responsive/dataTables.responsive.js"></script>
</body>
</html>

