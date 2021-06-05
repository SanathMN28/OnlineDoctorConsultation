<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<%
String user=(String)session.getAttribute("user");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Prescription</title>
 <style>
        body{
              margin: 0;
              padding: 0;
              font-family: sans-serif;
              background: #34495e;
              font-size: 12px;
              background-image:url("images/bg4.jpg") ;
              background-size: cover;
            }
            .box{
              width: 350px;
              height: 600px;
              color:white;
              padding-top: 5px;
              padding-left: 40px;
              padding-bottom: 5px;
              padding-right: 40px;
              position: absolute;
              top: 50%;
              left: 50%;
              transform: translate(-50%,-50%);
              background: linear-gradient(rgba(5, 169, 190, 0.8),rgba(5, 149, 185, 0.8)); 
              border-radius: 40px 0px;
            }
            button{
            border: 0;
            background: none;
            /* margin: 15px; */
            /*text-align: center;*/
            border: 2px solid white;
             /* padding: 0px 100px;  */
            width: 120px;
            color: white;
            border-radius: 24px;
            outline: none;
            margin-top: 20px;
            margin-bottom: 20px;
            padding: 7px;
            
            }
            input{
              margin-bottom: 20px;
              padding: 6px;
            }
           button:hover{
               background-color: white;
               color: black;
           }
           .box h1{
               text-align: center;
           }
    </style>
</head>
<body>
<sql:setDataSource var="myDS" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/OnlineDoctorConsultation" 
     user="root" password="admin@123"/>
     
         <sql:query dataSource="${myDS}" var="Prescription">
      SELECT * FROM observation WHERE patient_id=(SELECT patient_id FROM patient WHERE p_username LIKE "<%=user %>");
    </sql:query>
     <c:forEach var="row" items="${Prescription.rows}">
     


    <div class=box>
        <h1>My Prescription</h1>
          <table>
          <tr>
                <td><label for="">Doctor ID</label></td>
                <td><c:out value="${row.doc_id}"/>
                <c:set var="did" scope="request" value="${row.doc_id}"/>
                </tr>
          
          <tr>
                <td><br></td>
                </tr>
            <tr>
                <td><label for="">Prescription</label></td>
                <td><c:out value="${row.prescription}"/>
                </tr>
                <tr>
                <td><br></td>
                </tr>
                <tr>
                  <td><label for="">Medicine</label></td>
                  <td><c:out value="${row.meds_prescribed}"/></td>
                </tr>
                
            </c:forEach>
                <%
                int dod=Integer.parseInt(request.getAttribute("did")+"");
                %>
                 <sql:query dataSource="${myDS}" var="doctor">
                          SELECT * FROM doctor WHERE doc_id=<%=dod%>;
                 </sql:query>
                 <c:forEach var="row" items="${doctor.rows}">
     
               <tr>
             <td><br>
             </td>
             </tr>
             <tr>
                  <td><label for="">Doctor Name</label></td>
                  <td><c:out value="${row.doc_name}"/></td>
                </tr>
                <tr>
             <td><br>
             </td>
             </tr>
             <tr>
                  <td><label for="">Specialization</label></td>
                  <td><c:out value="${row.doc_specialization}"/></td>
                </tr>
                <tr>
             <td><br>
             </td>
             </tr>
              <tr>
                  <td><label for="">Contact</label></td>
                  <td><c:out value="${row.doc_contact}"/></td>
                </tr>
             </c:forEach>
                <tr>
                    <td><a href="Rating.html"><button type="button">Review</button></a></td>
                    <td><a href="payment.html"><button type="button">Payment</button></a></td>
                    
                    <td><a href="PatientDashboard.jsp"><button type="button">Go To Dashboard</button></a></td>
                </tr>
      </table>
      </div> 
</body>
</html>