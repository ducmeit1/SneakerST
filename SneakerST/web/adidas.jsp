<%-- 
    Document   : adidas
    Created on : Oct 11, 2016, 1:23:40 AM
    Author     : DUCHTSE61924
--%>

<%@page import="client.model.Brand"%>
<%@page import="java.util.ArrayList"%>
<%@page import="client.dao.DatabaseContextClient"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="header.jsp"></jsp:include>
        <!--=========== End HEADER SECTION ================--> 
        <!-- Breadcrumb -->
    <%DatabaseContextClient dbc = new DatabaseContextClient();
        ArrayList<Brand> brandProduct = dbc.getAllProductFromBrand("Adidas");%>
    <section id="breadcrumb">
        <div class="bg parallax text-white" data-stellar-background-ratio="0.5" style="background-image: url(img/adidas-bg.jpg);">
            <div class="cover"></div>
            <!-- Begin page header-->
            <div class="container">
                <div class="text-center wow fadeInDown" data-wow-delay="0.4s">
                    <h2>ADIDAS BRAND</h2>
                    <hr class="star-primary">
                    <ol class="breadcrumb">
                        <li><a href=".">Home</a></li>
                        <li class="active">Adidas</li>
                    </ol>
                </div>
            </div> 
        </div>
        <div class="container-fluid">
            <div class="row brand">
                <div id="brand-information" class="col-md-6 col-xs-12 information">
                    <p>
                        <img src="img/brand/adidas.png" alt="adidas">
                        Adidas is one of the most successful and dominant brands in the business and can look back on a long amazing history. In 1920 Adi Dassler produced the first shoes without electricity in his Mothers washroom. Together with his brother Rudolf he founded the Dassler OHG in 1924. The rising demand and better production facilities increased the number of produced shoes in the following years. In 1936 the legendary Jesse Owens won 4 gold medals in Dassler shoes at the Olympic games, which gave the young brand a big push. When Adi and Rudolf decided to part ways in 1948, both went on to found their own brands, Adidas (Adi) and Puma (Rudolf). In the same year Adidas presented the 3 stripes on the side panel, which were originally made just for stabilization.
                        In 1954 Adidas was in focus of the world public again. The German national soccer team won the world cup wearing the shoes containing the revolutionary screw-in studs. The brand with the three stripes developed into one of the most dominant brands at the top sport events like the Olympics.  In 1972 Adidas presented the trefoil logo which represented the Olympic spirit. In the following years the German brand which is based in Herzogenaurach made the successful transition from a normal sportswear- to a lifestyle sport brand by working together with different Artist and Stars. One of them was the famous rap group Run DMC which dedicated their favorite brand with "My Adidas" a classic rap. Run DMC was the first music artists to be signed by Adidas.
                    </p>
                </div>
                <div id="brand-link" class="col-md-6 col-xs-12 link">
                    <div class="col-xs-4">
                        <ul>
                            <li><a href="viewproduct?id=10021">ADIDAS NMD</a></li>
                            <li><a href="viewproduct?id=10001">AIDAS TUBULAR</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Breadcrumb-->

    <!--Information of BRAND --->
    <!-- END information of BRAND -->
    <!--=========== BEGIN BRAND PRODUCT SECTION ================-->
    <section id="new-arrivals">
        <div class="container-fluid">
            <div class="row">
                <%for (Brand b : brandProduct) {%>
                <div class="col-lg-3 col-sm-6 new-arrivals-item">
                    <a href="viewproduct?id=<%=b.getProductID()%>" class="new-arrivals-link">
                        <div class="type-tag"><%=b.getCategoryName()%></div>
                        <div class="price-tag"><%=b.getPrice()%></div>
                        <img src="<%=b.getUrl()%>" class="img-responsive" alt="">
                        <p><%=b.getProductName()%></p>
                    </a>
                </div>
                <%}%>
            </div>
    </section>
    <jsp:include page="footer.jsp"></jsp:include>
    <!--==========END BRAND PRODUCT ================-->
</body>
</html>
