<%-- 
    Document   : newarrivals
    Created on : Oct 14, 2016, 10:08:52 AM
    Author     : Nguyen Bao
--%>

<%@page import="client.model.NewArrivals"%>
<%@page import="java.util.ArrayList"%>
<%@page import="client.dao.DatabaseContextClient"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="header.jsp"></jsp:include>
        <!--=========== End HEADER SECTION ================--> 
        <!-- Breadcrumb -->
        <section id="breadcrumb">
            <div class="bg parallax text-white" data-stellar-background-ratio="0.5" style="background-image: url(img/adidas-bg.jpg);">
                <div class="cover"></div>
                <!-- Begin page header-->
                <div class="container">
                    <div class="text-center wow fadeInDown" data-wow-delay="0.4s">
                        <h2>NEW ARRIVALS</h2>
                        <hr class="star-primary">
                        <ol class="breadcrumb">
                            <li><a href=".">Home</a></li>
                            <li class="active">New Arrivals</li>
                        </ol>
                    </div>
                </div> 
            </div>
        </section>
        <!-- End Breadcrumb-->

        <!--Information of BRAND --->
        <!-- END information of BRAND -->
        <!--=========== BEGIN NEW ARRIVALS SECTION ================-->
    <%
        String gender = (String) request.getParameter("gender");
        DatabaseContextClient dbc = new DatabaseContextClient();
        ArrayList<NewArrivals> arr = dbc.newArrivals(gender);
    %>

    <section id="new-arrivals">
        <div class="container-fluid">
            <div class="row">
                <%for (int i = 0; i < arr.size(); i++) {%>
                <div class="col-lg-3 col-sm-6 new-arrivals-item">
                    <a href="viewproduct?id=<%=arr.get(i).getProductId()%>" class="new-arrivals-link">
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
    <!--==========END NEW ARRIVALS================-->
</body>
</html>
