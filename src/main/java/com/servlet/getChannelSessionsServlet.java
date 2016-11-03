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
 * Created by admin on 11/4/2016.
 */
@WebServlet(name = "getChannelSessionsServlet")
public class getChannelSessionsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter resp = response.getWriter();
        int hospId= Integer.parseInt(request.getParameter("hospId"));
        int docId= Integer.parseInt(request.getParameter("docId"));

        String res = DBLink.getChannelSessions(hospId,docId);
        resp.print(res);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
