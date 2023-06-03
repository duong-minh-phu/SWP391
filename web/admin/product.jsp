<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Quản lý sản phẩm</title>
    </head>
    <body>
        <div id="wrapper">

            <div id="header_product">
                <h1>Quản lý sản phẩm</h1>
            </div>

            <div id="side_bar">
                <p> Welcome,<b>${sessionScope.user.user_name}</b></p>
                <ul class="app-menu">
                    <li><a href="dashboard"><span class="app-menu__label">Bảng điều khiển</span></a></li>
                    <li><a href="customermanager"><span class="app-menu__label">Quản lý khách hàng</span></a></li>
                    <li><a href="productmanager"><span class="app-menu__label">Quản lý sản phẩm</span></a></li>
                    <li><a href="ordermanager"><span class="app-menu__label">Quản lý đơn hàng</span></a></li>
                </ul>
            </div>

            <div id="insert_product">
                <a href="productmanager?action=insert" >Tạo mới sản phẩm</a>
            </div>

            <div id="search_product">
                <form>
                    <input type="text" placeholder="Tìm kiếm...">
                    <button type="submit">Tìm kiếm</button>
                </form>
            </div>

            <div id="product_menu">
                <h2>Danh sách sản phẩm</h2>
                <table action="productmanager?action=updateproduct"  border="1">
                    <tr>
                        <th>Product ID</th>
                        <th>Product Name</th>
                        <th>Category</th>
                        <th>Price</th>
                        <th>Description</th>
                        <th>Quantity</th>
                        <th>Image</th>
                        <th>Option</th>
                    </tr>

                    <c:forEach var="p" items="${productList}">
                        <tr>
                            <td>${p.product_id}</td>
                            <td>${p.product_name}</td>
                            <td>${p.cate.category_name}</td>
                            <td>${p.product_price}</td>
                            <td>${p.product_describe}</td>
                            <td>${p.quantity}</td>
                            <td><img src="${p.img}" width="200px;"></td>
                            <td>
                                <button type="button" onclick="showConfirmDialog('${p.product_id}')">Xóa</button>
                                <button type="button" onclick="editProduct('${p.product_id}')">Sửa</button>
                            </td>
                        </tr>
                        <div id="edit_form_container">
                            <tr id="editForm_${p.product_id}" style="display:none;">
                                <td colspan="8">
                                    <form method="post" action="productmanager?action=updateproduct">
                                        <input type="hidden" name="product_id" value="${p.product_id}">

                                        <label for="productName_${p.product_id}">Product Name:</label>
                                        <input type="text" id="productName_${p.product_id}" name="product_name" value="${p.product_name}" required>

                                        <label for="category_${p.product_id}">Category:</label>
                                        <select id="category_${p.product_id}" name="categoryId">
                                            <c:forEach var="c" items="${categoryList}">
                                                <option value="${c.category_id}" ${c.category_id == p.cate.category_id ? 'selected':''}>${c.category_name}</option>
                                            </c:forEach>
                                        </select>

                                        <label for="price_${p.product_id}">Price:</label>
                                        <input type="number" id="price_${p.product_id}" name="product_price" value="${p.product_price}" required>

                                        <label for="description_${p.product_id}">Description:</label>
                                        <textarea id="description_${p.product_id}" name="product_describe" rows="5" required>${p.product_describe}</textarea>

                                        <label for="quantity_${p.product_id}">Quantity:</label>
                                        <input type="number" id="quantity_${p.product_id}" name="quantity" value="${p.quantity}" required>

                                        <<label for="image_${p.product_id}">Image:</label>
                                        <input type="file" id="image_${p.product_id}" name="img">
                                        <img id="imagePreview_${p.product_id}" src="${p.img}" >

                                        <button type="submit" id="editBtn_${p.product_id}">Update</button>
                                        <button type="button" onclick="hideEditForm('${p.product_id}')">Cancel</button>
                                    </form>
                                </td>
                            </tr>
                        </div>
                    </c:forEach>
                </table>
            </div>
            <div id="confirmDialog" style="display: none" >
                <div class="dialogBox">
                    <div class="titleBar">
                        <span class="title">Thông báo</span>
                        <button class="closeBtn">&times;</button>
                    </div>
                    <div class="content">
                        <p>Bạn có chắc chắn muốn xóa sản phẩm này không?</p>
                    </div>
                    <div class="buttonBar">
                        <button id="confirmBtn">Xác nhận</button>
                        <button id="cancelBtn">Hủy</button>
                    </div>
                </div>
            </div>
            <script>
                // Hiển thị form chỉnh sửa sản phẩm tương ứng với product_id
                function editProduct(product_id) {
                    var editForm = document.getElementById("editForm_" + product_id);
                    editForm.style.display = "table-row";
                }

                // Ẩn form chỉnh sửa sản phẩm tương ứng với product_id
                function hideEditForm(product_id) {
                    var editForm = document.getElementById("editForm_" + product_id);
                    editForm.style.display = "none";
                }
            </script>
            <script>
                function showConfirmDialog(productId) {
                    const confirmDialog = document.getElementById('confirmDialog');
                    confirmDialog.style.display = 'block';

                    const confirmBtn = document.getElementById('confirmBtn');
                    confirmBtn.onclick = function () {
                        window.location.href = "productmanager?action=deleteproduct&product_id=" + productId;
                    };

                    const cancelBtn = document.getElementById('cancelBtn');
                    cancelBtn.onclick = function () {
                        confirmDialog.style.display = 'none';
                    };

                    const closeBtn = document.querySelector('.closeBtn');
                    closeBtn.addEventListener('click', function () {
                        confirmDialog.style.display = 'none';
                    });
                    confirmDialog.addEventListener('click', function (event) {
                        event.stopPropagation();
                    });
                }
            </script>
            <script>
                const input_${p.product_id} = document.querySelector('#image_${p.product_id}');
                const preview_${p.product_id} = document.querySelector('#imagePreview_${p.product_id}');

                input_${p.product_id}.addEventListener('change', () => {
                    const file = input_${p.product_id}.files[0];
                    const reader = new FileReader();

                    reader.addEventListener('load', () => {
                        preview_${p.product_id}.src = reader.result;
                    });

                    reader.readAsDataURL(file);
                });
            </script>
            <style>

                #confirmDialog {
                    position: fixed;
                    top: 0;
                    left: 0;
                    width: 100%;
                    height: 100%;
                    background-color: rgba(0,0,0,0.5);
                }

                .dialogBox {
                    position: absolute;
                    top: 50%;
                    left: 50%;
                    transform: translate(-50%, -50%);
                    max-width: 100%;
                    max-height: 100%;
                    background-color: white;
                }

                .titleBar {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    padding: 5px 10px;
                    background-color: #2196F3;
                    color: white;
                }

                .title {
                    font-size: 20px;
                    font-weight: bold;
                }

                .closeBtn {
                    background-color: transparent;
                    border: none;
                    color: white;
                    font-size: 25px;
                    cursor: pointer;
                }

                .content {
                    padding: 10px;
                    text-align: center;
                }

                .buttonBar {
                    display: flex;
                    justify-content: space-between;
                    padding: 10px;
                    border-top: 1px solid #DDD;
                }

                #confirmBtn,
                #cancelBtn {
                    padding: 10px;
                    border: none;
                    border-radius: 5px;
                    cursor: pointer;
                }

                #confirmBtn {
                    background-color: #DC3545;
                    color: white;
                }

                #cancelBtn {
                    background-color: #28A745;
                    color: white;
                }
                * {
                    box-sizing: border-box;
                }

                body {
                    font-family: Arial, sans-serif;
                    margin: 0;
                    padding: 0;
                }

                * {
                    box-sizing: border-box;
                }

                body {
                    font-family: Arial, sans-serif;
                    margin: 0;
                    padding: 0;
                }

                /* Header styles */

                #header_product {
                    background-color: #333;
                    color: white;
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    padding: 10px 20px;
                    position: fixed;
                    top: 0;
                    left: 0;
                    right: 0;
                    z-index: 9999;
                }

                #header_product h1 {
                    margin: 0;
                    font-size: 24px;
                }

                /* Side bar styles */

                #side_bar {
                    background-color: #f2f2f2;
                    padding: 20px;
                    width: 19%;
                    position: fixed;
                    top: 30px; 
                    left: 0;
                    bottom: 0;
                    overflow: auto;
                }

                #side_bar p {
                    margin-top: 30;
                    font-weight: bold;
                }

                .app-menu {
                    list-style: none;
                    margin: 0;
                    padding: 0;
                }

                .app-menu li {
                    margin-bottom: 10px;
                }

                .app-menu__label {
                    display: block;
                    padding: 10px;
                    color: #333;
                    text-decoration: none;
                }

                /* Main content styles */

                #wrapper {
                    margin-top: 60px; /* tùy chỉnh khoảng cách giữa header và phần nội dung chính */
                    margin-left: 20%;
                    padding: 20px;
                }

                #search_product {
                    float: right;
                    margin: 20px;
                }

                #search_product form {
                    display: inline-block;
                }

                #search_product input[type="text"],
                #search_product button[type="submit"] {
                    height: 30px;
                    font-size: 14px;
                    border-radius: 3px;
                    border: none;
                    background-color: #DDD;
                    padding: 5px 10px;
                }

                #search_product input[type="text"] {
                    width: 200px;
                    margin-right: 5px;
                }

                #search_product button[type="submit"] {
                    color: #fff;
                    background-color: #888888;
                    cursor: pointer;
                    transition: all 0.3s ease-in-out;
                }

                #search_product button[type="submit"]:hover {
                    background-color: #0062cc;
                }

                #insert_product {
                    text-align: right;
                    margin: 20px;
                }

                #insert_product a {
                    display: inline-block;
                    padding: 10px 20px;
                    background-color: #5cc6ee;
                    color: black;
                    text-decoration: none;
                    border-radius: 5px;
                }

                /* Product menu styles */

                #product_menu {
                    margin: 20px;
                }

                #product_menu h2 {
                    margin-top: 0;
                    font-size: 20px;
                }

                table {
                    width: 100%;
                    border-collapse: collapse;
                }

                th, td {
                    padding: 10px;
                    text-align: left;
                }

                th {
                    background-color: #333;
                    color: white;
                }

                tr:nth-child(even) {
                    background-color: #f2f2f2;
                }

                button[type="button"] {
                    padding: 5px 10px;
                    background-color: #333;
                    color: white;
                    border: none;
                    border-radius: 5px;
                    cursor: pointer;
                    margin-right: 5px;
                }

                button[type="submit"] {
                    padding: 5px 10px;
                    background-color: #333;
                    color: white;
                    border: none;
                    border-radius: 5px;
                    cursor: pointer;
                    margin-right: 5px;
                }

                #edit_form_container input,
                #edit_form_container select,
                #edit_form_container textarea {
                    display: block;
                    margin-bottom: 10px;
                    width: 100%;
                    padding: 5px;
                    border: 1px solid #ccc;
                    border-radius: 5px;
                }

                #edit_form_container label {
                    font-weight: bold;
                }

                #edit_form_container img {
                    display: block;
                    max-width: 200px;
                    margin-top: 10px;
                }
            </style>

        </div>   
    </body>
</html>
