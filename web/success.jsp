<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thành công</title>
<ul class="home">
                            <a href="home">Home</a>
                            <a>/<a>
                            <a>Thanh toán thành công</a>
                        </ul>
    <style>
        .home{
            margin-left: 20px;
        }
        
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            padding: 50px;
            background-color: white;
        }
        h1 {
            color: #3d9970;
            margin-bottom: 20px;
        }
        .container {
            margin: 0 auto;
            max-width: 600px;
            background-color: #fff;
            border: 1px solid #000;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
        p {
            font-size: 18px;
            margin-top: 30px;
        }
        .breadcrumbs_area {
            padding: 10px 0;
            background-color: #f9f9f9;
        }
        .breadcrumbs_area ul li {
            display: inline-block;
            list-style: none;
            font-size: 14px;
            color: #999;
        }
        .breadcrumbs_area ul li:before {
            content: "/";
            padding: 0 5px;
        }
        .breadcrumbs_area ul li:first-child:before {
            display: none;
        }
        .breadcrumbs_area ul li a {
            color: #999;
        }
        .breadcrumbs_area ul li a:hover {
            color: #3d9970;
        }
    </style>
</head>
<body>
    <div class="off_canvars_overlay"></div>
 
    <div class="container">
        <h1>Đặt hàng thành công!</h1>

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
                <td>${dao.address}</td>
            </tr>
            <tr>
                <th>Số điện thoại:</th>
                <td>${sessionScope.phone}</td>
            </tr>
            <tr>
                <th>Tổng giá trị đơn hàng:</th>
                <td>${sessionScope.cart.getTotalMoney()} VND</td>
            </tr>
            <tr>
                <th>Phí ship:</th>
                <td>30000 VND</td>
            </tr>
            <tr>
                <th>Tổng đơn hàng:</th>
                <td>${sessionScope.cart.getTotalMoney() + 30000} VND</td>
            </tr>
        </table>

        <p>Cảm ơn bạn đã mua hàng!</p>
    </div>
</body>
</html>
