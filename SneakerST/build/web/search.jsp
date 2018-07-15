<%-- 
    Document   : viewinvoice
    Created on : Oct 14, 2016, 1:21:09 PM
    Author     : Nguyen Bao
--%>

<%@page import="client.model.NewArrivals"%>
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
                        <h2 class="small_h2">Search</h2>
                        <hr class="star-primary">
                        <ol class="breadcrumb">
                            <li><a href=".">Home</a></li>
                            <li class="active">Search</li>
                        </ol>
                    </div>
                </div> 
            </div>
        </section>
    <%
        ArrayList<NewArrivals> arr = (ArrayList<NewArrivals>) request.getAttribute("search");
    %>
    <section id="new-arrivals">
        <div class="container-fluid">
            <div class="row">
                <h1 class="text-center"><%=request.getAttribute("msg-client")!=null?request.getAttribute("msg-client") : "Found it"%></h1>
            </div>
            <div class="row">
                <%for (int i = 0; i < arr.size(); i++) {%>
                <div class="col-lg-3 col-sm-6 new-arrivals-item">
                    <a href="#" class="new-arrivals-link">
                        <div class="type-tag">NEW</div>
                        <div class="price-tag"><%=arr.get(i).getUnitPrice()%> USD</div>
                        <img src="<%=arr.get(i).getImageUrl()%>" class="img-responsive" alt="">
                        <p><%=arr.get(i).getProductName()%></p>
                    </a>
                </div>
                <%}%>
            </div>
        </div>
    </section>
    <jsp:include page="footer.jsp"></jsp:include>
    <script src="plugins/datatables/js/jquery.dataTables.min.js"></script>
    <script src="plugins/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="plugins/datatables-responsive/dataTables.responsive.js"></script>
</body>
</html>

