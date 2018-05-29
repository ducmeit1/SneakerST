<%-- 
    Document   : product
    Created on : Oct 11, 2016, 11:18:50 AM
    Author     : DUCHTSE61924
--%>

<%@page import="client.model.NewArrivals"%>
<%@page import="client.dao.DatabaseContextClient"%>
<%@page import="client.model.CategoryProduct"%>
<%@page import="admincp.model.StockProduct"%>
<%@page import="admincp.model.ImageProduct"%>
<%@page import="admincp.model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="admincp.dao.DatabaseContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <%DatabaseContext db = new DatabaseContext();
        ArrayList<Product> productInfo = (ArrayList<Product>) request.getAttribute("productInfo");
        ArrayList<ImageProduct> imagesList = (ArrayList<ImageProduct>) request.getAttribute("imagesList");
        ArrayList<StockProduct> stockInfo = (ArrayList<StockProduct>) request.getAttribute("stockInfo");
        ArrayList<CategoryProduct> categoryInfo = (ArrayList<CategoryProduct>) request.getAttribute("categoryInfo");%>
    <jsp:include page="header.jsp"></jsp:include> 
        <section id="breadcrumb">
            <div class="bg parallax text-white" data-stellar-background-ratio="0.5" style="background-image: url(img/adidas-bg.jpg);">
                <div class="cover"></div>
                <!-- Begin page header-->
                <div class="container">
                    <div class="text-center wow fadeInDown" data-wow-delay="0.4s">
                        <h2 class="small_h2"><%=productInfo.get(0).getName()%></h2>
                    <hr class="star-primary">
                    <ol class="breadcrumb">
                        <li><a href=".">Home</a></li>
                        <li><a href="<%=categoryInfo.get(0).getUrlLink()%>"><%=categoryInfo.get(0).getName()%></a></li>
                        <li class="active"><%=productInfo.get(0).getName()%></li>
                    </ol>
                </div>
            </div> 
        </div>
    </section>
    <!-- End Breadcrumb-->
    <section id="product_profile">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-sm-12">
                    <div class="main_pic">
                        <img src="<%=imagesList.get(0).getUrl()%>" class="img-responsive" width="100%" alt="main_pic">
                        <div id="previous">
                            <span class="icon"></span>
                        </div>
                        <div id="next">
                            <span class="icon"></span>
                        </div>
                    </div>
                    <div class="thumbs">
                        <%for (ImageProduct i : imagesList) {%>
                        <img src="<%=i.getUrl()%>" class="img-responsive" alt="thumbs">
                        <%}%>
                    </div>
                </div>
            </div>
            <div class="row product_info">
                <div class="col-md-6 col-sm-6">
                    <img src="<%=categoryInfo.get(0).getUrlImage()%>" class="img-responsive" alt="thumbs-brand">
                    <h1><%=productInfo.get(0).getPrice()%></h1>    
                    <div class="text-center form-group">
                        <%if (productInfo.get(0).getInStock().equalsIgnoreCase("In Stock")) {%>
                        <form action="addtocart" method="post">
                            <select name="product_size" class="size">
                                <%for (StockProduct s : stockInfo) {
                                        if (s.getSizeQuantity() > 0) {
                                %>
                                <option value="<%=s.getSizeName()%>">US <%=s.getSizeName()%></option>
                                <%}
                                }%>
                            </select>
                            <input type="hidden" value="<%=productInfo.get(0).getName()%>" name="product_name">
                            <input type="hidden" value="<%=categoryInfo.get(0).getName()%>" name="product_category">
                            <input type="hidden" value="<%=imagesList.get(0).getUrl()%>" name="product_main_pic">
                            <input type="hidden" value="<%=productInfo.get(0).getPrice()%>" name="product_price">
                            <input type="hidden" value="<%=productInfo.get(0).getId()%>" name="product_id">
                            <input type="hidden" value="<%=productInfo.get(0).getGender()%>" name="product_gender">
                            <input type="submit" value="ADD TO CARD" />
                        </form>
                        <%} else {%>
                        <p>Out Stock</p>
                        <%}%>
                    </div>
                    <hr>
                    <h3>DESCRIPTION</h3>
                    <p><%=productInfo.get(0).getDescription()%></p>
                    <hr>
                    <h3>DETAIL</h3>
                    <p><%=productInfo.get(0).getDetail()%>
                    </p>
                    <hr>
                </div>
                <div class="col-md-6 col-sm-12">
                    <div class="panel-group" id="accordion">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">Size Chart <span class="caret"></span></a>
                                </h4>
                            </div>
                            <div id="collapse1" class="panel-collapse collapse in">
                                <div class="panel-body table-responsive">
                                    <table id="size-chart" cellpadding="0" cellspacing="0" class="table">
                                        <thead>
                                            <tr>
                                                <th>US</th>
                                                <th>UK</th>
                                                <th>EU</th>
                                                <th>CM</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr><td>4</td><td>36</td><td>3.5</td><td>22</td></tr>
                                            <tr><td>4.5</td><td>36 2/3</td><td>4</td><td>22.5</td></tr>
                                            <tr><td>5</td><td>37 1/3</td><td>4.5</td><td>23</td></tr>
                                            <tr><td>5.5</td><td>38</td><td>5</td><td>23.5</td></tr>
                                            <tr><td>6</td><td>38 2/3</td><td>5.5</td><td>24</td></tr>
                                            <tr><td>6.5</td><td>39 1/3</td><td>6</td><td>24.5</td></tr>
                                            <tr><td>7</td><td>40</td><td>6.5</td><td>25</td></tr>
                                            <tr><td>7.5</td><td>40 2/3</td><td>7</td><td>25.5</td></tr>
                                            <tr><td>8</td><td>41 1/3</td><td>7.5</td><td>26</td></tr>
                                            <tr><td>8.5</td><td>42</td><td>8</td><td>26.5</td></tr>
                                            <tr><td>9</td><td>42 2/3</td><td>8.5</td><td>27</td></tr>
                                            <tr><td>9.5</td><td>43 1/3</td><td>9</td><td>27.5</td></tr>
                                            <tr><td>10</td><td>44</td><td>9.5</td><td>28</td></tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">Delivery terms</a>
                                </h4>
                            </div>
                            <div id="collapse2" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <p>
                                        We will always try to ship your order within 24 hours. Usually if you place your order before 09.00 a.m. CET we will ship it the same day. <br />
                                        During particular releases, sales or holidays, the handling of your order may take up to two days.<br />
                                        Vietnam
                                        You will recieve your order within 3-5 work days after we have shipped your order.<br />
                                        Rest of the world
                                        You will recieve your order within 5-10 work days after we have shipped your order.<br />
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">Returns & Payments</a>
                                </h4>
                            </div>
                            <div id="collapse3" class="panel-collapse collapse">
                                <div class="panel-body">
                                    30 days full return policy (exchange or money back). PayPal, Visa and Mastercard payments accepted.
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <hr>
        </div>
        <div id="new-arrivals" style="padding: 10px 0px;">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12">
                        <h3>RECENT SNEAKERS MAY YOU LIKE</h3>
                    </div>
                </div>
                <div class="row">
                    <% 
                        DatabaseContextClient dbc = new DatabaseContextClient();
                        ArrayList<NewArrivals> arr = dbc.newArrivals("");
                    %>
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
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <a href="newarrivals.jsp?gender=" class="btn btn-lg btn-outline" style="position: relative; top: 30px">
                            VIEW MORE
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
