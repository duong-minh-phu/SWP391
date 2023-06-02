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
                <p> Welcome,<b>${sessionScope.user.user_name}</b></p>
            </div>

            <div id="insert_product">
                <a href="productmanager?action=insert" >Tạo mới sản phẩm</a>
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

                                        <label for="image_${p.product_id}">Image:</label>
                                        <input type="file" id="image_${p.product_id}" name="img">
                                        <img id="imagePreview_${p.product_id}" src="${p.img}" style="max-width:600px; max-height:600px">

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
                const input = document.querySelector('#image_${p.product_id}');
                const preview = document.querySelector('#imagePreview_${p.product_id}');

                input.addEventListener('change', () => {
                    const file = input.files[0];
                    const reader = new FileReader();

                    reader.addEventListener('load', () => {
                        preview.src = reader.result;
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
                /* Global Styles */
                html {
                    font-family: Arial, sans-serif;
                    font-size: 16px;
                }
                body {
                    margin: 0;
                    padding: 0;
                }

                /* Header Styles */
                #header_product {
                    background-color: #333;
                    color: #fff;
                    padding: 10px;
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                }
                #header_product h1 {
                    margin: 0;
                }
                #header_product p {
                    margin: 0;
                    font-weight: bold;
                }

                /* Insert Product Styles */
                #insert_product a {
                    display: block;
                    width: 150px;
                    background-color: #007bff;
                    color: #fff;
                    text-align: center;
                    padding: 10px;
                    border-radius: 5px;
                    margin: 20px auto;
                    text-decoration: none;
                }

                /* Product Menu Styles */
                #product_menu {
                    margin: 20px auto;
                }
                #product_menu h2 {
                    font-size: 24px;
                    margin: 0;
                }
                #product_menu table {
                    width: 100%;
                    border-collapse: collapse;
                }
                #product_menu th,
                #product_menu td {
                    padding: 10px;
                    text-align: center;
                }
                #product_menu th {
                    background-color: #eee;
                }
                #product_menu tr:nth-child(even) {
                    background-color: #f2f2f2;
                }
                #product_menu img {
                    max-width: 100px;
                }
                #product_menu button {
                    padding: 5px 10px;
                    border-radius: 5px;
                    margin-right: 10px;
                }
                #product_menu form label {
                    display: block;
                    margin-bottom: 10px;
                }
                #product_menu form input[type="text"],
                #product_menu form select,
                #product_menu form textarea,
                #product_menu form input[type="number"] {
                    width: 95%;
                    padding: 5px;
                    border-radius: 5px;
                    border: 1px solid #ccc;
                    margin-bottom: 10px;
                }
                #product_menu form button[type="submit"],
                #product_menu form button[type="button"] {
                    background-color: #007bff;
                    color: #fff;
                    border: none;
                    padding: 10px;
                    border-radius: 5px;
                    cursor: pointer;
                }
                #product_menu form button[type="button"] {
                    background-color: #dc3545;
                }
                #edit_form_container {
                    overflow: auto;
                }
            </style>

        </div>   
    </body>
</html>

