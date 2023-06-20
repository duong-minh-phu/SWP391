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
        <title>Reid - my account</title>
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
                                <li><a href="home">home</a></li>
                                <li>/</li>
                                <li>my account</li>
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
                        <div class="col-sm-12 col-md-3 col-lg-3">
                            <!-- Nav tabs -->
                            <div class="dashboard_tab_button">
                                <ul role="tablist" class="nav flex-column dashboard-list">
                                    <li><a href="#account-details" data-toggle="tab" class="nav-link">Tài khoản của tôi</a></li>
                                    <li><a href="#password" data-toggle="tab" class="nav-link">Thay đổi mật khẩu</a></li>
                                    <li> <a href="#orders" data-toggle="tab" class="nav-link">Đơn hàng</a></li>
                                    <li><a href="MainController?action=logout" class="nav-link">Đăng xuất</a></li>
                                </ul>
                            </div>    
                        </div>
                        <div class="col-sm-12 col-md-9 col-lg-9">
                            <!-- Tab panes -->
                            <div class="tab-content dashboard_content"> 
                                <div class="tab-pane fadee" id="orders">
                                <h3>Đơn hàng</h3>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Ngày mua</th>
                                                <th>Hình thức thanh toán</th>
                                                <th>Địa chỉ</th>
                                                <th>Tổng đơn</th>
                                                <th>Xem chi tiết</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <c:forEach items="${requestScope.bill}" var="b">
                                                <tr>
                                                    <td>${b.getDate()}</td>
                                                    <td><span class="success">${b.getPayment()}</span></td>
                                                    <td>${b.getAddress()}</td>
                                                    <td>${b.getTotal()}</td>
                                                 <td><a href="MainController?action=showdetail&bill_id=${b.getBill_id()}" class="view">view</a></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                                <div class="tab-pane fade show active" id="account-details">
                                    <h3>Tài khoản của tôi </h3>
                                    <div class="login">
                                        <div class="login_form_container">
                                            <div class="account_login_form">
                                                <form action="MainController?action=updateinfo" method="POST">
                                                    <p style="color: blue; align-content: center;">
                                                        ${requestScope.infor}
                                                </p>
                                                    <label>Tên người dùng</label>
                                                    <input type="text" name="user_name" value="${sessionScope.user.user_name}">
                                                    <label>Email</label>
                                                    <input type="text" readonly name="user_email" value="${sessionScope.user.user_email}">
                                                    
                                                    <label>Phone</label>
                                                    <input type="text" name="user_phone" value="${sessionScope.user.user_phone}">
                                                    <div class="cart_submit">                                                        
                                                        <button type="submit">save</button>
                                                    </div> 
                                                </form>
                                                    
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade show active" id="password">
                                    <h3>Thay đổi mật khẩu </h3>
                                    <div class="login">
                                        <div class="login_form_container">
                                            <div class="account_login_form">
                                                <form action="MainController?action=updatepassword" method="POST">
                                                    <p style="color: blue; align-content: center;">
                                                        ${requestScope.error_pass1}
                                                </p>
                                                    <label>Nhập mật khẩu hiện tại</label>
                                                    <input type="password" name="oldpassword" required="" >
                                                    <label>Nhập mật khẩu mới</label>
                                                    <input type="password"  name="newpass" required="" >
                                                    <label>Nhập mật lại mật khẩu</label>
                                                    <input type="password"  name="pass" required="" >                                                    
                                                    <div class="cart_submit">
                                                        <button type="submit">save</button>
                                                    </div> 
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
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
