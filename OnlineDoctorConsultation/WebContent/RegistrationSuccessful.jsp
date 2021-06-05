<%
String userid=(String)session.getAttribute("userid");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="RegistrationSuccessful.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Lobster&family=Pangolin&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Lobster&family=Pangolin&family=Parisienne&family=Sacramento&display=swap" rel="stylesheet">
</head>
<body>
    <div id='card' class="animated fadeIn">
        <div id='upper-side'>
            <i class="fa fa-check"></i>
            <h3 id='status'> Success </h3> 
        </div>
        <div id='lower-side'>
          <p id='message'>
            <b style="font-family: 'Parisienne', cursive; font-size: 23px;">Congratulations, Successfully Registered.</b>
          </p>
          <b>Your Patient ID :</b><%=userid%>
          <a href="Patientlogin.html" id="contBtn">Continue</a>
        </div>
      </div>
</body>
</html>