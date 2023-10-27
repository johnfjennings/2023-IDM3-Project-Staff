package com.idm3projectbasic.model;


import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

public class DatabaseHelper {
    public static Connection getConnection() {

        String host = "db";
        String dbName = "idm3project2023";
        int port = 3306;
        String mySqlUrl = "jdbc:mysql://" + host + ":" + port+ "/" + dbName;

        Properties userInfo = new Properties();
        userInfo.put("user", "root");
        userInfo.put("password", "root");

        try {
            //  Class.forName("jdbc:mariadb://localhost:3306/bookshop");
            Class.forName("com.mysql.jdbc.Driver");
            //Class.forName("com.mysql.cj.jdbc.Driver");

            mySqlUrl = "jdbc:mysql://" + host + ":" + port
                    + "/" + dbName;
            Connection connection = DriverManager.getConnection(mySqlUrl, userInfo);

            return connection;

        } catch (Exception ex) {
            System.out.println("Error: database helper class" + ex);

        }
        return null;
    }

}
