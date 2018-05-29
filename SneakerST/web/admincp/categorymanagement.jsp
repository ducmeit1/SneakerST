<%-- 
    Document   : categorymanagement
    Created on : Oct 13, 2016, 8:08:31 PM
    Author     : DUCHTSE61924
--%>

<%@page import="admincp.model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="admincp.dao.DatabaseContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%if (session.getAttribute("userCP") == null) {
        response.sendRedirect(".");
    }%>
<!DOCTYPE html>
<html>
    <%DatabaseContext db = new DatabaseContext();%>    
    <jsp:include page="header.jsp"></jsp:include>
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header"><%=request.getAttribute("cp-msg") != null ? request.getAttribute("cp-msg") : "Category Management"%></h1>
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
                                        <th>Category ID</th>
                                        <th>Category Name</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%ArrayList<Category> categoryList = db.getCategory();
                                       
                                            for (Category c : categoryList) {%>
                                    <tr>
                                        <td><%=c.getId()%></td>
                                        <td><%=c.getName()%></td>
                                        <td><a href="category?action=view&id=<%=c.getId()%>" title="View Category" class="btn btn-default">View</a>
                                            <a href="category?action=delete&id=<%=c.getId()%>&name=<%=c.getName()%>" title="Delete Category" class="btn btn-default">Delete</a></td>
                                    </tr>
                                    <%}%>
                            </table>
                        </div>
                    </div>
                            <a href="addcategory.jsp" class="btn btn-primary btn-lg pull-right">Add Category</a>
                </div>

            </div>
        </div>
    </body>
</html>
