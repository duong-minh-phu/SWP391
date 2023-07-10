
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!doctype html>
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Product details</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

        <!-- CSS 
        ========================= -->
        <link rel="stylesheet" href="styleproduct.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>

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
        <div class="breadcrumbs_area product_bread">
            <div class="container">   
                <div class="row">
                    <div class="col-12">
                        <div class="breadcrumb_content">
                            <ul>
                                <li><a href="home">home</a></li>
                                <li>/</li>
                                <li>product details</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>         
        </div>
        <!--breadcrumbs area end-->

        <!--product details start-->
        <div class="product_details">
            <div class="container">

                <div class="row">
                    <div class="col-lg-5 col-md-5">
                        <div class="product-details-tab">

                            <div id="img-1" class="zoomWrapper single-zoom">
                                <a href="#">
                                    <img id="zoom1" src="${ProductData.img}" data-zoom-image="${ProductData.img}" alt="product">
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-7 col-md-7">
                        <div class="product_d_right">
                            <form action="MainController?action=addToCart&&product_id=${ProductData.product_id}" method="POST">
                                <h1>${ProductData.product_name}</h1>
                                <div class="product_price">
                                    <label>Chất lượng : </label>
                                    <% double rating = (double) request.getAttribute("RatingAV"); %>
                                    <% int integerPart = (int) rating; %>
                                    <% double decimalPart = rating - integerPart; %>
                                    <% int roundedDecimalPart = (int) Math.round(decimalPart * 10); %>
                                    <% for (int i = 0; i < integerPart; i++) { %>
                                    <i class="fa fa-star"></i>
                                    <% } %>
                                    <% if (roundedDecimalPart > 0) {%>
                                    <i class="fa fa-star-half-o"></i>
                                    <span class="rating_number">( <%= String.format("%.1f", rating)%>)/ ${RatingCount} đánh giá </span>
                                    <% } else {%>
                                    <span class="rating_number">( <%= integerPart%>)/ ${RatingCount} đánh giá </span>
                                    <% } %>
                                </div>
                                <div class="product_desc">
                                    <p> Ngày sản xuất : ${ProductData.create_date}</p>
                                </div>
                                <div class="product_desc">
                                    <p> Hạn sử dụng : ${ProductData.exp_date} (<span id="monthLeft"></span> tháng tính từ ngày sản xuất)</p>
                                </div>
                                <div class="product_desc">
                                    <p> Nhà sản xuất : ${ProductData.company}</p>
                                </div>
                                <div class="product_price">
                                    <span class="current_price">${ProductData.product_price} VNĐ</span>
                                </div>
                                <div class="product_desc">
                                    <p>${ProductData.product_describe}</p>
                                </div>
                                <div class="product_desc">
                                    <p> số lượng hàng còn lại:${ProductData.quantity}</p>
                                </div>
                                <div class="product_desc">
                                    <p style="color: red; align-content: center;">
                                        ${requestScope.detail}
                                    </p>
                                </div>
                                <c:if test="${(ProductData.quantity) != 0}">                                                                        
                                    <div class="product_variant quantity">
                                        <label>quantity</label>
                                        <input min="1" max="${ProductData.quantity}" name="quantity" type="number" value="1">
                                        <button class="button" type="submit">Thêm vào giở hàng</button>  
                                    </div>
                                </c:if>

                            </form>
                        </div>
                    </div>
                </div>
            </div>    
        </div>
        <!--product details end-->
        <!--product section area start-->
        <section class="product_section related_product">
            <div class="container">
                <div class="row">   
                    <div class="col-12">
                        <div class="section_title">
                            <h2>Sản phẩm tương tự</h2>
                        </div>
                    </div> 
                </div>    
                <div class="product_area"> 
                    <div class="row">
                        <div class="product_carousel product_three_column4 owl-carousel">
                            <c:forEach items="${ProductByCategory}" var="pc">
                                <div class="col-lg-3">
                                    <div class="single_product">
                                        <div class="product_thumb">
                                            <a class="primary_img" href="MainController?action=productdetail&product_id=${pc.product_id}"><img src="${pc.img}" alt=""></a>
                                        </div>
                                        <div class="product_content">
                                            <h3><a href="MainController?action=productdetail&product_id=${pc.product_id}">${pc.product_name}</a></h3>
                                            <span class="current_price">${pc.product_price}</span>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--product section area end-->
        <div class="customer_reviews">
            <div class="container">

                <div class="row">
                    <div class="col-lg-12">
                        <div class="section_title">
                            <h2>Đánh giá khách hàng</h2>
                        </div>
                    </div>
                </div>

                <div class="customer_review_list">
                    <div class="row">
                        <c:forEach items="${ReviewData}" var="ron">
                            <div class="col-lg-6">
                                <div class="customer_review_item">
                                    <div class="media">
                                        <div class="media-body">
                                            <h5 class="mt-0">${ron.user_name}</h5>
                                            <p>${ron.comment}</p>
                                            <div class="rating">
                                                <c:forEach begin="1" end="${ron.rate}">
                                                    <i class="fa fa-star"></i>
                                                </c:forEach>
                                            </div>
                                            <div class ="datetime">
                                                <p>${ron.date}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>

            </div>
        </div>
        <!--product info end-->

        <!--footer area start-->
        <jsp:include page="layout/footer.jsp"/>
        <!--footer area end-->

        <!-- Plugins JS -->
        <script src="assets/js/plugins.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

        <!-- Main JS -->
        <script src="assets/js/main.js"></script>
        <% if (request.getParameter("success") != null) { %>
        <script>
            alert("Đã đăng tải thành công!");
        </script>
        <% }%>
        <script>
            //            $("#submit").click(function()){
            //            swal({
            //            title: "Thanks for Contacting us..!",
            //                    text: "We Will Contact You Soon...",
            //                    icon: "success",
            //            })
            //            }
        </script>
        <script>
            function validateForm() {
                var userId = document.getElementsByName("user_id")[0].value;
                if (userId === "") {
                    // Hiển thị thông báo
                    var message = document.createElement("div");
                    message.innerHTML = "Bạn cần phải đăng nhập để thực hiện đánh giá";
                    message.style.color = "red";
                    document.body.appendChild(message);
                    // Chuyển hướng trang sau 5 giây
                    setTimeout(function () {
                        window.location.href = "login.jsp";
                    }, 5000);
                    return false;
                }
                return true;
            }
        </script>
        <style>
            .list-unstyled {
                padding-left: 0;
                list-style: none;
            }

            .customer_review_item {
                border: 1px solid #ccc;
                padding: 20px;
                margin-bottom: 30px;
                position: relative;
                overflow: hidden;
            }

            .customer_review_item:before {
                content: "";
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(255, 255, 255, 0.7);
                z-index: 1;
                opacity: 0;
                transition: all 0.3s ease;
            }

            .customer_review_item:hover:before {
                opacity: 1;
            }

            .customer_review_item h5 {
                font-size: 18px;
                color: #333;
                margin-bottom: 10px;
            }

            .customer_review_item p {
                font-size: 16px;
                color: #666;
                margin-bottom: 20px;
            }

            .rating {
                display: inline-block;
                vertical-align: middle;
                margin-right: 10px;
            }

            .datetime {
                position: absolute;
                bottom: 0px;
                right: 20px;
            }


            .fa-star {
                color: gold;
                font-size: 20px;
            }
            .fa-star-half-o{
                color: gold;
                font-size: 20px;
            }
            .rating_number{
                font-size: 18px;
            }

        </style>
        <script>
            function calculateMonthLeft() {
                var createDateStr = "${ProductData.create_date}";
                var expDateStr = "${ProductData.exp_date}";

                var createDate = new Date(createDateStr);
                var expDate = new Date(expDateStr);

                var timeDiff = expDate.getTime() - createDate.getTime();
                var monthDiff = Math.floor(timeDiff / (1000 * 60 * 60 * 24 * 30));

                document.getElementById("monthLeft").innerHTML = monthDiff;
            }

            calculateMonthLeft();
        </script>
    </body>

</html>
