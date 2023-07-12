<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Danh sách sản phẩm | Quản trị Admin</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Main CSS-->
        <link rel="stylesheet" type="text/css" href="admin/css/main.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <!-- or -->
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">

        <!-- Font-icon css-->
        <link rel="stylesheet" type="text/css"
              href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>

    <body onload="time()" class="app sidebar-mini rtl">
        <!-- Navbar-->
        <header class="app-header">
            <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
                                            aria-label="Hide Sidebar"></a>
            <!-- Navbar Right Menu-->
            <ul class="app-nav">


                <!-- User Menu-->
                <li><a class="app-nav__item" href="MainController?action=dashboard"><i class='bx bx-log-out bx-rotate-180'></i> </a>

                </li>
            </ul>
        </header>
        <!-- Sidebar menu-->
        <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
        <aside class="app-sidebar">
            <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="admin/images/user.png" width="50px"
                                                alt="User Image">
                <div>
                    <p class="app-sidebar__user-name"><b>${sessionScope.user.user_name}</b></p>
                    <p class="app-sidebar__user-designation">Chào mừng bạn trở lại</p>
                </div>
            </div>

            <hr>
            <ul class="app-menu">
                <li><a class="app-menu__item" href="Productmanager"><i
                            class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Quản lý sản phẩm</span></a>
                <li><a class="app-menu__item" href="MainController?action=blogmanagement"><i
                            class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Quản lý Blog</span></a>
                </li>
                <li><a class="app-menu__item" href="MainController?action=feedbackmanager"><i class='app-menu__icon bx bx-like'></i><span
                            class="app-menu__label">Quản lý Feedback</span></a></li>
                <li><a class="app-menu__item" href="MainController?action=billmana"><i class='app-menu__icon bx bx-task'></i><span
                            class="app-menu__label">Quản lý đơn hàng</span></a></li>
                <li><a class="app-menu__item" href="MainController?action=billmana1"><i class='app-menu__icon bx bx-task'></i><span
                            class="app-menu__label">Quản lý đơn hàng bị hủy</span></a></li>
            </ul>
        </aside>
        <main class="app-content">
            <div class="app-title">
                <ul class="app-breadcrumb breadcrumb side">
                    <li class="breadcrumb-item active"><a href="#"><b>Danh sách sản phẩm</b></a></li>
                </ul>
                <div id="clock"></div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <div class="tile-body">
                            <div class="row element-button">
                                <div class="col-sm-2">
                                    <a class="btn btn-add btn-sm" href="MainController?action=insert" title="Thêm"><i class="fas fa-plus"></i>
                                        Tạo mới sản phẩm</a>
                                </div>
                                <div class="col-sm-2">
                                    <a class="btn btn-add btn-sm" href="MainController?action=productdelete" >Sản phẩm đã hết hàng</a>
                                </div>
                                <div class="col-sm-2">
                                    <a class="btn btn-add btn-sm" href="MainController?action=productdate" >Sản phẩm sắp đến hạn</a>
                                </div>
                                <div class="col-sm-2">
                                    <a class="btn btn-add btn-sm" href="MainController?action=outdate" >Sản phẩm quá hạn</a>
                                </div>
                                <div class="col-sm-2">
                                    <a class="btn btn-add btn-sm" href="MainController?action=categorymana">Quản lý danh mục</a>
                                </div>
                            </div>
                            <form action="MainController?action=updateproduct" method="POST" enctype="multipart/form-data">
                                <table class="table table-hover table-bordered" id="sampleTable">
                                    <thead>
                                        <tr>
                                            <th>Danh mục</th>
                                            <th>Tên sản phẩm</th>
                                            <th>Giá</th>
                                            <th>Thông tin</th>
                                            <th>Số lượng</th>
                                            <th>Hạn</th>
                                            <th>Hãng</th>
                                            <th>Ảnh</th>
                                            <th>Total</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${ProductData}" var="p">
                                            <tr>
                                                <td>${p.cate.category_name}</td>
                                                <td>${p.product_name}</td>
                                                <td>${p.product_price}</td>
                                                <td>${p.product_describe}</td>
                                                <td>${p.quantity}</td>
                                                <td>${p.exp_date}</td>
                                                <td>${p.company}</td>
                                                <td><img src="${p.img}" alt="" width="100px;"></td>

                                                <td>
                                                    ${p.quantity * p.product_price}
                                                </td>
                                            </tr>

                                    </c:forEach>
                                    <c:forEach items="${ProductDelete}" var="p">
                                        <tr>
                                            <td>${p.cate.category_name}</td>
                                            <td>${p.product_name}</td>
                                            <td>${p.product_price}</td>
                                            <td>${p.product_describe}</td>
                                            <td>${p.quantity}</td>
                                            <td>${p.count} ngày</td>
                                            <td>${p.company}</td>
                                            <td><img src="${p.img}" alt="" width="200px;"></td>

                                            <td>
                                                <button class="btn btn-primary btn-sm trash" type="button" title="Phục hồi" value="${p.product_id}"><i class="fa-solid fa-recycle"></i>
                                                </button>  
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <% if (session.getAttribute("successMessage") != null) { %>
        <div id="popup" class="popup">
            <div class="popup-content">
                <span class="close-button">&times;</span>
                <div class="alert alert-success">
                    <% out.println(session.getAttribute("successMessage")); %>
                </div>
            </div>
        </div>
        <% session.removeAttribute("successMessage"); %>
        <% }%>
        <style>
            .popup {
                display: none;
                position: fixed;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                z-index: 9999;
            }
            .popup-content {
                position: fixed;
                left: 50%;
                top: 50%;
                transform: translate(-50%, -50%);
                padding: 20px;
                width: 70%;
                max-width: 500px;
                background-color: #fefefe;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            }
            .close-button {
                position: absolute;
                top: -15px;
                right: -15px;
                font-size: 24px;
                font-weight: bold;
                color: white;
                cursor: pointer;
                background-color: red;
                border-radius: 50%;
                width: 35px;
                height: 35px;
                display: flex;
                justify-content: center;
                align-items: center;
                z-index: 1;
            }
            .alert {
                padding: 15px;
                margin-bottom: 1px;
                border: 1px solid transparent;
                border-radius: 4px;
            }
            .alert-success {
                color: #155724;
                background-color: #d4edda;
                border-color: #c3e6cb;
            }
        </style>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                var popup = document.getElementById("popup");
                var closeButton = document.querySelector(".close-button");
                // Hiển thị popup
                popup.style.display = "block";
                // Xử lý sự kiện khi nhấp vào nút đóng
                closeButton.addEventListener("click", function () {
                    popup.style.display = "none";
                });
            });
        </script>



        <!-- Essential javascripts for application to work-->
        <script src="admin/js/jquery-3.2.1.min.js"></script>
        <script src="admin/js/popper.min.js"></script>
        <script src="admin/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="admin/js/main.js"></script>
        <!-- The javascript plugin to display page loading on top-->
        <script src="admin/js/plugins/pace.min.js"></script>
        <!-- Page specific javascripts-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
        <!-- Data table plugin-->
        <script type="text/javascript" src="admin/js/plugins/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="admin/js/plugins/dataTables.bootstrap.min.js"></script>
        <script type="text/javascript">
            $('#sampleTable').DataTable();
            //Thời Gian
            function time() {
                var today = new Date();
                var weekday = new Array(7);
                weekday[0] = "Chủ Nhật";
                weekday[1] = "Thứ Hai";
                weekday[2] = "Thứ Ba";
                weekday[3] = "Thứ Tư";
                weekday[4] = "Thứ Năm";
                weekday[5] = "Thứ Sáu";
                weekday[6] = "Thứ Bảy";
                var day = weekday[today.getDay()];
                var dd = today.getDate();
                var mm = today.getMonth() + 1;
                var yyyy = today.getFullYear();
                var h = today.getHours();
                var m = today.getMinutes();
                var s = today.getSeconds();
                m = checkTime(m);
                s = checkTime(s);
                nowTime = h + " giờ " + m + " phút " + s + " giây";
                if (dd < 10) {
                    dd = '0' + dd
                }
                if (mm < 10) {
                    mm = '0' + mm
                }
                today = day + ', ' + dd + '/' + mm + '/' + yyyy;
                tmp = '<span class="date"> ' + today + ' - ' + nowTime +
                        '</span>';
                document.getElementById("clock").innerHTML = tmp;
                clocktime = setTimeout("time()", "1000", "Javascript");
                function checkTime(i) {
                    if (i < 10) {
                        i = "0" + i;
                    }
                    return i;
                }
            }
        </script>
        <script>
            $(document).ready(jQuery(function () {
                jQuery(".trash").click(function () {
                    swal({
                        title: "Cảnh báo",
                        text: "Bạn có chắc chắn là muốn xóa sản phẩm này?",
                        buttons: ["Hủy bỏ", "Đồng ý"],
                    })
                            .then((willDelete) => {
                                if (willDelete) {
                                    window.location = "MainController?action=deleteproduct&product_id=" + $(this).attr("value");
                                    swal("Đã xóa thành công !!!!", {
                                    });
                                }
                            });
                });
            }));
        </script>
        <script>
            $(document).ready(jQuery(function () {
                $('button[title="Phục hồi"]').click(function () {
                    swal({
                        title: "Cảnh báo",
                        text: "Bạn có chắc chắn là muốn phục hồi sản phẩm này?",
                        buttons: ["Hủy bỏ", "Đồng ý"],
                    })
                            .then((willDelete) => {
                                if (willDelete) {
                                    window.location = "MainController?action=recoverproduct&product_id=" + $(this).attr("value");
                                    swal("Đã Phục hồi thành công !", {
                                    });
                                }
                            });
                });
            }));
        </script>
        <script>
            var myApp = new function () {
                this.printTable = function () {
                    var tab = document.getElementById('sampleTable');
                    var win = window.open('', '', 'height=700,width=700');
                    win.document.write(tab.outerHTML);
                    win.document.close();
                    win.print();
                }
            }
        </script>
        <script>
            $(document).ready(function () {
                $(".edit").click(function () {
                    // Get the product ID from the data-product-id attribute
                    var product_id = $(this).data("product-id");
                    // Redirect the user to the edit product page
                    window.location = "MainController?action=updateProduct&product_id=" + product_id;
                });
            });
        </script>
    </body>

</html>