

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Danh sách đơn hàng | Quản trị Admin</title>
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

    </head>

    <body onload="time()" class="app sidebar-mini rtl">
        <!-- Navbar-->
        <header class="app-header">
            <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
                                            aria-label="Hide Sidebar"></a>
            <!-- Navbar Right Menu-->
            <ul class="app-nav">


                <!-- User Menu-->
                <li><a class="app-nav__item" href="dashboard"><i class='bx bx-log-out bx-rotate-180'></i> </a>

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
                <li><a class="app-menu__item" href="MainController?action=dashboard"><i class='app-menu__icon bx bx-tachometer'></i><span
                            class="app-menu__label">Bảng điều khiển</span></a></li>
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
                    <li class="breadcrumb-item active"><a href="#"><b>Danh sách đơn hàng</b></a></li>
                </ul>
                <div id="clock"></div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <div class="tile-body">
                            <div class="row element-button"
                                 <div class="col-sm-2">
                                    <a class="btn btn-delete btn-sm print-file" type="button" title="In" onclick="myApp.printTable()"><i
                                            class="fas fa-print"></i> In dữ liệu</a>
                                </div>
                            </div>
                            <table class="table table-hover table-bordered" id="sampleTable">
                                <thead>
                                    <tr>
                                        <th>ID đơn hàng</th>
                                        <th>Khách hàng</th>
                                        <th>Số điện thoại</th>
                                        <th>Địa chỉ</th>
                                        <th>Ngày mua</th>
                                        <th>Tổng tiền</th>
                                        <th>Thanh Toán</th>
                                        <th>Chi tiet</th>
                                        <th>cập nhật trạng thái đơn</th>
                                        <th>tinh nang</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${bill}" var="b">
                                        <tr>
                                            <td>${b.bill_id}</td>
                                            <td>${b.user1}</td>
                                            <td>${b.phone}</td>
                                            <td>${b.address}</td>
                                            <td>${b.date}</td>
                                            <td>${b.total +30000}</td>
                                            <td><span class="badge bg-success">${b.payment}</span></td>                                  
                                            <td><a style=" color: rgb(245 157 57);background-color: rgb(251 226 197); padding: 5px;border-radius: 5px;" href="MainController?action=showdetail&bill_id=${b.bill_id}"><i class="fa"></i>Chi tiết đơn hàng</a>
                                            
                                            </td>
                                            <td><a style=" color: rgb(245 157 57);background-color: rgb(251 226 197); padding: 5px;border-radius: 5px;" href="MainController?action=delivery&bill_id=${b.bill_id}"><i class="fa"></i>quá trình giao hàng</a>
                                            
                                            </td>
<!--                                            <td><button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                                                        data-target="#ModalUP${b.bill_id}"><i class="fas fa-edit"></i></button></td>-->

                                            <td><button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp" data-toggle="modal"
                                                        data-target="#ModalUP${b.bill_id}"><i class="fas fa-edit"></i></button>
                                            <button class="btn btn-primary btn-sm trash" type="button" title="xoa" id="show-emp" data-toggle="modal"
                                                        data-target="#ModalUP1${b.bill_id}"><i class="fas fa-trash-alt"></i></button></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </main>
                    <c:forEach items="${bill}" var="b">           
            <div class="modal fade" id="ModalUP${b.bill_id}" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
                 data-keyboard="false">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <form method="POST" action="MainController?action=updatebill">
                            <div class="modal-body">
                                <div class="row">
                                    <div class="form-group  col-md-12">
                                        <span class="thong-tin-thanh-toan">
                                            <h5>cập nhật trạng thái đơn</h5>
                                        </span>
                                    </div>
                                </div>
                                
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label for="exampleSelect1" class="control-label">trạng thái đơn</label>
                                        <input hidden name="bill_id" value="${b.bill_id}">
                                        <select name="permission" class="form-control" id="exampleSelect1">
                                            <option value="xac nhan don">xác nhận đơn </option>
                                            <option value="cho lay hang">chờ lấy hàng</option>
                                            <option value="dang giao">đang giao</option>
                                            <option value="hoan thanh">hoàn thành</option>
                                        </select>
                                    </div>
                                </div>
                                <BR>
                                <button class="btn btn-save" type="submit">Lưu lại</button>
                                <a class="btn btn-cancel" data-dismiss="modal" href="#">Hủy bỏ</a>
                                <BR>
                            </div>
                        </form>
                        <div class="modal-footer">
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
                    
                    
                    
                    
                    <c:forEach items="${bill}" var="b">           
            <div class="modal fade" id="ModalUP1${b.bill_id}" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
                 data-keyboard="false">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <form method="POST" action="MainController?action=cancelbill">
                            <div class="modal-body">
                                <div class="row">
                                    <div class="form-group  col-md-12">
                                        <span class="thong-tin-thanh-toan">
                                            <h5>hủy bỏ đơn hàng</h5>
                                        </span>
                                    </div>
                                </div>
                                
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label for="exampleSelect1" class="control-label">lý do hủy bỏ đơn hàng</label>
                                        <input hidden name="bill_id" value="${b.bill_id}">
                                        <select name="permission1" class="form-control" id="exampleSelect1">
                                            <option value="khong du hang">không đủ hàng </option>
                                            <option value="mat hang dang bi loi">mặt hàng đang bị lỗi</option>
                                            
                                        </select>
                                    </div>
                                </div>
                                <BR>
                                <button class="btn btn-save" type="submit">Lưu lại</button>
                                <a class="btn btn-cancel" data-dismiss="modal" href="#">Hủy bỏ</a>
                                <BR>
                            </div>
                        </form>
                        <div class="modal-footer">
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
        <!-- Essential javascripts for application to work-->
        <script src="admin/js/jquery-3.2.1.min.js"></script>
        <script src="admin/js/popper.min.js"></script>
        <script src="admin/js/bootstrap.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="admin/js/main.js"></script>
        <!-- The javascript plugin to display page loading on top-->
        <script src="admin/js/plugins/pace.min.js"></script>
        <!-- Page specific javascripts-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
        <!-- Data table plugin-->
        <script type="text/javascript" src="admin/js/plugins/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="admin/js/plugins/dataTables.bootstrap.min.js"></script>
        <script type="text/javascript">$('#sampleTable').DataTable();</script>
        <script>
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
            //In dữ liệu
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
    </body>

</html>
