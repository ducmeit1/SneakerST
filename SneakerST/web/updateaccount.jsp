<%-- 
    Document   : myaccount
    Created on : Oct 14, 2016, 1:44:16 AM
    Author     : Nguyen Bao
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="client.model.Customer"%>
<%@page import="client.dao.DatabaseContextClient"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%if (session.getAttribute("userCustomer") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    ArrayList<Customer> userAccount = (ArrayList<Customer>) session.getAttribute("userCustomer");
%>
<!DOCTYPE html>
<html>
    <%
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
                        <h2 class="small_h2">Update Information</h2>
                        <hr class="star-primary">
                        <ol class="breadcrumb">
                            <li><a href=".">Home</a></li>
                            <li class="active">Update Information</li>
                        </ol>
                    </div>
                </div> 
            </div>
        </section>
        <section id="account" style="padding: 50px 0px">

            <div class="container">
                <form action="updateaccount" method="post">        
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Please input new information to update!
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label>Username</label>
                                        <input class="form-control" type="text" name="username" readonly value="<%=cus.getUsername()%>">
                                    </div>
                                    <div class="form-group">
                                        <label>First Name</label>
                                        <input class="form-control" type="text" name="firstname" required="" value="<%=cus.getFirstname()%>">
                                    </div>
                                    <div class="form-group">
                                        <label>Last Name</label>
                                        <input class="form-control" type="text" name="lastname" required="" value="<%=cus.getLastname()%>">
                                    </div>
                                    <div class="form-group">
                                        <label>Email</label>
                                        <input class="form-control" type="email" name="email" required="" value="<%=cus.getEmail()%>">
                                    </div>
                                    <div class="form-group">
                                        <label>Address</label>
                                        <input class="form-control" type="text" name="address" required="" value="<%=cus.getAddress()%>">
                                    </div>
                                    <div class="form-group">
                                        <label>City</label>
                                        <input class="form-control" type="text" name="city" required="" value="<%=cus.getCity()%>">
                                    </div>
                                    <div class="form-group">
                                        <label>State</label>
                                        <input class="form-control" type="text" name="state" value="<%=cus.getState()%>">
                                    </div>
                                    <div class="form-group">
                                        <label>Postcode</label>
                                        <input class="form-control" type="text" name="postcode" required="" value="<%=cus.getPostcode()%>">
                                    </div>
                                    <div class="form-group">
                                        <label>Country</label>
                                        <input class="form-control" type="text" name="country" required="" value="<%=cus.getCountry()%>">
                                    </div>
                                    <input type="submit" value="Update" class="btn btn-success btn-lg">
                                    <!--<a href="." class="btn btn-default btn-lg">Cancel</a>-->
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </section>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>

