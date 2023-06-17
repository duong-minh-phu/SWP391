

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!doctype html>
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Blog detail</title>
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
                                    <img id="" src="${BlogData.img}" data-zoom-image="${BlogData.img}" alt="product">
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-7 col-md-7">
                        <div class="product_d_right">
                            <form action="MainController?action=addToCart&&product_id=${BlogData.blog_id}" method="POST">
                                <h1>${BlogData.blog_name}</h1>
                                <h1>người đăng: ${BlogData.user}</h1>
                                <div class="product_price">
                                    <span class="current_price"> ngày đăng :${BlogData.date} </span>
                                </div>
                                <div class="product_desc">
                                    <p>${BlogData.blog_describe}</p>
                                </div>
                                
                                
                            </form>
                        </div>
                    </div>
                </div>
            </div>    
        </div>
        <!--product details end-->
        <!--product info end-->
        
        
            
             <c:forEach items="${BlogCommentByid}" var="c">    
                                                <div>
            <div class="comment-body">
                  <h4>${c.user_name}</h4>
                  <div class="meta">${c.date}</div>
                  <p>${c.comment}</p>
                  
                </div>                  
                  </div>
            </c:forEach>  
        </div>
        
        
        
        
        <form action="MainController?action=blogcomment&&blog_id=${BlogData.blog_id}" method="POST">
        <div>
            <h1>bình luận</h1>
            <input name="blograting" type="text"  required="">
            <button type="submit" >gửi</button>
        </div>
        </form>
        <!--product section area start-->
        
        <!--product section area end-->

        <!--footer area start-->
        <jsp:include page="layout/footer.jsp"/>
        <!--footer area end-->
        
        <!-- Plugins JS -->
        <script src="assets/js/plugins.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

        <!-- Main JS -->
        <script src="assets/js/main.js"></script>
        <script>
//            $("#submit").click(function()){
//            swal({
//            title: "Thanks for Contacting us..!",
//                    text: "We Will Contact You Soon...",
//                    icon: "success",
//            })
//            }
        </script>
    </body>

</html>
