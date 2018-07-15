<%-- 
    Document   : addproduct
    Created on : Oct 12, 2016, 8:00:02 PM
    Author     : DUCHTSE61924
--%>
<%@page import="admincp.model.ProductManagement"%>
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
                    <h1 class="page-header"><%=request.getAttribute("cp-msg") != null ? request.getAttribute("cp-msg") : "Product Management"%></h1>
            
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        All products in Store
                        
                    </div>
                    <div class="panel-body">
                        <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
                                <tr>
                                    <th>Thumb</th>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Description</th>
                                    <th>Price</th>
                                    <th>Gender</th>
                                    <th>Category</th>
                                    <th>Stock</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%ArrayList<ProductManagement> productList = db.getAllProduct();
                                ArrayList<Category> categoryList = db.getCategory();
                                    for (ProductManagement p : productList) {%>
                                <tr>
                                    <td><img src="<%=p.getThumbURL()%>" class="img-table img-centered"></td>
                                    <td><%=p.getId()%></td>
                                    <td><%=p.getName()%></td>
                                    <td><%=p.getDescription()%></td>
                                   
                                    <td><%=p.getPrice()%></td>
                                    <td><%=p.getGender()%></td>
                                    <td>
                                        <%for (Category c : categoryList) {
                                            if (p.getCategory() == c.getId()) {%>
                                                <%=c.getName()%>
                                            <%}
                                        }%>
                                    </td>
                                    <td><%=p.getInStock()%></td>
                                    <td><a href="viewproduct?id=<%=p.getId()%>" title="View Product" class="btn btn-default">View</a>
                                    <a href="deleteproduct?id=<%=p.getId()%>" title="Delete Product" class="btn btn-default">Delete</a>
                                    </td>
                                </tr>
                                <%}%>
                            </tbody>
                        </table>
                    </div>
                </div>
                            <a href="addproduct.jsp" class="pull-right btn btn-lg btn-primary">Add Product</a>
            </div>
                            
        </div>
    </div>
</body>
</html>
