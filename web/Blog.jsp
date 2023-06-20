<%-- 
    Document   : Blog
    Created on : Jun 8, 2023, 6:10:52 PM
    Author     : ROG STRIX
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Blog</title>
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
        <div class="breadcrumbs_area">
            <div class="container">   
                <div class="row">
                    <div class="col-12">
                        <div class="breadcrumb_content">
                            <ul>
                                <li><a href="home">Trang chủ</a></li>
                                <li>/</li>
                                <li>Blog</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>         
        </div>
        <!--breadcrumbs area end-->

        <!--shop  area start-->
        <div class="shop_area shop_reverse">
            <div class="container">
                <div class="shop_inner_area">
                    <div class="row">
                        <div class="col-lg-3 col-md-12">
                            <!--sidebar widget start-->
                            
                            <!--sidebar widget end-->
                        </div>
                        <div class="col-lg-9 col-md-12">
                            <!--shop wrapper start-->
                            <!--shop toolbar start-->
                            
                            <c:forEach items="${BlogData}" var="b">
                            <div class="blog-entry d-flex blog-entry-search-item">
                                <a href="MainController?action=blogdetails&blog_id=${b.blog_id}" class="img-link me-4">
                                    <img src="${b.img}" alt="Image" width="200px;" height="200px;" class="img-fluid">
                                </a>
                                <div>
                                  <span class="date">${b.date} &bullet; <a href="#">${b.user}</a></span>
                                  <h2><a href="MainController?action=blogdetails&blog_id=${b.blog_id}">${b.blog_name}</a></h2>
<!--                                  <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Unde, nobis ea quis inventore vel voluptas.</p>-->
                                  <p><a href="MainController?action=blogdetails&blog_id=${b.blog_id}" class="btn btn-sm btn-outline-primary">Read More</a></p>
                                </div>
                              </div>
                             </c:forEach>
<!--                            <div class="row shop_wrapper">
                                <c:forEach items="${BlogData}" var="b">
                                    <div class="col-lg-4 col-md-4 col-12 ">
                                        <div class="single_product">
                                            <div class="product_thumb">
                                                <a class="primary_img" href="MainController?action=blogdetails&blog_id=${b.blog_id}"><img src="${b.img}" alt=""></a>

                                                <div class="quick_button">
                                                    <a href="MainController?action=blogdetails&blog_id=${b.blog_id}"title="quick_view">Xem sản phẩm</a>
                                                </div>
                                            </div>

                                            <div class="product_content grid_content">
                                                <h3><a href="MainController?action=blogdetails&blog_id=${b.blog_id}">${b.blog_name}</a></h3>
                                                <span class="current_price">${b.date}</span>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>-->
                            <c:if test="${num1 != 1}"> 
                            <c:set var="page" value="${page1}"/>
                            <div class="shop_toolbar t_bottom" style="border: none;">
                                <div class="pagination">
                                    <ul>
                                        <c:forEach begin="${1}" end="${num1}" var="i">
                                            <li class="${i==page1?"current":""}"><a href="MainController?action=blog&page1=${i}">${i}</a></li>
                                            </c:forEach>

                                    </ul>
                                </div>
                            </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--shop  area end-->

        <!--footer area start-->
        <jsp:include page="layout/footer.jsp"/>
        <!--footer area end-->

        <!-- Plugins JS -->
        <script src="assets/js/plugins.js"></script>

        <!-- Main JS -->
        <script src="assets/js/main.js"></script>
    </body>

</html>
