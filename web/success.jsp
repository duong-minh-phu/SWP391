<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Trang thanh toán</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

    <!-- CSS -->
    <!-- Plugins CSS -->
    <link rel="stylesheet" href="assets/css/plugins.css">

    <!-- Main Style CSS -->
    <link rel="stylesheet" href="assets/css/style.css">

    
</head>

<body>
    <div class="off_canvars_overlay"></div>
    <jsp:include page="layout/menu.jsp" />
    <style>
            .container .mainsucess {
                margin: 50px auto;
                max-width: 600px;
                padding: 30px;
                background-color: #fff;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            h1 {
                color: #3d9970;
                margin-bottom: 20px;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
            }

            th, td {
                padding: 10px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            th {
                background-color: #f2f2f2;
            }


    </style>

    <div class="container">
        <div class="mainsucess" >
        <h1 style="text-align: center;" >Đặt hàng thành công!</h1>

        <table>
            <tr>
                <th>Tên khách hàng:</th>
                <td>${sessionScope.user.user_name}</td>
            </tr>
            <tr>
                <th>Email:</th>
                <td>${sessionScope.user.user_email}</td>
            </tr>
            <tr>
                <th>Địa chỉ:</th>
                <td>${requestScope.address}</td>
            </tr>
            <tr>
                <th>Số điện thoại:</th>
                <td>${requestScope.phone}</td>
            </tr>
            <tr>
                <th>Tổng giá trị đơn hàng:</th>
                <td>${total_payment} VND</td>
            </tr>
            <tr>
                <th>Phí ship:</th>
                <td>30000 VND</td>
            </tr>
            <tr>
                <th>Tổng đơn hàng:</th>
                <td>${total_payment + 30000} VND</td>
            </tr>
        </table>

        <p>Cảm ơn bạn đã mua hàng! Nếu có vấn đề gì vui lòng liên hệ với Shop để được giải quyết sớm nhất.</p>
        </div>
    </div>
            
    <jsp:include page="layout/footer.jsp" />

    <!-- Plugins JS -->
    <script src="assets/js/plugins.js"></script>

    <!-- Main JS -->
    <script src="assets/js/main.js"></script>
</body>

</html>
