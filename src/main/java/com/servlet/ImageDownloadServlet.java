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
 * Created by MalindaK on 12/29/2016.
 */
@WebServlet(name = "ImageDownloadServlet")
public class ImageDownloadServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String img = request.getParameter("img");
            int hosptID = Integer.parseInt(request.getParameter("hosptID"));
            String image = DBLink.getImage(hosptID, img);

            PrintWriter out = response.getWriter();
            out.println(image);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
