<%-- 
    Document   : product
    Created on : Oct 11, 2016, 11:18:50 AM
    Author     : DUCHTSE61924
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%if (session.getAttribute("userCustomer") != null) {
            response.sendRedirect(".");
            return;
         }
    if (session.getAttribute("userCP") != null) {
            response.sendRedirect("./admincp");
            return;
        }%>
    <jsp:include page="header.jsp"></jsp:include>
        <section id="breadcrumb">
            <div class="bg parallax text-white" data-stellar-background-ratio="0.5" style="background-image: url(img/adidas-bg.jpg);">
                <div class="cover"></div>
                <div class="container">
                    <div class="text-center wow fadeInDown" data-wow-delay="0.4s">
                        <h2 class="small_h2">Login</h2>
                        <hr class="star-primary">
                        <ol class="breadcrumb">
                            <li><a href=".">Home</a></li>
                            <li class="active">Login</li>
                        </ol>
                    </div>
                </div> 
            </div>
        </section>
        <section id="login" style="padding: 50px 0px">
            <div class="container">
                <form action="login" method="post">        
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Please input all information at below to Login
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-8 col-lg-offset-2 text-center">
                                    <h1><%=request.getAttribute("msg-client") != null ? request.getAttribute("msg-client") : "Login to account"%></h1>
                                    <div class="form-group">
                                        <label>Username</label>
                                        <input class="form-control" type="text" name="username" required="">
                                    </div>
                                    <div class="form-group">
                                        <label>Password</label>
                                        <input class="form-control" type="password" name="password" required="">
                                    </div>
                                    <input type="submit" value="Resgiter" class="btn btn-success btn-lg">
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
