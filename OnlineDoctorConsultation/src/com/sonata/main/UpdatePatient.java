package com.sonata.main;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sonata.DAOImpl.PatientDAOImpl;
import com.sonata.Model.Patient;

@WebServlet("/UpdatePatient")
public class UpdatePatient extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		int id=Integer.parseInt(request.getParameter("id"));
		String password=request.getParameter("pwd");
		String name=request.getParameter("name");
		long contact=Long.parseLong(request.getParameter("contact"));
		String loc=request.getParameter("location");
		
		Patient p=new Patient();
		p.setPassword(password);
		p.setName(name);
		p.setContact(contact);
		p.setLocation(loc);
		
		PatientDAOImpl dao=new PatientDAOImpl();
		int check=dao.updatePatient(p, id);
		if(check==1) {
            RequestDispatcher rd=request.getRequestDispatcher("./UpdateSuccessfully.html");
            rd.include(request, response);
			
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
