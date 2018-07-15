package admincp.dao;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import admincp.model.Category;
import admincp.model.ImageProduct;
import admincp.model.Product;
import admincp.model.ProductManagement;
import admincp.model.Size;
import admincp.model.StockProduct;
import admincp.model.UserAdminCP;
import client.model.InvoiceStatus;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DUCHTSE61924
 */
public class DatabaseContext {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;
    private ArrayList<UserAdminCP> userCP;
    private String sql_id = "sa";
    private String sql_password = "123456";
    private String sql_db = "DB_SNEAKERST";
    private String sql_url = "jdbc:sqlserver://localhost;databaseName=" + sql_db;

    public DatabaseContext() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection(sql_url, sql_id, sql_password);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DatabaseContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public boolean authenticateLoginToAdminCP(String username, String password) throws SQLException {
        userCP = new ArrayList();
        try {
            String sql = "SELECT u.Username, u.Password, u.FirstName, g.GroupName\n"
                    + "FROM UserTbl u, GroupTbl g\n"
                    + "WHERE u.Username = ? AND u.Password = ? AND u.GroupID = g.GroupID;";
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while (rs.next()) {
                if (!rs.getString(4).equalsIgnoreCase("Customer")) {
                    userCP.add(new UserAdminCP(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4)));
                    return true;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public ArrayList<Category> getCategory() {
        ArrayList<Category> categoryList = new ArrayList();

        try {

            String sql = "SELECT * FROM CategoryTbl";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            int i = 0;
            while (rs.next()) {
                categoryList.add(new Category(rs.getInt(1), rs.getString(2)));
                i++;
            }
            System.out.println("Category:" + i);
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return categoryList;
    }

    public ArrayList<Size> getSize() {
        ArrayList<Size> sizeList = new ArrayList();
        try {
            String sql = "SELECT * FROM SizeTbl";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            int i = 0;
            while (rs.next()) {
                sizeList.add(new Size(rs.getInt(1), rs.getString(2)));
                i++;
            }
            System.out.println("Size:" + i);
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sizeList;
    }

    public void addProduct(Product p) throws SQLException {
        try {
            conn.setAutoCommit(false);
            String sql = "INSERT INTO ProductTbl VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, p.getId());
            ps.setString(2, p.getName());
            ps.setString(3, p.getDescription());
            ps.setString(4, p.getDetail());
            ps.setFloat(5, p.getPrice());
            ps.setString(6, p.getGender());
            ps.setInt(7, p.getCategory());
            ps.setString(8, p.getInStock());
            ps.execute();
            conn.commit();
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException ex) {
                conn.rollback();
                Logger.getLogger(DatabaseContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void addImageURL(Product p, String[] url) throws SQLException {
        try {
            conn.setAutoCommit(false);
            String sql = "INSERT INTO ImageProductTbl(ImageURL, ProductID) VALUES (?, ?)";
            ps = conn.prepareStatement(sql);
            for (String u : url) {
                ps.setString(1, u);
                ps.setInt(2, p.getId());
                ps.addBatch();
            }
            ps.executeBatch();
            conn.commit();
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(DatabaseContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void addSize(Product p, String[] size) throws SQLException {
        try {
            conn.setAutoCommit(false);
            String sql = "INSERT INTO StockTBL(SizeID, ProductID, Quantity) VALUES (?, ?, ?)";
            ps = conn.prepareStatement(sql);
            for (int i = 0; i < size.length; i++) {
                ps.setInt(1, i + 1);
                ps.setInt(2, p.getId());
                ps.setInt(3, Integer.parseInt(size[i]));
                ps.addBatch();
            }
            ps.executeBatch();
            conn.commit();
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(DatabaseContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public ArrayList<ProductManagement> getAllProduct() {
        ArrayList<ProductManagement> productList = new ArrayList();
        ArrayList<Category> categoryList = getCategory();
        try {
            String sql = "SELECT DISTINCT i.ImageURL, p.ProductID, p.ProductName, p.Description, p.Detail, p.UnitPrice, p.Gender, p.CategoryID, p.InStock\n"
                    + "FROM ProductTbl p, CategoryTbl c, StockTbl s, ImageProductTbl i \n"
                    + "WHERE i.ImageURL IN (SELECT TOP 1 ImageURL\n"
                    + "FROM ImageProductTbl i1\n"
                    + "WHERE i1.ProductID = p.ProductID)\n"
                    + "AND p.ProductID = i.ProductID \n"
                    + "AND c.CategoryID = p.CategoryID\n"
                    + "ORDER BY p.ProductID ASC\n";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                productList.add(new ProductManagement(rs.getString(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getFloat(6), rs.getString(7), rs.getInt(8), rs.getString(9)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return productList;
    }

    public ArrayList<ImageProduct> getImageURLByProductID(int id) throws SQLException {
        ArrayList<ImageProduct> imagesList = new ArrayList();
        try {
            String sql = "SELECT * FROM ImageProductTbl WHERE ProductID = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                imagesList.add(new ImageProduct(rs.getInt(1), rs.getString(2), rs.getInt(3)));
            }
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(DatabaseContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return imagesList;
    }

    public ArrayList<Product> getProductByID(int id) throws SQLException {
        ArrayList<Product> productInfo = new ArrayList();
        try {
            String sql = "SELECT * FROM ProductTbl WHERE ProductID = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                productInfo.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getFloat(5), rs.getString(6), rs.getInt(7), rs.getString(8)));
            }
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(DatabaseContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return productInfo;
    }

    public ArrayList<StockProduct> getSizeByProductID(int id) throws SQLException {
        ArrayList<StockProduct> sizeInfo = new ArrayList();
        try {
            String sql = "SELECT t.SizeID, s.SizeName, t.ProductID, t.Quantity\n"
                    + "FROM SizeTbl s, StockTbl t\n"
                    + "WHERE s.SizeID = t.SizeID AND t.ProductID = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                sizeInfo.add(new StockProduct(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4)));
            }
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(DatabaseContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return sizeInfo;
    }

    public void updateProductInfo(Product p) throws SQLException {
        try {
            conn.setAutoCommit(false);
            String sql1 = "UPDATE ProductTbl\n"
                    + "SET ProductName = ?, Description = ?, Detail = ?, UnitPrice = ?, Gender = ?, CategoryID = ?, InStock = ?\n"
                    + "WHERE ProductID = ?";
            ps = conn.prepareStatement(sql1);
            ps.setString(1, p.getName());
            ps.setString(2, p.getDescription());
            ps.setString(3, p.getDetail());
            ps.setFloat(4, p.getPrice());
            ps.setString(5, p.getGender());
            ps.setInt(6, p.getCategory());
            ps.setString(7, p.getInStock());
            ps.setInt(8, p.getId());
            ps.execute();
            conn.commit();
        } catch (SQLException ex) {
            conn.rollback();
            Logger.getLogger(DatabaseContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateSize(Product p, String size[]) throws SQLException {
        try {
            conn.setAutoCommit(false);
            String sql2 = "UPDATE StockTbl\n"
                    + "SET Quantity = ?\n"
                    + "WHERE SizeID = ? AND ProductID = ?";
            ps = conn.prepareStatement(sql2);
            for (int i = 0; i < size.length; i++) {
                ps.setInt(1, Integer.parseInt(size[i]));
                ps.setInt(2, i + 1);
                ps.setInt(3, p.getId());
                ps.addBatch();
            }
            ps.executeBatch();
            conn.commit();
        } catch (SQLException ex) {
            conn.rollback();
            Logger.getLogger(DatabaseContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateImageURL(Product p, String imagesURL[]) throws SQLException {
        try {
            conn.setAutoCommit(false);
            ArrayList<ImageProduct> currentImageList = getImageURLByProductID(p.getId());
            String sql3 = "UPDATE ImageProductTbl\n"
                    + "SET ImageURL = ?\n"
                    + "WHERE ImageID = ?";
            String sql4 = "INSERT INTO ImageProductTbl(ImageURL, ProductID) VALUES (?, ?)";
            for (int i = 0; i < imagesURL.length; i++) {
                if (i < currentImageList.size()) {
                    ps = conn.prepareStatement(sql3);
                    ps.setString(1, imagesURL[i]);
                    ps.setInt(2, currentImageList.get(i).getId());
                    ps.addBatch();
                } else {
                    ps = conn.prepareStatement(sql4);
                    ps.setString(1, imagesURL[i]);
                    ps.setInt(2, p.getId());
                    ps.addBatch();
                }
            }
            ps.executeBatch();
            conn.commit();
        } catch (SQLException ex) {
            conn.rollback();
            Logger.getLogger(DatabaseContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteProduct(int id) throws SQLException {
        try {
            conn.setAutoCommit(false);
            String sql = "DELETE FROM StockTbl WHERE ProductID = ?\n"
                    + "DELETE FROM ImageProductTbl WHERE ProductID = ?\n"
                    + "DELETE FROM ProductTbl WHERE ProductID = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setInt(2, id);
            ps.setInt(3, id);
            ps.execute();
            conn.commit();
        } catch (SQLException ex) {
            conn.rollback();
            Logger.getLogger(DatabaseContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Category> getCategoryByID(int id) throws SQLException {
        ArrayList<Category> categoryResult = new ArrayList();
        try {

            String sql = "SELECT * FROM CategoryTbl WHERE CategoryID = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                categoryResult.add(new Category(rs.getInt(1), rs.getString(2)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return categoryResult;
    }

    public void categoryProcess(String action, int id, String name) throws SQLException {
        try {
            conn.setAutoCommit(false);
            switch (action) {
                case "update":
                    String sql1 = "UPDATE CategoryTbl SET CategoryName = ? WHERE CategoryID = ?";
                    ps = conn.prepareStatement(sql1);
                    ps.setString(1, name);
                    ps.setInt(2, id);
                    ps.executeUpdate();
                    ps.close();
                    conn.commit();
                    break;
                case "delete":
                    String sql2 = "DELETE FROM CategoryTbl WHERE CategoryID = ? AND CategoryName = ?";
                    ps = conn.prepareStatement(sql2);
                    ps.setInt(1, id);
                    ps.setString(2, name);
                    ps.execute();
                    ps.close();
                    conn.commit();
                    break;
                case "add":
                    String sql3 = "INSERT INTO CategoryTbl VALUES (?, ?)";
                    ps = conn.prepareStatement(sql3);
                    ps.setInt(1, id);
                    ps.setString(2, name);
                    ps.execute();
                    ps.close();
                    conn.commit();
                    break;
            }
        } catch (SQLException ex) {
            conn.rollback();
            Logger.getLogger(DatabaseContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<InvoiceStatus> getAllInvoice() {
        ArrayList<InvoiceStatus> resultList = new ArrayList();
        try {
            String sql = "SELECT * FROM InvoiceTbl";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                resultList.add(new InvoiceStatus(rs.getInt(1), rs.getString(2), rs.getInt(3)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return resultList;
    }
    
    
    

    public ArrayList<UserAdminCP> getUserCP() {
        return userCP;
    }
}
