package com.servlet;

import com.mkpt.Advertisement;
import com.mkpt.DBLink;
import org.apache.commons.io.IOUtils;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


/**
 * Created by MalindaK on 12/27/2016.
 */
@WebServlet(name = "loadAdPhotosServlet")
public class loadAdPhotosServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        java.io.PrintWriter out = response.getWriter();

        String email=request.getParameter("email");
        String pwd = request.getParameter("pwd");
        int hosptID =  Integer.parseInt(request.getParameter("hosptID"));

        Advertisement ad=new Advertisement();
        try { ad.setImg0(IOUtils.toInputStream(request.getParameter("img0").replaceAll(" ","+"), "UTF-8")); }catch (Exception e){}
        try { ad.setImg1(IOUtils.toInputStream(request.getParameter("img1"), "UTF-8")); }catch (Exception e){}
        try { ad.setImg2(IOUtils.toInputStream(request.getParameter("img2"), "UTF-8")); }catch (Exception e){}
//        try { ad.setImg3(IOUtils.toInputStream(request.getParameter("img3"), "UTF-8")); }catch (Exception e){}

        System.out.println("\n");
        System.out.println(request.getParameter("img0"));
        System.out.println("\n");

        String res = DBLink.adImages(hosptID,ad,email,pwd);
        if(res!=null){
            out.println("Error:  "+res);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
