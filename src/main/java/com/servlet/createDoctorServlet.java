package com.servlet;

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
 * Created by admin on 11/2/2016.
 */
@WebServlet(name = "createDoctorServlet")
public class createDoctorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter resp = response.getWriter();

        String docName= request.getParameter("docName");
        String docPhone= request.getParameter("docPhone");
        int docType= Integer.parseInt(request.getParameter("docType"));

        String email= request.getParameter("email");
        String pwd= request.getParameter("pwd");

        Doctor doc = new Doctor();
        doc.setName(docName);
        doc.setPhone(docPhone);
        doc.setType(docType);

        String result=DBLink.addDoctor(doc,email,pwd);
        if(result!=null){
            resp.println(result);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("asd");
    }
}
