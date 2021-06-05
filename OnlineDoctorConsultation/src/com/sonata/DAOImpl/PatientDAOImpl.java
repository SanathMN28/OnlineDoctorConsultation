package com.sonata.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Statement;
import com.sonata.DAO.PatientDAO;
import com.sonata.Model.Patient;;

public class PatientDAOImpl implements PatientDAO {
	int row=0;
	DBConnection db=new DBConnection();
    Connection con=db.getConnection();
    Patient pat=null;
	public int getPatientId(Object obj) {
		pat=(Patient)obj;
		int id=0;
		try {
			PreparedStatement ps=con.prepareStatement("SELECT patient_id FROM patient WHERE p_username LIKE ?");
			ps.setString(1, pat.getUserName());
			ResultSet rs=ps.executeQuery();
			rs.next();
			id=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return id;
	}

	@Override
	public int insertPatient(Object obj) {
		pat=(Patient)obj;
		try {
			PreparedStatement ps=con.prepareStatement("INSERT INTO patient(p_username,p_password,p_name,p_contact,p_location) VALUES(?,?,?,?,?)");
			ps.setString(1, pat.getUserName());
			ps.setString(2, pat.getPassword());
			ps.setString(3, pat.getName());
			ps.setLong(4, pat.getContact());
			ps.setString(5, pat.getLocation());
			/*
			ps.setString(6, pat.getScheduleTime());
			ps.setString(7, pat.getConsultHist());
			ps.setString(8, pat.getHealthHist());
			*/
			ps.executeUpdate();
			
			PatientDAOImpl dao1=new PatientDAOImpl();
			PreparedStatement ps1=con.prepareStatement("INSERT INTO patient_login(patient_id,p_username,p_password) VALUES(?,?,?)");
			int id=dao1.getPatientId(pat);
			ps1.setInt(1,id);
			ps1.setString(2, pat.getUserName());
			ps1.setString(3, pat.getPassword());
			row=ps1.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return row;
	}
	
	public boolean validateLogin(String u,String p) {
		try {
			PreparedStatement ps=con.prepareStatement("SELECT p_username,p_password FROM patient_login");
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				if(u.equals(rs.getString(1))) {
					if(p.equals(rs.getString(2))) {
						return true;
					}
				}
				
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	public boolean validateLoginDr(String u,String p) {
		try {
			PreparedStatement ps=con.prepareStatement("SELECT d_username,d_password FROM doctor_login");
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				if(u.equals(rs.getString(1))) {
					if(p.equals(rs.getString(2))) {
						return true;
					}
				}
				
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public int updatePatient(Object obj, int id) {
		pat=(Patient)obj;
		try {
			PreparedStatement ps=con.prepareStatement("UPDATE patient SET p_password=?, p_name=?, p_contact=?, p_location=? WHERE patient_id="+id);
			ps.setString(1, pat.getPassword());
			ps.setString(2, pat.getName());
			ps.setLong(3, pat.getContact());
			ps.setString(4, pat.getLocation());
			ps.executeUpdate();
			
			PreparedStatement ps1=con.prepareStatement("UPDATE patient_login SET p_password=? WHERE patient_id="+id);
			ps1.setString(1, pat.getPassword());
			row=ps1.executeUpdate();
		

	}catch(SQLException e) {
		e.printStackTrace();
	}
return row;

}
	public int bookAppointment(int pid,int did,String date,String health,String consult) {
		try {
			PreparedStatement ps=con.prepareStatement("UPDATE patient SET p_consultation_scheduled=?, p_consultation_history=?, p_health_history=? WHERE patient_id=?");
			ps.setString(1, date);
			ps.setString(2, consult);
			ps.setString(3, health);
			ps.setInt(4, pid);
			ps.executeUpdate();
			
			PreparedStatement ps1=con.prepareStatement("INSERT INTO schedules(doc_schedule,doc_id,patient_id) VALUES(?,?,?)");
			ps1.setString(1,date);
			ps1.setInt(2, did);
			ps1.setInt(3, pid);
			row=ps1.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return row;
	}
	
	public int observation(int pid,int did,String obs,String med) {
		try {
			PreparedStatement ps=con.prepareStatement("INSERT INTO observation(patient_id,doc_id,prescription,meds_prescribed) VALUES(?,?,?,?)");
			ps.setInt(1,pid);
			ps.setInt(2, did);
			ps.setString(3, obs);
			ps.setString(4, med);
			row=ps.executeUpdate();
			
			PreparedStatement ps1=con.prepareStatement("DELETE FROM schedules WHERE doc_id=? AND patient_id=?");
			ps1.setInt(1, did);
			ps1.setInt(2, pid);
			ps1.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return row;
	}
}
