
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<%
int id=Integer.parseInt(request.getParameter("pid"));
session.setAttribute("pid", id);
session.setAttribute("did",session.getAttribute("did"));

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient</title>
    <script>
        function onValidate(){
            FirstName=document.getElementById("fname").value;
            LastName=document.getElementById("lname").value;
            MobileNumber=document.getElementById("mobile").value;

            var  correct_way=/^[A-Za-z]+$/;
            if (FirstName==null || FirstName==""){  
                 alert("Name can't be blank");  
                 return false;  
            }
            if(FirstName.match(correct_way)){
                 true;
            }
            else{

                 alert("The First name should not contain special Characters");
                 return false;
           }
           if(LastName.match(correct_way)){
                true;
           }
           else{
            alert("The Last name should not contain special Characters");
                 return false; 
           }
           if(MobileNumber.length!=10 || MobileNumber.charAt(0)=="0"){
               alert("Please enter proper Phone number");
               return false;

           }
        }

    </script>
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
     
         <sql:query dataSource="${myDS}" var="Patient">
      SELECT * FROM patient WHERE patient_id=<%=id %>;
    </sql:query>
     <c:forEach var="row" items="${Patient.rows}">
     


    <div class=box>
        <h1>Patient Details</h1>
    <form action="./Prescription" method="post">
          <table>
          <tr>
                <td><label for="">ID</label></td>
                <td><c:out value="${row.patient_id}"/>
                </tr>
          
          <tr>
                <td><br></td>
                </tr>
            <tr>
                <td><label for="">Name</label></td>
                <td><c:out value="${row.p_name}"/>
                </tr>
                <tr>
                <td><br></td>
                </tr>
                <tr>
                  <td><label for="">Contact</label></td>
                  <td><c:out value="${row.p_contact}"/></td>
                </tr>
                <tr>
                <td><br></td>
                </tr>
    
                <tr>
                  <td><label for="">Location</label></td>
                  <td><c:out value="${row.p_location}"/></td>
                </tr>
                <tr>
                <td><br></td>
                </tr>
                <tr>
                  <td><label for="">Health History</label></td>
                  <td><c:out value="${row.p_health_history}"/></td>
                  
                </tr>
                
                  <tr>
                <td><br></td>
                </tr>
                  <tr>
                    <td><label for="">Consultation History</label></td>
                  <td><c:out value="${row.p_consultation_history}"/></td>
                  </tr>
                  <tr>
                <td><br></td>
                </tr>
                </c:forEach>
                <tr>
                    <td><label for="">Observation</label></td>
                    <td><textarea name="obs" id="obs" rows="5" cols="30" placeholder="Observation"></textarea></td>
                    
                </tr>
                <tr>
                <td><br></td>
                </tr>
                <tr>
                    <td><label for="">Medicine</label></td>
                    <td><textarea name="med" id="med" rows="5" cols="30" placeholder="Medicine Prescription"></textarea></td>
                    
                </tr>
             
             <tr>
             <td><br>
             </td>
             </tr>
                <tr>
                    <td><button type="submit" onclick="return validateform()">Submit</button></td>
                    <td><a href="ViewPatients.jsp"><button type="button">Back</button></a></td>
                </tr>
      </table>
    </form>
</div> 
</body>
</html>