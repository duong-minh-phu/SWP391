/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Context.DBContext;
import Entity.Category;
import Entity.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ROG STRIX
 */
public class productDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Product> getProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "select c.category_name , p.product_id , p.product_name, p.product_price, p.product_describe, p.quantity,p.img from  \n"
                + "product p inner join category c on p.category_id = c.category_id and p.status='TRUE'";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getString(1));
                list.add(new Product(c, rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getString(5), rs.getInt(6), rs.getString(7)));
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getProduct50() {
        List<Product> list = new ArrayList<>();
        String sql = "select c.category_name , p.product_id , p.product_name, p.product_price, p.product_describe, p.quantity,p.img from \n"
                + "                product p inner join category c on p.category_id = c.category_id and p.status='TRUE' and p.quantity<50";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getString(1));
                list.add(new Product(c, rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getString(5), rs.getInt(6), rs.getString(7)));
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getProductDelete() {
        List<Product> list = new ArrayList<>();
        String sql = "select c.category_name , p.product_id , p.product_name, p.product_price, p.product_describe, p.quantity,p.img,p.company,p.create_date,p.exp_date from  \n"
                + "product p inner join category c on p.category_id = c.category_id and p.status='FALSE'";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getString(1));
                LocalDate createDate = rs.getDate(9).toLocalDate(); // Lấy create_date từ ResultSet
                LocalDate expDate = rs.getDate(10).toLocalDate(); // Lấy exp_date từ ResultSet

                long monthsRemaining = ChronoUnit.DAYS.between(LocalDate.now(), expDate);

                if (monthsRemaining >= 0) {
                    list.add(new Product(c, rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getString(8), monthsRemaining));
                }
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public void insertProduct(Product product) {
        String sql = "insert dbo.product(product_id,category_id,product_name,product_price,product_describe,quantity,img,status,create_date,exp_date,company) values(?,?,?,?,?,?,?,?,?,?,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, product.getProduct_id());
            ps.setInt(2, product.getCate().getCategory_id());
            ps.setString(3, product.getProduct_name());
            ps.setFloat(4, product.getProduct_price());
            ps.setString(5, product.getProduct_describe());
            ps.setInt(6, product.getQuantity());
            ps.setString(7, product.getImg());
            ps.setString(8, "TRUE");
            ps.setDate(9, product.getCreate_date());
            ps.setDate(10, product.getExp_date());
            ps.setString(11, product.getCompany());
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void InsertProduct(String product_id, int category_id, String product_name, float product_price, String product_describe, int quantity, String img) {
        try {
            String query = "insert dbo.product(product_id,category_id,product_name,product_price,product_describe,quantity,img,status) values(?,?,?,?,?,?,?,TRUE)";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);

            ps.setString(1, product_id);
            ps.setInt(2, category_id);
            ps.setString(3, product_name);
            ps.setFloat(4, product_price);
            ps.setString(5, product_describe);
            ps.setInt(6, quantity);
            ps.setString(7, img);
            ps.executeUpdate();
        } catch (Exception e) {
        };
    }

    public void RecoverProduct(String product_id) {
        String sq = "update product set status=? where product_id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sq);
            ps.setString(1, "True");
            ps.setString(2, product_id);
        } catch (Exception e) {
        }

    }

    public void deleteProduct(String product_id) {
        String sq2 = "UPDATE product SET status = ? WHERE product_id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sq2);
            ps.setString(1, "FALSE");
            ps.setString(2, product_id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void updateProduct(Product product) {
        String sq3 = "update product set category_id=? ,product_name=?,company=? ,product_price=? ,product_describe=? ,quantity=? ,img=? where product_id=? and status='TRUE'";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sq3);
            ps.setInt(1, product.getCate().getCategory_id());
            ps.setString(2, product.getProduct_name());
            ps.setString(3, product.getCompany());
            ps.setFloat(4, product.getProduct_price());
            ps.setString(5, product.getProduct_describe());
            ps.setInt(6, product.getQuantity());
            ps.setString(7, product.getImg());
            ps.setString(8, product.getProduct_id());
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateProduct2(Product product) {
        String sq = "update product set category_id=? ,product_name=?,company=? ,product_price=? ,product_describe=? ,quantity=?  where product_id=? and status='TRUE'";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sq);
            ps.setInt(1, product.getCate().getCategory_id());
            ps.setString(2, product.getProduct_name());
            ps.setString(3, product.getCompany());
            ps.setFloat(4, product.getProduct_price());
            ps.setString(5, product.getProduct_describe());
            ps.setInt(6, product.getQuantity());
            ps.setString(7, product.getProduct_id());
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Category> getCategory() {
        List<Category> list = new ArrayList<>();
        String sql = "select * from category";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Category> getCategory1() {
        List<Category> list = new ArrayList<>();
        String sql = "SELECT c.category_id, c.category_name, COUNT(p.product_id) AS product_count "
                + "FROM category AS c "
                + "LEFT JOIN product AS p ON c.category_id = p.category_id AND p.status = 'TRUE'"
                + "WHERE c.category_status = 'True' "
                + "GROUP BY c.category_id, c.category_name";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1), rs.getString(2), rs.getInt(3)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Category> getCategory2() {
        List<Category> list = new ArrayList<>();
        String sql = "SELECT c.category_id, c.category_name, COUNT(p.product_id) AS product_count "
                + "FROM category AS c "
                + "LEFT JOIN product AS p ON c.category_id = p.category_id AND p.status = 'FALSE'"
                + "WHERE c.category_status = 'False' "
                + "GROUP BY c.category_id, c.category_name";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1), rs.getString(2), rs.getInt(3)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Category getCategoryByName(String name) {
        String sql = "select * from Categories where category_name = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Category(rs.getInt(1), rs.getString(2));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Entity.Category getCategoryByName1(String category_name) {
        String sql = "SELECT * FROM category WHERE category_name = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, category_name);
            rs = ps.executeQuery();

            if (rs.next()) {
                int categoryId = rs.getInt("category_id");
                String categoryName = rs.getString("category_name");

                return new Entity.Category(categoryId, categoryName);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception ex) {
            Logger.getLogger(productDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public List<Product> getProductLow() {
        List<Product> list = new ArrayList<>();
        String sql = "select c.category_name , p.product_id , p.product_name, p.product_price, p.product_describe, p.quantity,p.img from product p inner join category c on p.category_id = c.category_id and p.status='TRUE' ORDER BY p.product_price ASC";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getString(1));
                list.add(new Product(c, rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getString(5), rs.getInt(6), rs.getString(7)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getProductHigh() {
        List<Product> list = new ArrayList<>();
        String sql = "select c.category_name , p.product_id , p.product_name, p.product_price, p.product_describe, p.quantity,p.img from product p inner join category c on p.category_id = c.category_id and p.status='TRUE' ORDER BY p.product_price DESC";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getString(1));
                list.add(new Product(c, rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getString(5), rs.getInt(6), rs.getString(7)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getProductAZ() {
        List<Product> list = new ArrayList<>();
        String sql = "select c.category_name , p.product_id , p.product_name, p.product_price, p.product_describe, p.quantity,p.img from product p inner join category c on p.category_id = c.category_id and p.status='TRUE' ORDER BY p.product_name";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getString(1));
                list.add(new Product(c, rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getString(5), rs.getInt(6), rs.getString(7)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public void insertCategory(String name) {
        String sql = "INSERT INTO Category (category_id, category_name,category_status) VALUES ((SELECT COUNT(*) FROM Category) + 1, ?, ?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, "True");
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Product> getListByPage(List<Product> list,
            int start, int end) {
        ArrayList<Product> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public List<Product> getProductByCategory(int category_id) {
        List<Product> list = new ArrayList<>();
        String sql = "select c.category_name , p.product_id , p.product_name, p.product_price, p.product_describe, p.quantity,p.img from product p inner join category c on p.category_id = c.category_id WHERE p.category_id=? and p.status='TRUE'";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, category_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getString(1));
                list.add(new Product(c, rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getString(5), rs.getInt(6), rs.getString(7)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public Product getProductByID(String product_id) {
        List<Product> list = new ArrayList<>();
        String sql = "select c.category_id, c.category_name , p.product_id , p.product_name, p.product_price, p.product_describe, p.quantity,p.img from product p inner join category c on p.category_id = c.category_id WHERE p.product_id=? and p.status='TRUE'";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, product_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getInt(1), rs.getString(2));
                return (new Product(c, rs.getString(3), rs.getString(4), rs.getFloat(5), rs.getString(6), rs.getInt(7), rs.getString(8)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public Product getProductByID2(String product_id) {
        String sql = "select c.category_id, c.category_name , p.product_id , p.product_name, p.product_price, p.product_describe, p.quantity,p.img,p.create_date,p.exp_date,p.company from product p inner join category c on p.category_id = c.category_id WHERE p.product_id=? and p.status='TRUE'";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, product_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                Category c = new Category(rs.getInt(1), rs.getString(2));
                return new Product(c, rs.getString(3), rs.getString(4), rs.getFloat(5), rs.getString(6), rs.getInt(7), rs.getString(8), rs.getDate(9), rs.getDate(10), rs.getString(11));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public int CountProduct() {
        int count = 0;
        String sql = "SELECT COUNT(*) as 'count'\n"
                + "  FROM product";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return count;
    }

    public int CountUser() {
        int count = 0;
        String sql = "SELECT COUNT(*) as 'count'\n"
                + "  FROM users where isAdmin = 'False' or isAdmin = 'FALSE' ";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return count;
    }

    public int CountBill() {
        int count = 0;
        String sql = "SELECT COUNT(*) as 'count'\n"
                + "  FROM bill";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return count;
    }

    public int CountProductLow() {
        int count = 0;
        String sql = "SELECT COUNT(*) as 'count'\n"
                + "  FROM product where quantity < 50 ";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return count;
    }

    public List<Product> SearchAll(String text) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT DISTINCT c.category_name , p.product_id , p.product_name, p.product_price, p.product_describe, p.quantity,p.img \n"
                + " FROM product p inner join category c on c.category_id = p.category_id \n"
                + "WHERE p.status='TRUE' and  product_name LIKE ? OR  product_price LIKE ?  OR c.category_name LIKE ?";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + text + "%");
            ps.setString(2, "%" + text + "%");

            ps.setString(3, "_%" + text + "%_");
            rs = ps.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getString(1));
                list.add(new Product(c, rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getString(5), rs.getInt(6), rs.getString(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getTop10Product() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT TOP 10 p.product_id , p.product_name, p.product_price, p.product_describe, p.quantity,p.img FROM product p where p.status='TRUE' ORDER BY NEWID()";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getString(1), rs.getString(2), rs.getFloat(3), rs.getString(4), rs.getInt(5), rs.getString(6)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getTop5Product() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT TOP 5 p.product_id , p.product_name, p.product_price, p.product_describe, p.quantity,p.img FROM product p where p.status='TRUE' ORDER BY NEWID()";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getString(1), rs.getString(2), rs.getFloat(3), rs.getString(4), rs.getInt(5), rs.getString(6)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getTrendProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT TOP 5 p.product_id , p.product_name, p.product_price, p.product_describe, p.quantity,p.img FROM product p inner join bill_detail bd on p.product_id = bd.product_id\n"
                + "ORDER BY bd.quantity DESC";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getString(1), rs.getString(2), rs.getFloat(3), rs.getString(4), rs.getInt(5), rs.getString(6)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public void deleteCategory(String category_id) {
        String updateCategorySql = "UPDATE category SET category_status = ? WHERE category_id = ?";
        String updateProductSql = "UPDATE product SET status = ? WHERE category_id = ?";

        try {
            conn = new DBContext().getConnection();
            conn.setAutoCommit(false);
            ps = conn.prepareStatement(updateCategorySql);
            ps.setString(1, "False");
            ps.setString(2, category_id);
            ps.executeUpdate();

            // Cập nhật trạng thái của sản phẩm liên quan
            ps = conn.prepareStatement(updateProductSql);
            ps.setString(1, "FALSE");
            ps.setString(2, category_id);
            ps.executeUpdate();

            conn.commit(); // Thực hiện commit thay đổi
        } catch (Exception e) {
            try {
                conn.rollback(); // Nếu có lỗi, rollback các thay đổi trước đó
            } catch (SQLException ex) {
                System.out.println("Error rolling back changes: " + ex.getMessage());
            }
            System.out.println("Error deleting category: " + e.getMessage());
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                System.out.println("Error closing database resources: " + ex.getMessage());
            }
        }
    }

    public void RecoverCategory(String category_id) {
        String sq = "update category set category_status = ? where category_id = ?";
        String sq1 = "UPDATE product SET status = ? WHERE category_id = ?";
        try {
            conn = new DBContext().getConnection();
            conn.setAutoCommit(false);
            ps = conn.prepareStatement(sq);
            ps.setString(1, "True");
            ps.setString(2, category_id);
            ps.executeUpdate();

            ps = conn.prepareStatement(sq1);
            ps.setString(1, "TRUE");
            ps.setString(2, category_id);
            ps.executeUpdate();

            conn.commit();
        } catch (Exception e) {
            try {
                conn.rollback();
            } catch (SQLException ex) {
                System.out.println("Error rolling back changes: " + ex.getMessage());
            }
            System.out.println("Error deleting category: " + e.getMessage());
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                System.out.println("Error closing database resources: " + ex.getMessage());
            }
        }

    }

    public List<Product> getProduct1() {
        List<Product> list = new ArrayList<>();
        String sql = "select c.category_name , p.product_id , p.product_name, p.product_price, p.product_describe, p.quantity,p.img,p.company,p.create_date,p.exp_date from  \n"
                + "product p inner join category c on p.category_id = c.category_id and p.status='TRUE'";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getString(1));
                LocalDate createDate = rs.getDate(9).toLocalDate(); // Lấy create_date từ ResultSet
                LocalDate expDate = rs.getDate(10).toLocalDate(); // Lấy exp_date từ ResultSet

                long monthsRemaining = ChronoUnit.DAYS.between(LocalDate.now(), expDate);

                if (monthsRemaining > 30) {
                    list.add(new Product(c, rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getString(8), monthsRemaining));
                }
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getProduct2() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT c.category_name, p.product_id, p.product_name, p.product_price, p.product_describe, p.quantity, p.img, p.company, p.create_date, p.exp_date, p.discount "
                + "FROM product p INNER JOIN category c ON p.category_id = c.category_id AND p.status = 'TRUE'";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getString(1));
                LocalDate createDate = rs.getDate(9).toLocalDate(); // Lấy create_date từ ResultSet
                LocalDate expDate = rs.getDate(10).toLocalDate(); // Lấy exp_date từ ResultSet

                long monthsRemaining = ChronoUnit.DAYS.between(LocalDate.now(), expDate);

                boolean discount = rs.getBoolean("discount"); // Lấy giá trị cột discount từ ResultSet

                if (monthsRemaining <= 30 && monthsRemaining > 0) {
                    if (discount) {
                        list.add(new Product(c, rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getString(8), monthsRemaining));
                    } else {
                        // Cập nhật category_id của sản phẩm thành 19 và discount thành true
                        String updateSql = "UPDATE product SET category_id = ?, product_price = ?, discount = ? WHERE product_id = ?";
                        ps = conn.prepareStatement(updateSql);
                        float originalPrice = rs.getFloat(4);
                        float discountedPrice = originalPrice * 0.7f;
                        ps.setInt(1, 19);
                        ps.setFloat(2, discountedPrice);
                        ps.setBoolean(3, true);
                        ps.setString(4, rs.getString(2)); // Tham số 2 là product_id từ ResultSet
                        ps.executeUpdate();
                        list.add(new Product(c, rs.getString(2), rs.getString(3), discountedPrice, rs.getString(5), rs.getInt(6), rs.getString(7), rs.getString(8), monthsRemaining));
                    }
                }
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
    public List<Product> getProduct4() {
        List<Product> list = new ArrayList<>();
        String sql = "select c.category_name , p.product_id , p.product_name, p.product_price, p.product_describe, p.quantity,p.img,p.company,p.create_date,p.exp_date from  \n"
                + "product p inner join category c on p.category_id = c.category_id and p.status='TRUE'";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getString(1));
                LocalDate createDate = rs.getDate(9).toLocalDate(); // Lấy create_date từ ResultSet
                LocalDate expDate = rs.getDate(10).toLocalDate(); // Lấy exp_date từ ResultSet

                long monthsRemaining = ChronoUnit.DAYS.between(LocalDate.now(), expDate);

                if (monthsRemaining > 0) {
                    list.add(new Product(c, rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getString(8), monthsRemaining));
                }
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getProduct3() {
        List<Product> list = new ArrayList<>();
        String sql = "select c.category_name , p.product_id , p.product_name, p.product_price, p.product_describe, p.quantity,p.img,p.create_date,p.exp_date , p.company from  \n"
                + "product p inner join category c on p.category_id = c.category_id ";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getString(1));
                LocalDate createDate = rs.getDate(8).toLocalDate(); // Lấy create_date từ ResultSet
                LocalDate expDate = rs.getDate(9).toLocalDate(); // Lấy exp_date từ ResultSet

                long monthsRemaining = ChronoUnit.DAYS.between(LocalDate.now(), expDate);

                if (monthsRemaining <= 0) {
                    list.add(new Product(c, rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getDate(8), rs.getDate(9), rs.getString(10)));
                }
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Category> getCategoryTrue() {
        List<Category> list = new ArrayList<>();
        String sql = "select * from category where category_status = 'True'";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getProductByCategory1(int category_id) {
        List<Product> list = new ArrayList<>();
        String sql = "select c.category_name , p.product_id , p.product_name, p.product_price, p.product_describe, p.quantity,p.img,p.create_date,p.exp_date from product p inner join category c on p.category_id = c.category_id WHERE p.category_id=? and p.status='TRUE'";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, category_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getString(1));
                LocalDate createDate = rs.getDate(8).toLocalDate(); // Lấy create_date từ ResultSet
                LocalDate expDate = rs.getDate(9).toLocalDate(); // Lấy exp_date từ ResultSet

                long monthsRemaining = ChronoUnit.DAYS.between(LocalDate.now(), expDate);
                if (monthsRemaining > 30) {
                    list.add(new Product(c, rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getString(5), rs.getInt(6), rs.getString(7)));
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getProductByCategory2(int category_id) {
        List<Product> list = new ArrayList<>();
        String sql = "select c.category_name , p.product_id , p.product_name, p.product_price, p.product_describe, p.quantity,p.img,p.create_date,p.exp_date from product p inner join category c on p.category_id = c.category_id WHERE p.category_id=? and p.status='TRUE'";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, category_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getString(1));
                LocalDate createDate = rs.getDate(8).toLocalDate(); // Lấy create_date từ ResultSet
                LocalDate expDate = rs.getDate(9).toLocalDate(); // Lấy exp_date từ ResultSet

                long monthsRemaining = ChronoUnit.DAYS.between(LocalDate.now(), expDate);
                if (monthsRemaining <= 30 && monthsRemaining > 0) {
                    list.add(new Product(c, rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getString(5), rs.getInt(6), rs.getString(7)));
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public Product getProductByID3(String product_id) {
        String sql = "select c.category_id, c.category_name , p.product_id , p.product_name, p.product_price, p.product_describe, p.quantity,p.img,p.create_date,p.exp_date,p.company from product p inner join category c on p.category_id = c.category_id WHERE p.product_id=? and p.status='TRUE'";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, product_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                Category c = new Category(rs.getInt(1), rs.getString(2));
                return new Product(c, rs.getString(3), rs.getString(4), rs.getFloat(5), rs.getString(6), rs.getInt(7), rs.getString(8), rs.getDate(9), rs.getDate(10), rs.getString(11));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
}
