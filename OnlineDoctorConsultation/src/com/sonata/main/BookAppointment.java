package com.sonata.main;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sonata.DAOImpl.PatientDAOImpl;


@WebServlet("/BookAppointment")
public class BookAppointment extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		int id=Integer.parseInt(request.getParameter("Pid"));
		//String name=request.getParameter("PName");
		int did=Integer.parseInt(request.getParameter("DNames"));
		String date=request.getParameter("Adate");
		String health=request.getParameter("H_History");
		String consult=request.getParameter("C_History");
		
		PatientDAOImpl dao=new PatientDAOImpl();
		int check=dao.bookAppointment(id, did, date, health, consult);
		
		if(check==1) {
           RequestDispatcher rd=request.getRequestDispatcher("./BookSuccessful.html");
           rd.include(request, response);
		}
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
