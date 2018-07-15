<%-- 
    Document   : addproduct
    Created on : Oct 12, 2016, 8:00:02 PM
    Author     : DUCHTSE61924
--%>
<%if (session.getAttribute("userCP") == null) {
        response.sendRedirect(".");
    }%>
<%@page import="admincp.model.Size"%>
<%@page import="java.util.ArrayList"%>
<%@page import="admincp.model.Category"%>
<%@page import="admincp.dao.DatabaseContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%DatabaseContext db = new DatabaseContext();%>    
    <jsp:include page="header.jsp"></jsp:include>
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header"><%=request.getAttribute("cp-msg") != null ? request.getAttribute("cp-msg") : "Add Product"%></h1>
                </div>
            </div>
            <div class="row">
                <form action="/sneakerst/admincp/product/addproduct/add" method="post">
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
                                            <input class="form-control" type="number" name="product_id" required="">
                                            <p class="help-block">Product ID must not be duplicated</p>
                                        </div>
                                        <div class="form-group">
                                            <label>Product Name</label>
                                            <input class="form-control" type="text" name="product_name" required="">
                                        </div>
                                        <div class="form-group">
                                            <label>Description</label>
                                            <textarea class="form-control" name="product_description" rows="3" required=""></textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>Detail</label>
                                            <textarea class="form-control" name="product_detail" rows="6"></textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>Unit Price</label>
                                            <input class="form-control" type="number" name="product_price" step="0.1" min="0" max="1000" required="">
                                        </div>
                                        <div class="form-group">
                                            <label>Gender</label>
                                            <select name="product_gender" class="form-control" required="">
                                                <option value="Male">Male</option>
                                                <option value="Women">Women</option>
                                                <option value="Kid">Kid</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label>Category</label>
                                            <select name="product_category" class="form-control" required="">
                                            <%ArrayList<Category> categoryList = db.getCategory();
                                                for (Category s : categoryList) {%>
                                            <option value="<%=s.getId()%>"><%=s.getName()%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                    <input type="submit" value="Submit" class="btn btn-lg">
                                    <input type="reset" value="Reset" class="btn btn-lg">
                                </div>
                                <div class="col-lg-6">
                                    <h1>Another information</h1>
                                    <div class="form-group">
                                        <label>Image URL</label>
                                        <div class="input_fields_wrap">
                                            <a class="add_field">More Image URL</a>
                                            <input class="form-control" name="product_image_url" type="text" required="">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>In Stock</label>
                                        <select name="product_instock" class="form-control" required="">
                                            <option value="In Stock" selected>In Stock</option>
                                            <option value="Out Stock">Out Stock</option>
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
                                                    <%ArrayList<Size> sizeList = db.getSize();
                                                        for (int i = 0; i < sizeList.size(); i++) {%>
                                                    <tr>
                                                        <td><%=sizeList.get(i).getId()%></td>
                                                        <td><%=sizeList.get(i).getName()%></td>
                                                        <td><input type="number" class="sizestock" name="product_size" value="0" min="0" max="100"></td>
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
