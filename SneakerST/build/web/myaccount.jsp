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
        String username = userAccount.get(0).getUsername();
        DatabaseContextClient dbc = new DatabaseContextClient();
        Customer cus = dbc.displayInfo(username);
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
                <div class="row">
                    <div class="col-md-12 col-lg-12 toppad" >
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <h3 class="panel-title"><%=cus.getFirstname()%> <%=cus.getLastname()%></h3>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-3 col-lg-3 " align="center"> <img alt="User Pic" src="http://babyinfoforyou.com/wp-content/uploads/2014/10/avatar-300x300.png" class="img-circle img-responsive"> </div>
                                <div class=" col-md-9 col-lg-9 "> 
                                    <table class="table table-user-information">
                                        <tbody>
                                            <tr>
                                                <td>First Name:</td>
                                                <td><%=cus.getFirstname()%></td>
                                            </tr>
                                            <tr>
                                                <td>Last Name:</td>
                                                <td><%=cus.getLastname()%></td>
                                            </tr>
                                            <tr>
                                                <td>Email:</td>
                                                <td><%=cus.getEmail()%></td>
                                            </tr>
                                            <tr>
                                                <td>Address:</td>
                                                <td><%=cus.getAddress()%></td>
                                            </tr>
                                            <tr>
                                                <td>City:</td>
                                                <td><%=cus.getCity()%></td>
                                            </tr>
                                            <tr>
                                                <td>State:</td>
                                                <td><%=cus.getState()%></td>
                                            </tr>
                                            <tr>
                                                <td>Post Code:</td>
                                                <td><%=cus.getPostcode()%></td>
                                            </tr>
                                            <tr>
                                                <td>Country:</td>
                                                <td><%=cus.getCountry()%></td>
                                            </tr>
                                        </tbody>
                                        <tr>
                                            <td>
                                                <form action="updateaccount.jsp">
                                                    <input type="text" name="username" value="<%=username%>" hidden>
                                                    <button type="submit" class="btn-primary btn">Update</button>
                                                </form>
                                            </td>
                                            <td>
                                                <form action="changePassword.jsp">
                                                    <input type="text" name="username" value="<%=username%>" hidden>
                                                    <button type="submit" class="btn-primary btn">Change Password</button>
                                                </form>
                                            </td>
                                        </tr>
                                    </table>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>

