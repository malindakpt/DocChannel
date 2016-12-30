package com.servlet;

import com.mkpt.Channel;
import com.mkpt.DBLink;
import com.mkpt.Doctor;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by admin on 11/3/2016.
 */
@WebServlet(name = "createChannelServlet")
public class createChannelServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter resp = response.getWriter();

        int hospitalId= Integer.parseInt(request.getParameter("hospital"));
        int doctorId= Integer.parseInt(request.getParameter("docId"));
        String weekDay= request.getParameter("weekDay");
        String time= request.getParameter("time");
        int max= Integer.parseInt(request.getParameter("max"));

        String email= request.getParameter("email");
        String pwd= request.getParameter("pwd");

        Channel ch = new Channel();
        ch.setHospitalID(hospitalId);
        ch.setDocID(doctorId);
        ch.setWeekDay(weekDay);
        ch.setTime(time);
        ch.setMaxPatients(max);


        String result= DBLink.addChannel(ch, email, pwd,hospitalId);
        if(result!=null){
            resp.println(result);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
