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
 * Created by admin on 11/6/2016.
 */
@WebServlet(name = "getChannelUpdateServlet")
public class getChannelUpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PrintWriter resp = response.getWriter();

        int channelId= Integer.parseInt(request.getParameter("channelId"));
        resp.print(DBLink.getChannelUpdate(channelId));
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
