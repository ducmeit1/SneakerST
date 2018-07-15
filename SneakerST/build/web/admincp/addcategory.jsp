<%-- 
    Document   : addproduct
    Created on : Oct 12, 2016, 8:00:02 PM
    Author     : DUCHTSE61924
--%>
<%if (session.getAttribute("userCP") == null) {
        response.sendRedirect(".");
        return;
    }%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="header.jsp"></jsp:include>
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header"><%=request.getAttribute("cp-msg") != null ? request.getAttribute("cp-msg") : "Add Category"%></h1>
            </div>
        </div>
        <div class="row">
            <form action="category?action=add" method="post">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Please input information of Category at below
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <h1>Basic information</h1>
                                    <div class="form-group">
                                        <label>Category ID</label>
                                        <input class="form-control" type="number" name="category_id" required="">
                                        <p>Category ID must not be duplicate</p>
                                    </div>
                                    <div class="form-group">
                                        <label>Category Name</label>
                                        <input class="form-control" type="text" name="category_name" required="">
                                    </div>
                                    <input type="submit" value="Submit" class="btn btn-lg">
                                    <input type="reset" value="Reset" class="btn btn-lg">
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
