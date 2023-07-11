<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Giỏ hàng</title>
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
        <jsp:include page="layout/menu.jsp"/>
        <!--breadcrumbs area start-->
        <div class="breadcrumbs_area other_bread">
            <div class="container">   
                <div class="row">
                    <div class="col-12">
                        <div class="breadcrumb_content">
                            <ul>
                                <li><a href="index.jsp">Trang chủ</a></li>
                                <li>/</li>
                                <li>Giỏ hàng</li>
                            </ul>

                        </div>
                    </div>
                </div>
            </div>         
        </div>
        <!--breadcrumbs area end-->

        <!-- shopping cart area start -->
        <div class="shopping_cart_area">
            <div class="container">  
                <form> 
                    <div class="row">
                        <div class="table_desc">
                            <div class="cart_page table-responsive">

                                <table>
                                    <thead>
                                        <tr>

                                            <th class="product_thumb">Image</th>
                                            <th class="product_name">Product</th>
                                            <th class="product-price">Price</th>
                                            <th class="product_quantity">Quantity</th>
                                            <th class="product_total">Total</th>
                                            <th class="product_remove">Delete</th>


                                        </tr>
                                    </thead>
                                    <tbody>

                                        <c:forEach items="${sessionScope.cart.items}" var="i">
                                            <tr>
                                                <td class="product_thumb"><a href="MainController?action=productdetail&product_id=${i.key.product_id}"><img src="${i.key.img}" alt=""></a></td>
                                                <td class="product_name"><a href="MainController?action=productdetail&product_id=${i.key.product_id}">${i.key.product_name}</a></td>
                                                <td class="product-price"><fmt:formatNumber pattern="##########" value="${i.key.product_price}"/></td>

                                                <td class="product_quantity"><input name="quantity" min="1" max="100"  value="${(i.value)}" onchange="handleEvent(event, '${i.key.product_id}')" type="number"></td>

                                                <td id ="demo3${i.key.product_id}" class="product_total"> <fmt:formatNumber pattern="##########" value="${i.key.product_price * i.value }"/></td>

                                                <td class="product_remove"> <a href="#" onclick="confirmDelete('${i.key.product_id}')"> <i class="fa fa-trash-o"></i> </a> </t
                                            </tr>


                                        </c:forEach>


                                    </tbody>
                                </table>

                                <script>
                                    function confirmDelete(value) {
                                        var message = "Bạn có chắc chắn muốn loại bỏ sản phẩm khỏi giỏ hàng không?";
                                        var result = confirm(message);
                                        if (result) {
                                            // The user clicked OK, so delete the product.
                                            window.location.href = "MainController?action=deleteFromCart&product_id=" + value;
                                        } else {
                                            // The user clicked Cancel, so do nothing.
                                        }
                                    }
                                </script>
                                <script>
                                    function update(product_id, quantity) {
                                        //gọi ra class XMLHTTPRequst() làm gì k cần biết
                                        const xhttp = new XMLHttpRequest();

                                        // gắn function
                                        xhttp.onload = function () {
                                            //lấy phần tử có id là demo trong html, và thay đổi thành this response text
                                            document.getElementById("demo").innerHTML = this.responseText.split("|")[1];
                                            document.getElementById("demo2").innerHTML = parseInt(this.responseText.split("|")[1]) + 30000;
                                            const demo3 = "demo3" + product_id;
                                            document.getElementById(demo3).innerHTML = this.responseText.split("|")[0];

                                        }
                                        xhttp.open("GET", "UpdateItemsInCart?id=" + product_id + "&quantity=" + quantity);
                                        xhttp.send()
                                    }

                                    function handleEvent(event, value) {
                                        // Handle the event here, for example:
                                        update(value, event.target.value);
                                    }
                                </script>
                                
                                <script>
                                    function confirmDelete1() {
                                        var message = "Bạn có chắc chắn muốn xóa tất cả khỏi giỏ hàng không?";
                                        var result = confirm(message);
                                        if (result) {
                                            // The user clicked OK, so delete the product.
                                            window.location.href = "MainController?action=deleteall";
                                        } else {
                                            // The user clicked Cancel, so do nothing.
                                        }
                                    }
                                </script>
                            </div> 

                            <div class="col-12 text-right">
                                    <button class="product_remove" style="background-color: #e74c3c; color: #fff; padding: 7px 15px; border: none; border-radius: 5px;">
                                        <a onclick="confirmDelete1()" style="text-decoration: none; color: #fff;"> Clear Cart </a>
                                    </button>
                            </div>
                        </div>

                    </div>
            </div>

            <!--coupon code area start-->
            <c:if test="${sessionScope.cart!=null}">
                <div class="coupon_area">
                    <div class="row">
                        <div class="col-lg-12 col-md-12">
                            <div class="coupon_code right">
                                <h3>Hóa đơn</h3>
                                <div class="coupon_inner">
                                    <div class="cart_subtotal">
                                        <p>Tổng đơn hàng</p>
                                        <p  id="demo"  class="cart_amount"><fmt:formatNumber pattern="##########" value="${sessionScope.cart.getTotalMoney()}"/></p>
                                    </div>
                                    <div class="cart_subtotal ">
                                        <p>Phí ship</p>
                                        <p class="cart_amount">15000</p>
                                    </div>

                                    <div class="cart_subtotal">
                                        <p>Total</p>
                                        <p id="demo2" class="cart_amount"><fmt:formatNumber pattern="##########" value="${sessionScope.cart.getTotalMoney() + 15000}"/></p>
                                    </div>
                                    <div class="checkout_btn">
                                        <a href=MainController?action=Payment>Thanh toán</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:if>
            <!--coupon code area end-->
        </form> 
    </div>     
</div>
<!-- shopping cart area end -->

<!--footer area start-->
<jsp:include page="layout/footer.jsp"/>
<!--footer area end-->

<!-- JS
============================================ -->

</body>

</html>