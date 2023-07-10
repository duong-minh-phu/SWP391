<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Trang thanh toán</title>
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
        <div class="off_canvars_overlay"></div>
        <jsp:include page="layout/menu.jsp" />
        <!--breadcrumbs area start-->
        <div class="breadcrumbs_area other_bread">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="breadcrumb_content">
                            <ul>
                                <li><a href="index.html">home</a></li>
                                <li>/</li>
                                <li>Trang thanh toán</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="Checkout_section" id="accordion">
            <div class="container">
                <div class="checkout_form">
                    <form action="MainController" method="POST">
                        <div class="row">
                            <div class="col-lg-5 col-md-5">
                                <h3>Chi tiết đơn hàng</h3>
                                <div class="row">

                                    <div class="col-lg-12 mb-20">
                                        <label>Tên khách hàng<span>*</span></label>
                                        <input readonly="" value="${sessionScope.user.user_name}" type="text">
                                    </div>
                                    <div class="col-lg-12 mb-20">
                                        <label> Email <span>*</span></label>
                                        <input readonly="" value="${sessionScope.user.user_email}" type="text">
                                    </div>
                                    <div class="col-lg-12 mb-20">
                                        <label>Địa chỉ và số điện thoại<span>*</span></label>
                                    </div>
                                    <div>
                                        <select required name="addressPhone" onchange="updateAddressPhone(this)">
                                            <option value="">Chọn địa chỉ và số điện thoại</option>
                                            <c:forEach items="${Listaddress}" var="users">
                                                <option value="${users.address},${users.user_phone}">
                                                    ${users.address} - ${users.user_phone}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <input class= "add" name="address" id="address">
                                    <input class= "add" name="phone" id="phone">
                                    <style>
                                        select {
                                            width: 100%;
                                            padding: 10px;
                                            border: 1px solid #ccc;
                                            border-radius: 4px;
                                            background-color: #fff;
                                            font-size: 14px;
                                        }

                                        select option {
                                            padding: 5px;
                                        }
                                        input.add {
                                            display: none;
                                        }

                                    </style>
                                    <div style="margin-top: 15px;">
                                        <button type="button" onclick="window.location.href = 'addmoreaddress.jsp'">Thêm địa chỉ và số điện thoại mới</button>
<!--                                        <button type="button" onclick="deleteAddressPhone()">Xóa</button>-->
                                    </div>
                                    <c:if test="${not empty error}">
                                        <div class="error-message">
                                            <h4>${error}</h4>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                            <div class="col-lg-7 col-md-7">

                                <h3>Sản phẩm</h3>
                                <div class="order_table table-responsive">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th>Product</th>
                                                <th>Quantity</th>
                                                <th>Total</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:set var="o" value="${sessionScope.cart}" />
                                            <c:forEach items="${o.items}" var="i">
                                                <tr>
                                                    <td>${i.key.product_name}</td>
                                                    <td>${i.value}</td>
                                                    <td>${i.key.product_price * i.value}</td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                        <c:if test="${sessionScope.cart!=null}">
                                            <tfoot>
                                                <tr>
                                                    <th>Phí ship</th>
                                                    <td><strong>30000</strong></td>
                                                </tr>
                                                <tr class="order_total">
                                                    <th>Tổng đơn</th>
                                                    <td><strong>${sessionScope.cart.getTotalMoney() + 30000}</strong></td>
                                                </tr>
                                            </tfoot>
                                        </c:if>
                                    </table>
                                </div>
                                <div class="payment_method">
                                    <div class="panel-default">
                                        <input id="payment_defult" value="cod" required name="payment_method" type="radio"
                                               data-target="createp_account" />
                                        <label for="payment_defult" data-toggle="collapse" data-target="#collapsedefult"
                                               aria-controls="collapsedefult">Thanh toán khi nhận hàng <img src="assets/img/icon/papyel.png"
                                                                                                     alt=""></label>
                                    </div>
                                    <div class="order_button">
                                        <button type="submit" name="action" value="payment">Đặt hàng</button>                                                                                 
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!--Checkout page section end-->
        <!--footer area start-->
        <jsp:include page="layout/footer.jsp" />
        <!-- Plugins JS -->
        <script src="assets/js/plugins.js"></script>

        <!-- Main JS -->
        <script src="assets/js/main.js"></script>

        <script>
                                            function updateAddressPhone(selectElement) {
                                                var selectedValue = selectElement.value;
                                                var address = document.getElementById('address');
                                                var phone = document.getElementById('phone');
                                                var addressPhone = selectedValue.split(',');

                                                address.value = addressPhone[0];
                                                phone.value = addressPhone[1];
                                            }
        </script>
    </body>

</html>
