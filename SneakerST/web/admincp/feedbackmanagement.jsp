<%-- 
    Document   : addproduct
    Created on : Oct 12, 2016, 8:00:02 PM
    Author     : DUCHTSE61924
--%>
<%@page import="client.model.FeedbackManagement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="client.dao.DatabaseContextClient"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%if (session.getAttribute("userCP") == null) {
        response.sendRedirect(".");
        return;
    }%>
<!DOCTYPE html>
<html>
    <%DatabaseContextClient db = new DatabaseContextClient();%>    
    <jsp:include page="header.jsp"></jsp:include>
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header"><%=request.getAttribute("cp-msg") != null ? request.getAttribute("cp-msg") : "Feedback Management"%></h1>

            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        All Feedback OF Customer

                    </div>
                    <div class="panel-body">
                        <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
                                <tr>
                                    <th>Customer UserName</th> 
                                    <th>Customer Name</th> 
                                    <th>Customer Gender</th>
                                    <th>Customer Address</th>
                                    <th>Customer Email</th>
                                    <th>Customer Phone</th>
                                    <th>Product ID</th>
                                    <th>Product Name</th>
                                    <th>Date Buy</th>
                                    <th>Customer Comment</th>
                                    <th>Status To Customer</th>
                                    <th>Sending Comment</th>
                                </tr>
                            </thead>
                            <%
                                DatabaseContextClient dt = new DatabaseContextClient();
                                ArrayList<FeedbackManagement> fb = dt.adminFilter();
                                for (FeedbackManagement s : fb) {
                            %>
                            <tr>

                                <td><%=s.getUser()%></td>
                                <td><%=s.getName()%></td>
                                <td><%=s.getGender()%></td>
                                <td><%=s.getAddress()%></td>
                                <td><%=s.getEmail()%></td>
                                <td><%=s.getPhone()%></td>
                                <td><%=s.getProductID()%></td>
                                <td><%=s.getProductName()%></td>
                                <td><%=s.getDatebuy()%></td>
                                <td><%=s.getComment()%></td>
                                <td><%=s.getStatus()%></td>
                                <td>


                                    <form action="/sneakerst/admincp/accept" method="get">
                                        <input type="text" name="fbm"/>
                                        <input type="text" value="<%=s.getId()%>" name="idm" hidden/>
                                        <input type="submit" value="Send" />

                                    </form>

                                </td>
                            </tr>

                            <%
                                }
                            %>
                        </table>
                    </div>
                </div>

            </div>

        </div>
    </div>
</body>
</html>
