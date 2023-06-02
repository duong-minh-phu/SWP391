

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>About us page</title>
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
                            <li>Giới thiệu</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>         
    </div>
    <!--breadcrumbs area end-->
    
        <!--about section area -->
    <div class="about_section">
        <div class="container">  
            <div class="row">
                <div class="col-lg-6 col-md-12">
                    <div class="about_content">
                        <h1>Chào mừng bạn đến với FPT shop!</h1>
                        <p> Chào mừng bạn đến với trang web bán đồ ăn cho chim của chúng tôi! Đây là nơi tuyệt vời để bạn có thể tìm kiếm các loại thức ăn và món đồ chơi đa dạng cho các loài chim cảnh của mình.</p>
                        <p>Với nhiều năm kinh nghiệm trong lĩnh vực cung cấp thực phẩm cho các loài chim, chúng tôi tự hào mang đến cho khách hàng một bộ sưu tập đa dạng và phong phú các sản phẩm tốt nhất cho các loài chim cảnh của bạn, đảm bảo chúng được bổ sung các chất dinh dưỡng cần thiết để phát triển và duy trì sức khỏe.</p>
                        <p>Các sản phẩm của chúng tôi bao gồm các loại hạt giống tươi ngon, thức ăn hỗn hợp, các loại rau và quả tươi, bơ và sản phẩm mát-xa, hay các loại đồ chơi giúp các loại chim của bạn vui chơi, giảm stress và phát triển cả về thể chất lẫn tinh thần.</p>

                        <p>    Đặc biệt, chúng tôi có những chính sách ưu đãi hấp dẫn, giúp bạn có thể mua các sản phẩm với giá ưu đãi, hỗ trợ giao hàng tận nhà nhanh chóng và miễn phí vận chuyển cho đơn hàng từ một mức giá nhất định.</p>

                        <p>Chúng tôi luôn đặt khách hàng làm trung tâm và đảm bảo mang đến cho bạn sản phẩm chất lượng, giá cả hợp lý và dịch vụ tận tâm nhất. Hãy truy cập trang web của chúng tôi và cho chúng tôi cơ hội phục vụ các loài chim của bạn.</p>
                    </div>
                </div>
                <div class="col-lg-6 col-md-12">
                    <div class="about_thumb">
                        <img src="assets/img/about/about.jpg" alt="">
                    </div>
                </div>
            </div>
        </div>     
    </div>
    <!--about section end-->
   
    <jsp:include page="layout/footer.jsp"/>

<!-- JS
============================================ -->

<!-- Plugins JS -->
<script src="assets/js/plugins.js"></script>

<!-- Main JS -->
<script src="assets/js/main.js"></script>



</body>

</html>