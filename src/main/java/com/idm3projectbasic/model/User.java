package com.idm3projectbasic.model;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class User {

    private long userId;
    private String firstName;
    private String surname;
    private String emailAddress;
    private String userType;
    private String userName;
    private String password;
    private String organization;

    public User(String firstName, String surname, String emailAddress, String userType, String userName, String password, String organization) {
        this.firstName = firstName;
        this.surname = surname;
        this.emailAddress = emailAddress;
        this.userType = userType;
        this.userName = userName;
        this.password = password;
        this.organization = organization;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }


    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }


    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }


    public String getEmailAddress() {
        return emailAddress;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }


    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }


    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }


    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }


    public String getOrganization() {
        return organization;
    }

    public void setOrganization(String organization) {
        this.organization = organization;
    }


    public User createUser() {
        Connection c = DatabaseHelper.getConnection();
        String template = "INSERT INTO `user` (`FirstName`, `Surname`, `EmailAddress`, `UserType`, `UserName`, `Password`, `Organization`) VALUES (?,?,?,?,?,?,?)";
        String query = "SELECT LAST_INSERT_ID()";
        if (c != null) {
            try {
                PreparedStatement inserter = c.prepareStatement(template);
                //find the new ID of the user
                PreparedStatement ps2 = c.prepareStatement(query);

                inserter.setString(1, this.firstName);
                inserter.setString(2, this.surname);
                inserter.setString(3, this.emailAddress);
                inserter.setString(4, this.userType);
                inserter.setString(5, this.userName);
                inserter.setString(6, this.password);
                inserter.setString(7, this.organization);
                System.out.println("User createUser::" + inserter);
                int i = inserter.executeUpdate();

                ResultSet rs = ps2.executeQuery();
                while (rs.next()) {
                    this.userId = rs.getInt(1);
                }
                c.close();
            } catch (SQLException ex) {
                System.out.println("Error on insert User " + ex);
            }
        }
        return this;
    }
    public boolean updateUser() {

        Connection connection = DatabaseHelper.getConnection();

        String sql = "UPDATE `user` SET `FirstName` = ?, `Surname` = ?," +
                "`EmailAddress` = ?, `UserType` = ?," +
                "`UserName` = ?, `Password` = ?," +
                "`Organization` = ? WHERE `user`.`UserID` = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setString(1, this.firstName);
            ps.setString(2, this.surname);
            ps.setString(3, this.emailAddress);
            ps.setString(4, this.userType);
            ps.setString(5, this.userName);
            ps.setString(6, this.password);
            ps.setString(7, this.organization);
            ps.setLong(8, this.userId);
            System.out.println("User updateUser::" + ps);
            ps.executeUpdate();
            connection.close();
        } catch (SQLException ex) {
            System.out.println(ex);
            return false;
        }
        return true;
    }

    public boolean deleteUser() {

        Connection connection = DatabaseHelper.getConnection();

        String sql = "DELETE FROM `user` WHERE userId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setLong(1, this.userId);
            System.out.println("User deleteUser::" + ps);
            ps.executeUpdate();
            connection.close();
        } catch (SQLException ex) {
            System.out.println(ex);
            return false;
        }
        return true;
    }
}
