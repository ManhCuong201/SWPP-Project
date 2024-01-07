/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Beans;

import DataConnector.DatabaseUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author TGDD
 */
public class User {
    
    String username, password, email;
    
   User(String username, String password, String email) {
       this.username = username;
       this.password = password;
       this.email = email;
   }
    
    public static User getUser(String username, String password) throws Exception {
        Connection dbo = DatabaseUtil.getConn();
        try {
            PreparedStatement ps = dbo.prepareStatement("SELECT * FROM [User] WHERE [username] = ? AND [password] = ?");
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                return new User(username, password, rs.getString("email"));
            }
            rs.close();
            ps.close();
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            dbo.close();
        }
        return null;
    }
    
    public static User register(String username, String password, String email) throws Exception {
        Connection dbo = DatabaseUtil.getConn();
        try {
            PreparedStatement ps = dbo.prepareStatement("SELECT * FROM [User] WHERE [username] = ? OR [email] = ?");
            ps.setString(1, username);
            ps.setString(2, email);
            ResultSet rs = ps.executeQuery();
            if(!rs.next()) {
                ps = dbo.prepareStatement("INSERT INTO [User] ([username], [password], [email]) VALUES (?, ?, ?)");
                ps.setString(1, username);
                ps.setString(2, password);
                ps.setString(3, email);
                int k = ps.executeUpdate();
                dbo.commit();
                if(k > 0)
                    return new User(username, password, email);
            }
            rs.close();
            ps.close();
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            dbo.close();
        }
        return null;
    }
}
