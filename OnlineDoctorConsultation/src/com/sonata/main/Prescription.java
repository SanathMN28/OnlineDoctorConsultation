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


@WebServlet("/Prescription")
public class Prescription extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String observation=request.getParameter("obs");
		String medicine=request.getParameter("med");
		
		HttpSession session=request.getSession(false);  
        int pid=Integer.parseInt(session.getAttribute("pid")+"");
        int did=Integer.parseInt(session.getAttribute("did")+"");
        
        PatientDAOImpl dao=new PatientDAOImpl();
        int check=dao.observation(pid, did, observation, medicine);
        
        if(check==1) {
           RequestDispatcher rd=request.getRequestDispatcher("./ObservationSuccess.html");
           rd.include(request, response);
        }
        
        
        
        //System.out.println(pid+" "+did+" "+observation+" "+medicine);


	}
		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
