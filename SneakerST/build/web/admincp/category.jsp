<%-- 
    Document   : addproduct
    Created on : Oct 12, 2016, 8:00:02 PM
    Author     : DUCHTSE61924
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="admincp.model.Category"%>
<%if (session.getAttribute("userCP") == null) {
        response.sendRedirect(".");
    }%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%if (request.getAttribute("categoryResult") == null) {
        response.sendRedirect(".");
    }%>
    <jsp:include page="header.jsp"></jsp:include>
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header"><%=request.getAttribute("cp-msg") != null ? request.getAttribute("cp-msg") : "View Category"%></h1>
            </div>
        </div>
        <div class="row">
            <%ArrayList<Category> categoryList = (ArrayList<Category>) request.getAttribute("categoryResult");
            for (Category c : categoryList) {%>
            <form action="category?action=update" method="post">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Information of Category at below
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <h1>Basic information</h1>
                                    <div class="form-group">
                                        <label>Category ID: <input type="hidden" value="<%=c.getId()%>" name="category_id"><%=c.getId()%></label>
                                    </div>
                                    <div class="form-group">
                                        <label>Category Name</label>
                                        <input class="form-control" type="text" value="<%=c.getName()%>" name="category_name" required="">
                                    </div>
                                    <input type="submit" value="Submit" class="btn btn-lg">
                                    <input type="reset" value="Reset" class="btn btn-lg">
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <%}%>
        </div>
    </div>
</body>
</html>
