package com.servlet;

import com.mkpt.DBLink;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by admin on 11/5/2016.
 */
@WebServlet(name = "setChannelCountServlet")
public class setChannelCountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter resp = response.getWriter();

        int channelId= Integer.parseInt(request.getParameter("channelId"));
        int patientNo= Integer.parseInt(request.getParameter("patientNo"));
        int hosptID= Integer.parseInt(request.getParameter("hosptID"));

        String email= request.getParameter("email");
        String pwd= request.getParameter("pwd");

        String result = DBLink.setChannelCount(channelId,patientNo,email,pwd,hosptID);

        resp.print(result);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
