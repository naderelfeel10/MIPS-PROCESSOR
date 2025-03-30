package com.example.demo8;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DatabaseHandler
{

    private static final String DATABASE_URL = "jdbc:mysql://localhost:3306/yourDatabase";
    private static final String DATABASE_USER = "username";
    private static final String DATABASE_PASSWORD = "password";

    public boolean checkLogin(String username, String password)
    {
        boolean isValidUser = false;
        String sql = "SELECT * FROM users WHERE username = ? AND password = ?";

        try (Connection connection = DriverManager.getConnection(DATABASE_URL, DATABASE_USER, DATABASE_PASSWORD);
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                isValidUser = resultSet.next();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return isValidUser;
    }
}
