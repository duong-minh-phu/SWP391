

<%@page import="java.text.SimpleDateFormat"%>
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
                                            <a class="primary_img" href="product?action=productdetail&product_id=${pc.product_id}"><img src="${pc.img}" alt=""></a>
                                        </div>
                                        <div class="product_content">
                                            <h3><a href="product?action=productdetail&product_id=${pc.product_id}">${pc.product_name}</a></h3>
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

                <div class="row">
                    <div class="col-lg-6">
                        <div class="review_form_wrapper">
                            <h3>Viết đánh giá của bạn</h3>
                            <form action="MainController?action=addReview" method="POST" onSubmit="return validateForm()">

                                <input type="hidden" name="product_review_id" value="${ProductData.product_id}">
                                <input type="hidden" name="user_id" value="${sessionScope.user.user_id}">
                                <%
                                    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                                    String formattedDate = dateFormat.format(new java.util.Date());
                                %>
                                <input type="hidden" name="review_date" value="<%= formattedDate%>">
                                <div class="form-group">
                                    <label for="rating">Đánh giá của bạn:</label>
                                    <select class="form-control" id="rating" name="rating">
                                        <option value="5">5 sao</option>
                                        <option value="4">4 sao</option>
                                        <option value="3">3 sao</option>
                                        <option value="2">2 sao</option>
                                        <option value="1">1 sao</option>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="review">Nhận xét của bạn:</label>
                                    <textarea class="form-control" rows="5" id="review" name="review"></textarea>
                                </div>

                                <button type="submit" class="btn btn-primary">Gửi đánh giá</button>

                            </form>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="customer_review_list">
                            <h3>Đánh giá của khách hàng</h3>
                            <ul class="list-unstyled">
                                <c:forEach items="${reviewList}" var="r">
                                    <li>
                                        <div class="review_item">
                                            <div class="rating_wrap">

                                                <div class="star_rating">
                                                    <span style="width:${r.rating * 20}%"></span>
                                                </div>

                                            </div>
                                            <p>${r.review}</p>
                                            <div class="review_user">
                                                <span>Product: ${r.product_name}</span>
                                                <span>By: ${r.customer_name}</span>
                                                <span>Rating: ${r.rating}</span>
                                                <span>Date: ${r.review_date}</span>
                                            </div>
                                        </div>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
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
    </body>

</html>
