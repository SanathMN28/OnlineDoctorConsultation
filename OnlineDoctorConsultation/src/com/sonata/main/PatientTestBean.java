package com.sonata.main;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sonata.DAOImpl.PatientDAOImpl;
import com.sonata.Model.Patient;


@WebServlet("/PatientTestBean")
public class PatientTestBean extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String userName=request.getParameter("username");
		String password=request.getParameter("pwd");
		String name=request.getParameter("name");
		long contact=Long.parseLong(request.getParameter("contact"));
		String loc=request.getParameter("location");
		//String schTime=request.getParameter("");
		//String consultHist=request.getParameter("");
		//String healthHist=request.getParameter("");
		
		Patient p=new Patient();
		p.setUserName(userName);
		p.setPassword(password);
		p.setName(name);
		p.setContact(contact);
		p.setLocation(loc);
		//p.setScheduleTime("2021-05-12 10:20:35");
		//p.setConsultHist("xvdrggffhhf");
		//p.setHealthHist("hjjhhgh");
		
		PatientDAOImpl dao=new PatientDAOImpl();
		int i=dao.insertPatient(p);
		if(i==1) {
	        HttpSession session=request.getSession(true);  
	        session.setAttribute("userid", dao.getPatientId(p)+"");

			RequestDispatcher rd=request.getRequestDispatcher("./RegistrationSuccessful.jsp");

			
			rd.include(request, response);
		}
		
		
		
		
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
