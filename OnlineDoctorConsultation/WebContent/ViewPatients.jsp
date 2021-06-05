<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<%
String user=(String)session.getAttribute("user");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Patients List</title>
<link rel="stylesheet" type="text/css" href="Frontend.css" />

</head>
<body>
<p style="background-color:rgb(44, 99, 124);font-family:'Times New Roman';font-size:20px; color: whitesmoke; padding-left: 50px;">List Of Patients<span class="tab">Go To Dashboard: <a href="DoctorDashboard.jsp"> Click Here</a></span></p>
<table style="margin-left:auto; margin-right:auto">
<style>

.tab{
       margin-left:1000px;
       }
       
       a{
            text-decoration:none;
            color:rgb(255, 255, 255);
        }
        
</style>
<tr>
<th><b>Booking ID</b></th>
<th><b>Patient ID</b></th>
<th><b>Date</b></th>
</tr>
<tr>
<td>
<br>
</td>
</tr>
<sql:setDataSource var="myDS" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/OnlineDoctorConsultation" 
     user="root" password="admin@123"/>
     
         <sql:query dataSource="${myDS}" var="Patient">
      SELECT * FROM schedules WHERE doc_id=(SELECT doc_id FROM doctor WHERE d_username LIKE "<%=user %>");
    </sql:query>
     <c:forEach var="row" items="${Patient.rows}">
<tr>
  <td><c:out value="${row.s_id}"/>  
  <td><c:out value="${row.patient_id}"/>  
  <td><c:out value="${row.doc_schedule}"/>
</tr>
<c:set var="did" scope="session" value="${row.doc_id}"/>
</c:forEach>
</table>
  <br/>
  <br/>
  <form action="CompleteView.jsp">
 <label style="font-size: 20px">Patient ID :</label><input type="number" placeholder="Enter Patient ID" name="pid" id="pid" required/>
  <br/>
  <br/>
  <button type="submit">View Details</button>
  </form>
     

</body>
</html>