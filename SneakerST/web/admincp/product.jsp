<%-- 
    Document   : addproduct
    Created on : Oct 12, 2016, 8:00:02 PM
    Author     : DUCHTSE61924
--%>
<%@page import="admincp.model.StockProduct"%>
<%@page import="admincp.model.ImageProduct"%>
<%@page import="admincp.model.Product"%>
<%if (session.getAttribute("userCP") == null) {
        response.sendRedirect(".");
        return;
    }%>
<%@page import="admincp.model.Size"%>
<%@page import="java.util.ArrayList"%>
<%@page import="admincp.model.Category"%>
<%@page import="admincp.dao.DatabaseContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <%if (request.getAttribute("productInfo") == null) {
                request.setAttribute("cp-msg", "View Product Error");
                request.getRequestDispatcher("/admincp/productmanagement.jsp").forward(request, response);
                return;
            }%>
    </head>
    <%DatabaseContext db = new DatabaseContext();
        ArrayList<Product> productInfo = (ArrayList<Product>) request.getAttribute("productInfo");
        ArrayList<ImageProduct> imagesList = (ArrayList<ImageProduct>) request.getAttribute("imagesList");
        ArrayList<StockProduct> stockInfo = (ArrayList<StockProduct>) request.getAttribute("stockInfo");
    %>    
    <jsp:include page="header.jsp"></jsp:include>
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header"><%=request.getAttribute("cp-msg") != null ? request.getAttribute("cp-msg") : "View Product"%></h1>
            </div>
        </div>
        <%for (Product p : productInfo) {%>
        <div class="row">
            <form action="/sneakerst/admincp/product/viewproduct/update" method="post">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Please input information of Product at below
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <h1>Basic information</h1>
                                    <div class="form-group">
                                        <label>Product ID</label>
                                        <input class="form-control" type="text" value="<%=p.getId()%>" disabled="">
                                    </div>
                                    <input class="form-control" type="hidden" name="product_id" value="<%=p.getId()%>">

                                    <div class="form-group">
                                        <label>Product Name</label>
                                        <input class="form-control" type="text" name="product_name" value="<%=p.getName()%>" required="">
                                    </div>
                                    <div class="form-group">
                                        <label>Description</label>
                                        <textarea class="form-control" name="product_description" rows="3" required=""><%=p.getDescription()%></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label>Detail</label>
                                        <textarea class="form-control" name="product_detail" rows="6"><%=p.getDetail()%></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label>Unit Price</label>
                                        <input class="form-control" type="number" value="<%=p.getPrice()%>" name="product_price" step="0.1" min="0" max="1000" required="">
                                    </div>
                                    <div class="form-group">
                                        <label>Gender</label>
                                        <select name="product_gender" class="form-control" required="">
                                            <%String[] gender = {"Male", "Women", "Kid"};
                                                for (String x : gender) {
                                                    if (x.equalsIgnoreCase(p.getGender())) {%>
                                            <option value="<%=p.getGender()%>" selected=""><%=p.getGender()%></option>
                                            <%} else {%>
                                            <option value="<%=x%>"><%=x%></option>
                                            <%}
                                                }%>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Category</label>
                                        <select name="product_category" class="form-control" required="">
                                            <%ArrayList<Category> categoryList = db.getCategory();
                                                for (Category s : categoryList) {
                                                    if (s.getId() == p.getCategory()) {%>
                                            <option value="<%=s.getId()%>" selected><%=s.getName()%></option>   
                                            <%} else {%>
                                            <option value="<%=s.getId()%>"><%=s.getName()%></option>
                                            <%}
                                                }%>

                                        </select>
                                    </div>
                                    <input type="submit" value="Submit" class="btn btn-lg">
                                    <input type="reset" value="Reset" class="btn btn-lg">
                                </div>
                                <%}%>

                                <div class="col-lg-6">
                                    <h1>Another information</h1>     
                                    <div class="form-group">
                                        <label>Image URL</label>
                                        <%for (ImageProduct i : imagesList) {%>
                                        <input class="form-control" name="product_image_url" value="<%=i.getUrl()%>" type="text" required=""> 
                                        <%}%>
                                        <div class="input_fields_wrap">
                                            <a class="add_field">More Image URL</a>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label>In Stock</label>
                                        <select name="product_instock" class="form-control instock" required="">
                                            <%String[] inStock = {"In Stock", "Out Stock"};
                                                for (Product p : productInfo) {
                                                    for (String s : inStock) {
                                                        if (s.equalsIgnoreCase(p.getInStock())) {%>
                                            <option value="<%=s%>" selected=""><%=s%></option>
                                            <%} else {%>
                                            <option value="<%=s%>"><%=s%></option>
                                            <%}
                                                    }
                                                }%>
                                        </select>
                                        <p class="help-block">Please select correct status stock of this product</p>
                                    </div>

                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            Product Size
                                        </div>
                                        <div class="panel-body">
                                            <table width="100%" class="table table-striped table-bordered table-hover">
                                                <thead>
                                                    <tr>
                                                        <th>Size ID</th>
                                                        <th>Size Name</th>
                                                        <th>Quantity</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%
                                                        for (StockProduct s : stockInfo) {%>
                                                    <tr>
                                                        <td><%=s.getSizeID()%></td>
                                                        <td><%=s.getSizeName()%></td>
                                                        <td><input class="sizestock" type="number" name="product_size" value="<%=s.getSizeQuantity()%>" min="0" max="100"></td>
                                                    </tr>
                                                    <%}%>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
