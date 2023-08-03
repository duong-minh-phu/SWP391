<%@page import="java.util.List"%>
<%@page import="Entity.Bill"%>
<%@page import="DAO.billDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>My Bill</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

        <!-- CSS 
        ========================= -->


        <!-- Plugins CSS -->
        <link rel="stylesheet" href="assets/css/plugins.css">

        <!-- Main Style CSS -->
        <link rel="stylesheet" href="assets/css/style.css">

    </head>

    <body>

        <!-- Main Wrapper Start -->
        <!--Offcanvas menu area start-->
        <div class="off_canvars_overlay">

        </div>
        <jsp:include page="layout/menu.jsp"/>
        <!--breadcrumbs area start-->
        <div class="breadcrumbs_area other_bread">
            <div class="container">   
                <div class="row">
                    <div class="col-12">
                        <div class="breadcrumb_content">
                            <ul>
                                <li><a href="home">Home</a></li>
                                <li>/</li>
                                <li>My Bill</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>         
        </div>
        <!--breadcrumbs area end-->

        <!-- my account start  -->
        <section class="main_content_area">
            <div class="container">   
                <div class="account_dashboard">
                    <div class="row">
                        <!-- Tab panes -->
                        <div class="tab-content dashboard_content"> 
                            <h3> <a href="MainController?action=bill"> Đơn hàng </a> </h3>
                            <table class="button-table">
                                <tr>
                                    <td>
                                        <a class="btn btn-add btn-sm" href="MainController?action=orderconfirm">Đơn hàng chờ xác nhận</a>
                                    </td>
                                    <td>
                                        <a class="btn btn-add btn-sm" href="MainController?action=orderprepared">Đơn hàng đang chuẩn bị</a>
                                    </td>
                                    <td>
                                        <a class="btn btn-add btn-sm" href="MainController?action=ordershipping">Đang vận chuyển</a>
                                    </td>
                                    <td>
                                        <a class="btn btn-add btn-sm" href="MainController?action=ordershipdone">Đã giao hàng thành công</a>
                                    </td>
                                    <td>
                                        <a class="btn btn-add btn-sm" href="MainController?action=ordercancel">Đơn hàng đã hủy</a>
                                    </td>
                                </tr>
                            </table>
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Ngày mua</th>
                                            <th>Hình thức thanh toán</th>
                                            <th>Địa chỉ</th>
                                            <th>Tổng đơn</th>
                                            <th>Trạng thái</th>
                                            <th>Xem chi tiết</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${requestScope.billstatus1}" var="b">
                                            <tr>
                                                <td>${b.getDate()}</td>
                                                <td><span class="success">${b.getPayment()}</span></td>
                                                <td>${b.getAddress()}</td>
                                                <td>${b.getTotal()+30000}</td>
                                                <td>${b.getBill_status()}</td>
                                                <td><a href="MainController?action=showdetailcus&bill_id=${b.getBill_id()}" class="view">view</a></td>
                                            </tr>
                                        </c:forEach>

                                        <c:forEach items="${requestScope.billstatus2}" var="b">
                                            <tr>
                                                <td>${b.getDate()}</td>
                                                <td><span class="success">${b.getPayment()}</span></td>
                                                <td>${b.getAddress()}</td>
                                                <td>${b.getTotal()+30000}</td>
                                                <td>${b.getBill_status()}</td>
                                                <td><a href="MainController?action=showdetailcus&bill_id=${b.getBill_id()}" class="view">view</a></td>
                                            </tr>
                                        </c:forEach>

                                        <c:forEach items="${requestScope.billstatus3}" var="b">
                                            <tr>
                                                <td>${b.getDate()}</td>
                                                <td><span class="success">${b.getPayment()}</span></td>
                                                <td>${b.getAddress()}</td>
                                                <td>${b.getTotal()+30000}</td>
                                                <td>${b.getBill_status()}</td>
                                                <td><a href="MainController?action=showdetailcus&bill_id=${b.getBill_id()}" class="view">view</a></td>
                                            </tr>
                                        </c:forEach>

                                        <c:forEach items="${requestScope.billstatus4}" var="b">
                                            <tr>
                                                <td>${b.getDate()}</td>
                                                <td><span class="success">${b.getPayment()}</span></td>
                                                <td>${b.getAddress()}</td>
                                                <td>${b.getTotal()+30000}</td>
                                                <td>${b.getBill_status()}</td>
                                                <td><a href="MainController?action=showdetailcus&bill_id=${b.getBill_id()}" class="view">view</a></td>
                                            </tr>
                                        </c:forEach>
                                            
                                        <c:forEach items="${requestScope.billstatus5}" var="b">
                                            <tr>
                                                <td>${b.getDate()}</td>
                                                <td><span class="success">${b.getPayment()}</span></td>
                                                <td>${b.getAddress()}</td>
                                                <td>${b.getTotal()+30000}</td>
                                                <td>da huy</td>
                                                <td><a href="MainController?action=showdetailcus&bill_id=${b.getBill_id()}" class="view">view</a></td>
                                            </tr>
                                        </c:forEach>

                                        <c:forEach items="${requestScope.bill}" var="b">
                                            <tr>
                                                <td>${b.getDate()}</td>
                                                <td><span class="success">${b.getPayment()}</span></td>
                                                <td>${b.getAddress()}</td>
                                                <td>${b.getTotal()+30000}</td>
                                                <td>${b.getBill_status()}</td>

                                                <td><a href="MainController?action=showdetailcus&bill_id=${b.getBill_id()}" class="view">view</a></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>  
            </div>        	
        </section>			
        <!-- my account end   --> 
        <!--footer area start-->
        <jsp:include page="layout/footer.jsp"/>
        <!--footer area end-->

        <!-- JS
        ============================================ -->

        <!-- Plugins JS -->
        <script src="assets/js/plugins.js"></script>

        <!-- Main JS -->
        <script src="assets/js/main.js"></script>

    </body>

</html>
