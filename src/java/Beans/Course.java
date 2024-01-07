/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Beans;

import DataConnector.DatabaseUtil;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author TGDD
 */
public class Course {
    int id;
    Date courseTime;
    Date createAt;
    String name;
    String description;

    Course(int id, Date courseTime, Date createAt, String name, String description) {
        this.id = id;
        this.courseTime = courseTime;
        this.createAt = createAt;
        this.name = name;
        this.description = description;
    }

    public int getId() {
        return id;
    }

    public Date getCourseTime() {
        return courseTime;
    }

    public Date getCreateAt() {
        return createAt;
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }
    
    public static Course getCourseByID(int id) throws SQLException {
        Connection dbo = DatabaseUtil.getConn();
        PreparedStatement ps = dbo.prepareStatement("SELECT * FROM Course WHERE courseId = ?");
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        if(rs.next()) {
            return new Course(rs.getInt("courseID"), rs.getDate("CourseTime"), rs.getDate("createAt"), rs.getString("CourseName"), rs.getString("courseDescription"));
        }
        return null;
    }
    
    public static ArrayList<Course> getCourses() throws SQLException {
        ArrayList<Course> arr = new ArrayList();
        Connection dbo = DatabaseUtil.getConn();
        PreparedStatement ps = dbo.prepareStatement("SELECT * FROM Course");
        ResultSet rs = ps.executeQuery();
        while(rs.next()) {
            arr.add(new Course(rs.getInt("courseID"), rs.getDate("CourseTime"), rs.getDate("createAt"), rs.getString("CourseName"), rs.getString("courseDescription")));
        }
        return arr;
    }
    
    public static boolean addCourse(Date courseTime, String name, String description) throws SQLException {
        Connection dbo = DatabaseUtil.getConn();
        PreparedStatement ps = dbo.prepareStatement("INSERT INTO Course (CourseTime, createAt, CourseName, courseDescription) VALUES (?, ?, ?, ?)");
        ps.setDate(1, courseTime);
        ps.setDate(2, new Date(new java.util.Date().getTime()));
        ps.setString(3, name);
        ps.setString(4, description);
        int k = ps.executeUpdate();
        dbo.commit();
        if(k > 0)
            return true;
        return false;
    }
    
    public static boolean EditCourse(int id, Date courseTime, String name, String description) throws SQLException {
        Connection dbo = DatabaseUtil.getConn();
        PreparedStatement ps = dbo.prepareStatement("UPDATE Course SET CourseTime = ?, CourseName = ?, courseDescription = ? WHERE courseID = ?");
        ps.setDate(1, courseTime);
        ps.setString(2, name);
        ps.setString(3, description);
        ps.setInt(4, id);
        int k = ps.executeUpdate();
        dbo.commit();
        if(k > 0)
            return true;
        return false;
    }
    
    public static boolean deleteCourse(int id) throws SQLException {
        Connection dbo = DatabaseUtil.getConn();
        PreparedStatement ps = dbo.prepareStatement("DELETE FROM Course WHERE courseID = ?");
        ps.setInt(1, id);
        int k = ps.executeUpdate();
        dbo.commit();
        if(k > 0)
            return true;
        return false;
    }
}
