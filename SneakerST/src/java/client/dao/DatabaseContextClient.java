/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package client.dao;

import client.model.BillingInvoice;
import client.model.Brand;
import client.model.CartItem;
import client.model.CategoryProduct;
import client.model.Customer;
import client.model.ClientLogin;
import client.model.DeliveryInvoice;
import client.model.FeedbackManagement;
import client.model.FeedbackUser;
import client.model.InvoiceStatus;
import client.model.NewArrivals;
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
public class DatabaseContextClient {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;
    private ArrayList<ClientLogin> userClient;
    private String sql_id = "sa";
    private String sql_password = "123456";
    private String sql_db = "DB_SNEAKERST";
    private String sql_url = "jdbc:sqlserver://localhost;databaseName=" + sql_db;

    public DatabaseContextClient() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection(sql_url, sql_id, sql_password);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(admincp.dao.DatabaseContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void registerUser(Customer c) throws SQLException {
        try {
            conn.setAutoCommit(false);
            String sql = "INSERT INTO UserTbl (Username, Password, FirstName, LastName, Email, Address, City, State, PostCode, Country, GroupID)\n"
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, c.getUsername());
            ps.setString(2, c.getPassword());
            ps.setString(3, c.getFirstname());
            ps.setString(4, c.getLastname());
            ps.setString(5, c.getEmail());
            ps.setString(6, c.getAddress());
            ps.setString(7, c.getCity());
            ps.setString(8, c.getState());
            ps.setString(9, c.getPostcode());
            ps.setString(10, c.getCountry());
            ps.setInt(11, 4);
            ps.execute();
            conn.commit();
        } catch (SQLException ex) {
            conn.rollback();
            Logger.getLogger(DatabaseContextClient.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public boolean authenticateLogin(String username, String password) throws SQLException {
        userClient = new ArrayList();
        try {
            String sql = "SELECT u.Username, u.Password, u.FirstName, u.LastName, u.Email, u.Address, u.City, u.State, u.PostCode, u.Country, g.GroupName\n"
                    + "FROM UserTbl u, GroupTbl g WHERE Username = ? AND Password = ? AND u.GroupID = g.GroupID";
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while (rs.next()) {
                userClient.add(new ClientLogin(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11)));
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseContextClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public ArrayList<CategoryProduct> getFullInfoCategoryByID(int id) throws SQLException {
        ArrayList<CategoryProduct> resultList = new ArrayList();
        try {
            String sql = "SELECT c.CategoryID, c.CategoryName, c.CategoryImage, c.CategoryLink\n"
                    + "FROM CategoryTbl c, ProductTbl p\n"
                    + "WHERE c.CategoryID = p.CategoryID AND p.ProductID = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                resultList.add(new CategoryProduct(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseContextClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return resultList;
    }

    public void addBilling(BillingInvoice b) throws SQLException {
        try {
            conn.setAutoCommit(false);
            String sql = "INSERT INTO BillTbl (InvoiceID, bFirstName, bLastName, bEmail, bAddress, bCity, bState, bCountry, bPhone, bPayment) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ? ,?)";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, b.getInvoiceID());
            ps.setString(2, b.getBfName());
            ps.setString(3, b.getBlName());
            ps.setString(4, b.getbEmail());
            ps.setString(5, b.getbAddress());
            ps.setString(6, b.getbCity());
            ps.setString(7, b.getbState());
            ps.setString(8, b.getbCountry());
            ps.setString(9, b.getbPhone());
            ps.setString(10, b.getbPayment());
            ps.execute();
            conn.commit();
        } catch (SQLException ex) {
            conn.rollback();
            Logger.getLogger(DatabaseContextClient.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void addDelivery(DeliveryInvoice d) throws SQLException {
        try {
            conn.setAutoCommit(false);
            String sql = "INSERT INTO DeliveryTbl (InvoiceID, dFirstName, dLastName, dAddress, dCity, dState, dCountry, dPhone, dDeliveryMethod) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, d.getInvoiceID());
            ps.setString(2, d.getDfName());
            ps.setString(3, d.getDlName());
            ps.setString(4, d.getdAddress());
            ps.setString(5, d.getdCity());
            ps.setString(6, d.getdState());
            ps.setString(7, d.getdCountry());
            ps.setString(8, d.getdPhone());
            ps.setString(9, d.getdMethod());
            ps.execute();
            conn.commit();
        } catch (SQLException ex) {
            conn.rollback();
            Logger.getLogger(DatabaseContextClient.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void cartInvoiceDetail(ArrayList<CartItem> cartList, int invoiceID) throws SQLException {
        try {
            conn.setAutoCommit(false);
            String sql = "INSERT INTO CartDetailTbl (InvoiceID, ProductID, SizeName, Quantity, TotalPrice) VALUES (?, ?, ?, ?, ?)";
            ps = conn.prepareStatement(sql);
            for (CartItem c : cartList) {
                ps.setInt(1, invoiceID);
                ps.setInt(2, c.getProductID());
                ps.setString(3, c.getSizeName());
                ps.setInt(4, c.getQuantity());
                ps.setFloat(5, c.getProductPrice() * c.getQuantity());
                ps.addBatch();
            }
            ps.executeBatch();
            conn.commit();
        } catch (SQLException ex) {
            conn.rollback();
            Logger.getLogger(DatabaseContextClient.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void addInvoice(InvoiceStatus i) throws SQLException {
        try {
            conn.setAutoCommit(false);
            String sql = "INSERT INTO InvoiceTbl VALUES (?, ?, ?)";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, i.getInvoiceID());
            ps.setString(2, i.getUsername());
            ps.setInt(3, i.getInvoiceStatusID());
            ps.execute();
            conn.commit();
        } catch (SQLException ex) {
            conn.rollback();
            Logger.getLogger(DatabaseContextClient.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int getDuplicateInvoiceID(int id) throws SQLException {
        try {
            String sql = "SELECT InvoiceID FROM InvoiceTbl WHERE InvoiceID = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseContextClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public void updateUser(String username, String firstname, String lastname, String email, String address, String city, String state, String postcode, String country) {
        try {
            String sql = "update UserTbl set FirstName = ?, LastName = ?, Email= ?, Address = ?, City = ?, State = ?, Postcode = ?, Country = ? where Username = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, firstname);
            ps.setString(2, lastname);
            ps.setString(3, email);
            ps.setString(4, address);
            ps.setString(5, city);
            ps.setString(6, state);
            ps.setString(7, postcode);
            ps.setString(8, country);
            ps.setString(9, username);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseContextClient.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void changePassword(String username, String newPassword) {
        try {
            String sql = "update UserTbl set password = ? where Username = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, newPassword);
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseContextClient.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public boolean checkPassword(String username, String password) {
        try {
            String sql = "select username, password from UserTbl where password = ? and Username = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, password);
            ps.setString(2, username);
            ResultSet executeQruery = ps.executeQuery();
            if (executeQruery.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseContextClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public ArrayList<NewArrivals> newArrivals(String gender) {
        ArrayList<NewArrivals> newArr = new ArrayList<>();
        try {
            String sql = "SELECT DISTINCT p.ProductID, i.ImageURL, p.ProductName, p.UnitPrice, p.Gender\n"
                    + "                    FROM ProductTbl p, ImageProductTbl i\n"
                    + "                    WHERE i.ImageURL IN (SELECT TOP 1 ImageURL\n"
                    + "                    FROM ImageProductTbl i1\n"
                    + "                    WHERE i1.ProductID = p.ProductID)\n"
                    + "                    AND p.ProductID = i.ProductID ";

            if (!gender.equals("")) {
                sql += "and Gender= ? ";
            }
            sql += " ORDER BY p.ProductID ASC";
            ps = conn.prepareStatement(sql);
            if (!gender.equals("")) {
                ps.setString(1, gender);
            }
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                NewArrivals sp = new NewArrivals(rs.getInt("ProductID"), rs.getString("ImageURL"), rs.getString("ProductName"), rs.getInt("UnitPrice"), rs.getString("Gender"));
                newArr.add(sp);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseContextClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return newArr;
    }

    public ArrayList<ClientLogin> getUserClient() {
        return userClient;
    }

    public ArrayList<Brand> getAllProductFromBrand(String brand) {
        ArrayList<Brand> newArr = new ArrayList<>();
        try {
            String sql = "SELECT DISTINCT p.ProductID, i.ImageURL, p.ProductName, p.UnitPrice, g.CategoryName\n"
                    + "                    FROM ProductTbl p, ImageProductTbl i, CategoryTbl g\n"
                    + "                    WHERE i.ImageURL IN (SELECT TOP 1 ImageURL\n"
                    + "                    FROM ImageProductTbl i1\n"
                    + "                    WHERE i1.ProductID = p.ProductID)\n"
                    + "                    AND p.ProductID = i.ProductID\n"
                    + "                    AND p.CategoryID = g.CategoryID AND g.CategoryName = ?\n";

            sql += "ORDER BY p.ProductID ASC";
            ps = conn.prepareStatement(sql);
            ps.setString(1, brand);
            rs = ps.executeQuery();
            while (rs.next()) {
                newArr.add(new Brand(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getString(5)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseContextClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return newArr;
    }

    public Customer displayInfo(String username) {
        Customer cus = new Customer();
        try {
            String sql = "select username, password,FirstName,LastName,Email,Address,City,State,Postcode,Country from UserTbl where username = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                cus = new Customer(rs.getString("username"), rs.getString("password"), rs.getString("FirstName"), rs.getString("LastName"), rs.getString("Email"),
                        rs.getString("Address"), rs.getString("City"), rs.getString("State"), rs.getString("PostCode"), rs.getString("Country"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseContextClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cus;
    }

    public ArrayList<FeedbackUser> userFilter(String name) {
        ArrayList<FeedbackUser> us1 = new ArrayList<>();

        try {

            String sql = "select  Username,Address,Phone,ProductID,ProductName,DateBuy,Comment,Status from Feedback  where Username=?";

            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, name);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                FeedbackUser us2 = new FeedbackUser(rs.getString("Username"), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getDate(6), rs.getString(7), rs.getString(8));
                us1.add(us2);
            }

        } catch (SQLException ex) {
            Logger.getLogger(DatabaseContextClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return us1;
    }

    public void addFeedback(String user, int id, String name, String gender, String address, String email, String phone, String productID, String productName, String date,
            String comment, String status) {
        try {
            String sql = "insert into Feedback values(?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, id);
            statement.setString(2, user);
            statement.setString(3, name);
            statement.setString(4, gender);
            statement.setString(5, address);
            statement.setString(6, email);
            statement.setString(7, phone);
            statement.setString(8, productID);
            statement.setString(9, productName);
            statement.setString(10, date);
            statement.setString(11, comment);
            statement.setString(12, status);
            statement.execute();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseContextClient.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public boolean isDuplicate(String username) {
        try {
            String sql = "select Username from UserTbl where Username=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return false;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return true;
    }

    public void addUser(String name, String pass, String fName, String lName, String email, String city, String state, String postCode, String address, String country, int groupId) {
        try {
            String sql = "INSERT INTO [UserTbl]([Username],[Password],[FirstName],[LastName],[Email],[Address],[City],[State],[Postcode],[Country],[GroupID]) VALUES(?,?,?,?,?,?,?,?,?,?,?)";
            conn.setAutoCommit(false);
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setString(1, name);
            stm.setString(2, pass);
            stm.setString(3, fName);
            stm.setString(4, lName);
            stm.setString(5, email);
            stm.setString(6, city);
            stm.setString(7, address);
            stm.setString(8, state);
            stm.setString(9, postCode);
            stm.setString(10, country);
            stm.setInt(11, groupId);
            stm.execute();
            conn.commit();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseContextClient.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<FeedbackManagement> adminFilter() {
        ArrayList<FeedbackManagement> ob2 = new ArrayList<>();

        try {

            String sql = "SELECT * FROM Feedback WHERE 1=1 ";
            PreparedStatement statement = conn.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                FeedbackManagement ob1 = new FeedbackManagement(rs.getString(2), rs.getInt(1), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8),
                        rs.getString(9), rs.getDate(10), rs.getString(11), rs.getString(12));
                ob2.add(ob1);
            }

        } catch (SQLException ex) {
            Logger.getLogger(DatabaseContextClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ob2;
    }

    public void updateStatus(String id, String sta) {
        try {
            String sql = "update Feedback set [Status]=? where ID=?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, sta);
            statement.setString(2, id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseContextClient.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public boolean getDuplicateUsername(String username) {
        try {
            String sql = "SELECT Username FROM UserTbl WHERE Username = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            if (rs.next()) {
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseContextClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return true;
    }
    
    public ArrayList<Object> getInvoice(String invoiceid) {
        ArrayList<Object> arr = new ArrayList<>();
        try {
            String sql = "select a.invoiceid,username,a.InvoiceStatusID,statusname,deliveryid,dfirstname, dlastname, daddress,dcity,dstate,dcountry, \n"
                    + "dphone,ddeliverymethod,cartdetailid, productid,sizename,quantity,\n"
                    + "totalprice,billid, bfirstname,blastname, bemail, baddress,bcity,bstate,bcountry,bphone,bpayment\n"
                    + " from invoiceTBl a join invoicestatustbl b on a.invoicestatusid = b.invoicestatusid\n"
                    + "								join deliverytbl c on a.invoiceid = c.invoiceid \n"
                    + "									join cartdetailtbl d on a.invoiceid = d.invoiceid\n"
                    + "						join billtbl e on a.invoiceid = e.invoiceid where a.invoiceid = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, invoiceid);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                BillingInvoice bill = new BillingInvoice(rs.getInt("invoiceid"), rs.getString("bfirstname"), rs.getString("blastname"),rs.getString("bemail"),
                            rs.getString("baddress"),rs.getString("bcity"),rs.getString("bstate"),rs.getString("bcountry"),rs.getString("bpayment"),rs.getString("bphone"));
                arr.add(bill);
                DeliveryInvoice deli = new DeliveryInvoice(rs.getInt("invoiceid"), rs.getString("dfirstname"), rs.getString("dlastname"), rs.getString("daddress"), rs.getString("dcity"), 
                        rs.getString("dstate"), rs.getString("dcountry"), rs.getString("dphone"), rs.getString("dDeliveryMethod"));
                arr.add(deli);
                InvoiceStatus inv = new InvoiceStatus(rs.getInt("invoiceid"), rs.getString("username"), rs.getInt("InvoiceStatusID"));
                arr.add(inv);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseContextClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return arr;
    }
    
    public ArrayList<NewArrivals> search(String name) {
        ArrayList<NewArrivals> newArr = new ArrayList<>();
        try {
            String sql = "SELECT DISTINCT p.ProductID, i.ImageURL, p.ProductName, p.UnitPrice, p.Gender\n"
                    + "                    FROM ProductTbl p, ImageProductTbl i\n"
                    + "                    WHERE i.ImageURL IN (SELECT TOP 1 ImageURL\n"
                    + "                    FROM ImageProductTbl i1\n"
                    + "                    WHERE i1.ProductID = p.ProductID)\n"
                    + "                    AND p.ProductID = i.ProductID ";

            if (!name.equals("")) {
                sql += "and p.ProductName like '%'+?+'%' ";
            }
            sql += " ORDER BY p.ProductName ASC";
            ps = conn.prepareStatement(sql);
            if (!name.equals("")) {
                ps.setString(1, name);
            }
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                newArr.add(new NewArrivals(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getString(5)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseContextClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return newArr;
    }
}
