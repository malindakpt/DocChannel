package com.mkpt;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by admin on 10/25/2016.
 */
public class DBLink {

    public  static StringBuilder errorMsg = new StringBuilder();
    private  static Connection connect = null;
    private  static Statement statement = null;
    private  static PreparedStatement preparedStatement = null;
    private  static ResultSet resultSet = null;

    public static Connection getConnection(){
        errorMsg = new StringBuilder();
        try {
            return DriverManager.getConnection("jdbc:mysql://localhost/docChannel?" + "user=root&password=");
//           return DriverManager.getConnection("jdbc:mysql://127.7.45.130:3306/voction?" + "user=adminV5y9umD&password=J8etWW3ma6fB");
//            return DriverManager.getConnection("jdbc:mysql://127.6.96.130:3306/voction5?" + "user=adminEMicr6f&password=4jsJ98UdgFMf");


        } catch (SQLException e)
        {
            errorMsg.append(e.getMessage());
            return null;
        }
    }

    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connect = getConnection();
        }catch (Exception e){
            errorMsg.append(e.getMessage());
            e.printStackTrace();
        }
    }
    public static List<String> getTypes(){
        List<String> types=new ArrayList<String>();
        try {
            connect = getConnection();
            statement = connect.createStatement();
            resultSet = statement.executeQuery("select * from types");


            while (resultSet.next()) {
                types.add(resultSet.getString(2));
            }
        }catch (Exception e){
            errorMsg.append(e.getMessage());
            return null;
        }
        return types;
    }
    public static boolean validateUser(String email,String pwd){

        try {
            connect = getConnection();
            statement = connect.createStatement();
            resultSet = statement.executeQuery("select * from hospitals where email='" + email+"' and pwd='"+pwd+"'");

            if (resultSet.next()) {
                return true;
            }
        }catch (Exception e){
            errorMsg.append(e.getMessage());
            return false;
        }
        return false;
    }

    public static boolean addDoctor(Doctor doc,int adID, String email, String pwd){
        errorMsg = new StringBuilder();
        if(!validateUser(email,pwd)){
            return false;
        }
        try {
            statement=connect.createStatement();
            connect = getConnection();
            preparedStatement = connect
                    .prepareStatement("insert into  doctors values ( ?, ?,?,?,?)");

            preparedStatement.setInt(1, doc.getID());
            preparedStatement.setString(2, doc.getName());
            preparedStatement.setInt(3,doc.getType());
            preparedStatement.setInt(4, doc.getNumber());
            preparedStatement.setString(5, doc.getPhone());


            preparedStatement.executeUpdate();

            return true;
        }catch (Exception e){
            errorMsg.append(e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
}
