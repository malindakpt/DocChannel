package com.mkpt;

import com.sun.org.apache.xml.internal.security.utils.Base64;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by admin on 10/25/2016.
 */
public class DBLink {

    public  static StringBuilder errorMsg = new StringBuilder();
    private  static Connection connection = null;
    private  static Statement statement = null;
    private  static PreparedStatement preparedStatement = null;
    private  static ResultSet resultSet = null;

    public static Connection getConnection(){
        errorMsg = new StringBuilder();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            if(connection==null || connection.isClosed()) {
                connection = DriverManager.getConnection("jdbc:mysql://localhost/docChannel?" + "user=root&password=");
            }
//            return DriverManager.getConnection("jdbc:mysql://127.10.148.2:3306/docvisit?" + "user=adminuKkWjhk&password=4djnF2fDCGmK");
           return connection;

        } catch (Exception e)
        {
            errorMsg.append(e.getMessage());
            return null;
        }
    }

    public static void closeConnection(){
        try {
            System.out.println("close connection");
            statement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

//    static {
//        try {
//            Class.forName("com.mysql.jdbc.Driver");
//            connect = getConnection();
//        }catch (Exception e){
//            errorMsg.append(e.getMessage());
//            e.printStackTrace();
//        }
//    }

    public static String getImage(int hosptID,String img) throws SQLException {
        errorMsg = new StringBuilder();
        String attribute="img"+img;

        statement=getConnection().createStatement();
        resultSet = statement.executeQuery("select "+attribute+" from hospitals where id="+hosptID);
        while (resultSet.next()) {
            // imageS = Base64.encode(resultSet.getBytes(attribute));
            return resultSet.getString(attribute);
        }
        return null;
    }

    public static String adImages(int hosptID,Advertisement ad,String email,String pwd){
        errorMsg = new StringBuilder();
        if(!validateUser(email,pwd,hosptID)){
            return "Invalid Email or Password";
        }
        try {

            preparedStatement = getConnection()
                    .prepareStatement("UPDATE hospitals SET  img0=? , img1=? , img2= ? WHERE id = ?");


            preparedStatement.setBlob(1, ad.getImg0());
            preparedStatement.setBlob(2, ad.getImg1());
            preparedStatement.setBlob(3, ad.getImg2());
            preparedStatement.setInt(4, hosptID);




            preparedStatement.executeUpdate();

            return null;
        }catch (Exception e){
            errorMsg.append(e.getMessage());
            e.printStackTrace();
            return e.getMessage();
        }

    }
    public static List<String> getTypes(){
        List<String> types=new ArrayList<String>();
        try {

            statement = getConnection().createStatement();
            resultSet = statement.executeQuery("select * from types");


            while (resultSet.next()) {
                types.add(resultSet.getString(1)+"#"+resultSet.getString(2));
            }
        }catch (Exception e){
            errorMsg.append(e.getMessage());
            return null;
        }
        return types;
    }

    public static List<String> getDoctors(){
        List<String> types=new ArrayList<String>();
        try {

            statement = getConnection().createStatement();
            resultSet = statement.executeQuery("select doctors.id,doctors.name,types.caption from doctors INNER JOIN types ON doctors.type=types.id");

            while (resultSet.next()) {
                types.add(resultSet.getString(1)+"#"+resultSet.getString(2)+"#"+resultSet.getString(3));
            }
        }catch (Exception e){
            errorMsg.append(e.getMessage());
            return null;
        }
        return types;
    }
    public static List<String> getHospitals(){
        List<String> types=new ArrayList<String>();
        try {

            statement = getConnection().createStatement();
            resultSet = statement.executeQuery("select * from hospitals");


            while (resultSet.next()) {
                types.add(resultSet.getString(1)+"#"+resultSet.getString(2));
            }
        }catch (Exception e){
            errorMsg.append(e.getMessage());
            return null;
        }
        return types;
    }
    public static int getAdCountHospt(int hospID){

        try {

            statement = getConnection().createStatement();
            //   resultSet = statement.executeQuery("select channel.id,channel.weekDay, channel.time  from channel INNER JOIN doctors ON channel.docId=doctors.id where hospitalId=" + hosptId + " and docId=" + docId);
            resultSet = statement.executeQuery("select noOfAds  from hospitals  where id="+hospID);

            while (resultSet.next()) {
                return resultSet.getInt(1);
            }
        }catch (Exception e){
            errorMsg.append(e.getMessage());
            return -1;
        }
        return -1;
    }

    //JSON implementation
    public static JSONArray getAdPhotosHospt(int hospID){
        JSONArray photos = new JSONArray();
        try {

            statement = getConnection().createStatement();
            //   resultSet = statement.executeQuery("select channel.id,channel.weekDay, channel.time  from channel INNER JOIN doctors ON channel.docId=doctors.id where hospitalId=" + hosptId + " and docId=" + docId);
            resultSet = statement.executeQuery("select adID,photo  from hospitals  where id="+hospID);

            while (resultSet.next()) {
                JSONObject photo = new JSONObject();
                photo.put(Cnst.PHOTO, Base64.encode(resultSet.getBytes("photo")));
                photos.add(photo);
            }
        }catch (Exception e){
            errorMsg.append(e.getMessage());
            return null;
        }
        return photos;
    }

    //JSON implementation
    public static JSONArray getHospitalsForAds(){
        JSONArray hospitals = new JSONArray();
        try {

            statement = getConnection().createStatement();
            resultSet = statement.executeQuery("select * from hospitals");

            while (resultSet.next()) {
                JSONObject hospt = new JSONObject();
                hospt.put(Cnst.HOSPT_ID,resultSet.getString(1));
                hospt.put(Cnst.HOSPT_NAME,resultSet.getString(2));
                hospt.put(Cnst.HOSPT_NO_OF_ADS, resultSet.getString("noOfAds"));
                hospitals.add(hospt);
            }
        }catch (Exception e){
            errorMsg.append(e.getMessage());
            return null;
        }
        return hospitals;
    }

    public static String getDoctorsOfHospitals(int hosptId){
        String list="";
        try {

            statement = getConnection().createStatement();
            resultSet = statement.executeQuery("select doctors.id,doctors.name from channel INNER JOIN doctors ON channel.docId=doctors.id where hospitalId="+hosptId);


            while (resultSet.next()) {
                list=list+"$"+(resultSet.getString(1)+"#"+resultSet.getString(2));
            }
        }catch (Exception e){
            errorMsg.append(e.getMessage());
            return null;
        }
        return list;
    }

    public static String getChannelUpdate(int id){
        try {

            statement = getConnection().createStatement();
            resultSet = statement.executeQuery("select patientNo,lastUpdated  from channel  where id="+id);

            java.util.Date date= new java.util.Date();
            Timestamp now =new Timestamp(date.getTime());

            while (resultSet.next()) {
                String text;
                Timestamp lastUpdated=resultSet.getTimestamp(2);

                long dif = now.getTime()-lastUpdated.getTime();
                long difmin=dif/60000;

                if(difmin<60){
                        text="Last updated : "+difmin+" minutes ago";
                }else{
                    long hh = difmin / 60;
                    if(hh<24) {
                        hh = difmin / 60;
                        long mm = difmin % 60;

                        text ="Last updated : "+ hh+" hrs and "+mm+" mins ago";
                    }else{
                        text ="Last updated : "+ hh/24 +" days ago";
                    }
                }
                return resultSet.getInt(1)+"#"+text;
            }
        }catch (Exception e){
            errorMsg.append(e.getMessage());
            return null;
        }
        return null;
    }

    public static String getChannelSessions(int hosptId,int docId){
        String list="";
        try {

            statement = getConnection().createStatement();
         //   resultSet = statement.executeQuery("select channel.id,channel.weekDay, channel.time  from channel INNER JOIN doctors ON channel.docId=doctors.id where hospitalId=" + hosptId + " and docId=" + docId);
            resultSet = statement.executeQuery("select channel.id,channel.weekDay, channel.time  from channel  where hospitalId="+hosptId+" and docId="+docId);

            while (resultSet.next()) {
                list=list+"$"+(resultSet.getInt(1)+"#"+resultSet.getString(2)+"-"+resultSet.getString(3));
            }
        }catch (Exception e){
            errorMsg.append(e.getMessage());
            return null;
        }
        return list;
    }

    public static boolean validateUserAdmin(String email,String pwd){

        if(!email.equals("malinda")){
            return false;
        }
        try {

            statement = getConnection().createStatement();
            resultSet = statement.executeQuery("select * from users where email='" + email+"' and pwd='"+pwd+"'");

            if (resultSet.next()) {
                return true;
            }
        }catch (Exception e){
            errorMsg.append(e.getMessage());
            return false;
        }
        return false;
    }
    public static boolean validateUser(String email,String pwd,int hosptID){

        try {

            statement = getConnection().createStatement();
            resultSet = statement.executeQuery("select * from users where email='" + email+"' and pwd='"+pwd+"' and hospitalID="+hosptID);

            if (resultSet.next()) {
                return true;
            }
        }catch (Exception e){
            errorMsg.append(e.getMessage());
            return false;
        }
        return false;
    }

    public static String setChannelCount(int channelId,int count, String email, String pwd,int hosptID){
        errorMsg = new StringBuilder();
        if(!validateUser(email,pwd,hosptID)){
            return "Invalid Email or Password";
        }
        try {
            java.util.Date date= new java.util.Date();
            Timestamp now =new Timestamp(date.getTime());

            preparedStatement = getConnection()
                    .prepareStatement("update channel set patientNo=" + count + ",lastUpdated='" + now + "' where id=" + channelId);

            preparedStatement.executeUpdate();

            return "";
        }catch (Exception e){
            errorMsg.append(e.getMessage());
            e.printStackTrace();
            return e.getMessage();
        }
    }

    public static String addDoctor(Doctor doc, String email, String pwd){
        errorMsg = new StringBuilder();
        if(!validateUserAdmin(email, pwd)){
            return "Invalid Email or Password";
        }
        try {

            preparedStatement = getConnection()
                    .prepareStatement("insert into  doctors values ( ?, ?,?,?)");

            preparedStatement.setInt(1, doc.getID());
            preparedStatement.setString(2, doc.getName());
            preparedStatement.setInt(3,doc.getType());
            preparedStatement.setString(4, doc.getPhone());


            preparedStatement.executeUpdate();

            return null;
        }catch (Exception e){
            errorMsg.append(e.getMessage());
            e.printStackTrace();
            return e.getMessage();
        }
    }
    public static String addChannel(Channel  ch, String email, String pwd,int hosptID){
        errorMsg = new StringBuilder();
        if(!validateUser(email,pwd,hosptID)){
            return "Invalid Email or Password";
        }
        try {

            java.util.Date date= new java.util.Date();
            Timestamp now =new Timestamp(date.getTime());


            preparedStatement = getConnection()
                    .prepareStatement("insert into  channel values ( ?,?,?,?,?,?,?,?,?,?)");

            preparedStatement.setInt(1, ch.getID());
            preparedStatement.setInt(2, ch.getDocID());
            preparedStatement.setInt(3,ch.getHospitalID());
            preparedStatement.setString(4, ch.getWeekDay());

           preparedStatement.setString(5, ch.getTime());
             preparedStatement.setDate(6, (Date) ch.getNextDate());

            preparedStatement.setInt(7, 0);
            preparedStatement.setInt(8, ch.getMaxPatients());
            preparedStatement.setInt(9, 0);
            preparedStatement.setTimestamp(10, now);


            preparedStatement.executeUpdate();

            return null;
        }catch (Exception e){
            errorMsg.append(e.getMessage());
            e.printStackTrace();
            return e.getMessage();
        }
    }
}
