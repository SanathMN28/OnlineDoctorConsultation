package com.sonata.main;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sonata.DAOImpl.PatientDAOImpl;


@WebServlet("/ValidateLogin")
public class ValidateLogin extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      response.setContentType("text/html");
	      PrintWriter out=response.getWriter();
	      
	      String userName=request.getParameter("username");
	      String password=request.getParameter("pwd");
	      
	      PatientDAOImpl dao=new PatientDAOImpl();
	      boolean check=dao.validateLogin(userName, password);
	      
	      if(check==true) {
	    	    HttpSession session=request.getSession();
	    	    session.setAttribute("username", userName);
				RequestDispatcher rd=request.getRequestDispatcher("./PatientDashboard.jsp");
				rd.include(request, response);

	      }
	      else {
	    	  RequestDispatcher rd=request.getRequestDispatcher("./RegistrationInvalid.html");
				rd.include(request, response);
	      }
	      
	}
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
