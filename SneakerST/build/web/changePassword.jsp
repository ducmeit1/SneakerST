<%-- 
    Document   : myaccount
    Created on : Oct 14, 2016, 1:44:16 AM
    Author     : Nguyen Bao
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="client.model.Customer"%>
<%@page import="client.dao.DatabaseContextClient"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%if (session.getAttribute("userCustomer") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    ArrayList<Customer> userAccount = (ArrayList<Customer>) session.getAttribute("userCustomer");
%>
<html>
    <%
        String error = null;
        if (request.getAttribute("error") != null) {
            error = (String) request.getAttribute("error");
        }
        String username = userAccount.get(0).getUsername();
        DatabaseContextClient db = new DatabaseContextClient();
        Customer cus = db.displayInfo(username);
    %>
    <jsp:include page="header.jsp"></jsp:include>
        <section id="breadcrumb">
            <div class="bg parallax text-white" data-stellar-background-ratio="0.5" style="background-image: url(img/adidas-bg.jpg);">
                <div class="cover"></div>
                <div class="container">
                    <div class="text-center wow fadeInDown" data-wow-delay="0.4s">
                        <h2 class="small_h2">User Information</h2>
                        <hr class="star-primary">
                        <ol class="breadcrumb">
                            <li><a href=".">Home</a></li>
                            <li class="active">User Information</li>
                        </ol>
                    </div>
                </div> 
            </div>
        </section>
        <section id="account" style="padding: 50px 0px">
            <div class="container">
                <form action="changePassword" method="post">        
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Please enter your old password and the new one to change!
                        <%
                            if (error != null) {%>
                        <h3><%=error%></h3>  
                        <%}%>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <input class="form-control" type="text" name="username" readonly="" value="<%=cus.getUsername()%>">
                            <div class="form-group">
                                <label>Old Password</label>
                                <input class="form-control" type="password" name="oldPassword" required="">
                            </div>
                            <div class="form-group">
                                <label>New Password</label>
                                <input class="form-control" type="password" name="newPassword" required="">
                            </div>
                            <div class="form-group">
                                <label>Confirm new Password</label>
                                <input class="form-control" type="password" name="confirmNewPassword" required="">
                            </div>
                        </div>
                        <input type="submit" value="Change password" class="btn btn-success btn-lg">
                        <a href="." class="btn btn-default btn-lg">Cancel</a>
                    </div>
                </div>
            </form>
        </div>
    </section>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
