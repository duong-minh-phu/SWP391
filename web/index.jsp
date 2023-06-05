
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="vi">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>My Shop</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
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
        <!--slider area start-->
        <div class="slider_area slider_style home_three_slider owl-carousel">
            <div class="single_slider" data-bgimg="https://wall.vn/wp-content/uploads/2020/02/hinh-anh-chim-en-23.jpg">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-12">
                            <div class="slider_content content_one">
                                <img src="assets/img/slider/content4.png" alt="">
                                <p>chào mừng đến với shop</p>
                                <a href="shop_category.jsp">Discover Now</a>
                            </div>    
                        </div>
                    </div>
                </div>    
            </div>
            <div class="single_slider" data-bgimg="https://wall.vn/wp-content/uploads/2020/02/hinh-anh-chim-en-23.jpg">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-12">
                            <div class="slider_content content_two">
                                <img src="assets/img/slider/content3.png" alt="">
                                <p>chào mừng đến với shop</p>
                                <a href="shop_category.jsp">Discover Now</a>
                            </div>    
                        </div>
                    </div>
                </div>
            </div>
            <div class="single_slider" data-bgimg="https://wall.vn/wp-content/uploads/2020/02/hinh-anh-chim-en-23.jpg">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-12">
                            <div class="slider_content content_three">
                                <img src="assets/img/slider/content5.png" alt="">
                                <p>chào mừng đến với shop</p>
                                <a href="shop_category.jsp">Discover Now</a>
                            </div>    
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--slider area end-->

        <!--banner area start-->
       

        <!--product section area start-->
       
        <!--product section area end-->
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
