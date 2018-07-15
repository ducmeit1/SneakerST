<%-- 
    Document   : product
    Created on : Oct 11, 2016, 11:18:50 AM
    Author     : DUCHTSE61924
--%>

<%@page import="client.model.Customer"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%if (session.getAttribute("userCustomer") == null) {
        response.sendRedirect("./login.jsp");
        return;
    }
    if (session.getAttribute("userCP") != null) {
        response.sendRedirect("./admincp");
        return;
    }%>
<%
    Random rc = new Random();
    ArrayList<Customer> userAccount = (ArrayList<Customer>) session.getAttribute("userCustomer");
%>
<!DOCTYPE html>
<html>
    <jsp:include page="header.jsp"></jsp:include> 
        <section id="breadcrumb">
            <div class="bg parallax text-white" data-stellar-background-ratio="0.5" style="background-image: url(img/adidas-bg.jpg);">
                <div class="cover"></div>
                <div class="container">
                    <div class="text-center wow fadeInDown" data-wow-delay="0.4s">
                        <h2 class="small_h2">FeedBack</h2>
                        <hr class="star-primary">
                        <ol class="breadcrumb">
                            <li><a href=".">Home</a></li>
                            <li class="active">FeedBack</li>
                        </ol>
                    </div>
                </div> 
            </div>
        </section>
        <section id="login" style="padding: 50px 0px">
            <div class="container">
                <form action="inputfeedback" method="post">        
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Please input your feedback
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-8 col-lg-offset-2 ">
                                    <h1><%=request.getAttribute("msg-client") != null ? request.getAttribute("msg-client") : "Your Information and Feedback"%></h1>
                                <div class="form-group">
                                    <label>Username</label>
                                    <input class="form-control" type="text" value="<%=userAccount.get(0).getUsername()%>" disabled>
                                    <input type="hidden" value="<%=userAccount.get(0).getUsername()%>" name="user">
                                </div>
                                <div class="form-group">
                                    <label>Feedback ID</label>
                                    <%int id = rc.nextInt(1000);%>
                                    <input class="form-control" type="text" value ="<%=id%>" required="" disabled >
                                    <input type="hidden" name="id" value="<%=id%>">
                                </div>
                                <div class="form-group">
                                    <label>Your Name</label>
                                    <input class="form-control" type="text" required="" name="name">
      
                                </div>
                                <div class="form-group">
                                    <label>Your Gender</label>
                                    <select name="gender">
                                        <option value="Male">Male</option>
                                        <option value="Women">Women</option>
                                        <option value="Kid">Kid</option>
                                    </select>
                                </div>
                                   <div class="form-group">
                                    <label>Your Address</label>
                                    <input class="form-control" type="text" name="address"  required="" >
                                </div>
                                <div class="form-group">
                                    <label>Your Email</label>
                                    <input class="form-control" type="email" name="email"  required="" >
                                </div>
                                <div class="form-group">
                                    <label>Your Phone</label>
                                    <input class="form-control" type="tel" name="phone"  required="" >
                                </div>
                                <div class="form-group">
                                    <label>Product ID</label>
                                    <input class="form-control" type="text" name="product_id"  required="" >
                                </div>
                                <div class="form-group">
                                    <label>Product Name</label>
                                    <input class="form-control" type="text" name="product_name"  required="" >
                                </div>

                                <div class="form-group">
                                    <label>Date Buy</label>
                                    <input class="form-control" type="date" name="date"  required="" >
                                </div>
                                <div class="form-group">
                                    <label>Your Comment</label>
                                    <textarea class="form-control" name="comment"></textarea>
                                </div>
                                <div class="form-group">
                                    <label>Status</label>
                                    <input class="form-control" type="text" value="Watting" required="" disabled="">
                                    <input type="hidden" name="status" value="Waitting">
                                </div>
                                <input type="submit" value="Submit" class="btn btn-success btn-lg">
                                <a href="." class="btn btn-default btn-lg">Cancel</a>
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
