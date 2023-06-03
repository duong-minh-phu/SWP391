<%@page import="Entity.Category"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Thêm sản phẩm mới</title>
        <link rel="stylesheet" href="styleproduct.css">

    </head>
    <body>
        <div class="product-form">
            <form action="MainController?action=addProduct" method="post">
                <div class="product-field">
                    <h1>Thêm sản phẩm mới</h1>
                    <label for="productName">Product ID:</label>
                    <input type="text" id="productId" name="productId"><br><br>

                    <label for="productName">Product Name:</label>
                    <input type="text" id="productName" name="productName"><br><br>

                    <label for="categoryId">Category:</label>
                    <select id="categoryId" name="categoryId">
                        <%
                            List<Category> categories = (List<Category>) request.getAttribute("categoryList");
                            for (Category category : categories) {
                        %>
                        <option value="<%= category.getCategory_id()%>"><%= category.getCategory_name()%></option>
                        <%
                            }
                        %>
                    </select><br><br>

                    <label for="productPrice">Price:</label>
                    <input type="number" step="0.01" id="productPrice" name="productPrice"><br><br>

                    <label for="productDesc">Description:</label>
                    <textarea id="productDesc" name="productDesc"></textarea><br><br>

                    <label for="productQuantity">Quantity:</label>
                    <input type="number" id="productQuantity" name="productQuantity"><br><br>

                    <button type="submit">Thêm sản phẩm</button>
                    &nbsp;
                    <a href="productmanager">Hủy bỏ</a>
                </div>
                <div class="product-image-container">
                    <label for="productImage">Image:</label>
                    <input type="file" id="productImage" name="productImage">
                    <img class="product-image-preview" src="#" alt="Product Image Preview">
                </div>
            </form>
        </div>

        <script>
            function previewImage(event) {
                const reader = new FileReader();
                reader.onload = function () {
                    const imagePreview = document.querySelector(".product-image-preview");
                    imagePreview.src = reader.result;
                }
                reader.readAsDataURL(event.target.files[0]);
            }

            const imageInput = document.querySelector("#productImage");
            imageInput.addEventListener("change", previewImage);
        </script>
    </body>
</html>
