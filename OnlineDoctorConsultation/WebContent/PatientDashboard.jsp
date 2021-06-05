<%
session.setAttribute("user", session.getAttribute("username"));
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Patient Dashboard</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Pangolin&display=swap" rel="stylesheet">
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Lobster&family=Pangolin&display=swap" rel="stylesheet">
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Lobster&family=Pangolin&family=Parisienne&family=Sacramento&display=swap" rel="stylesheet">
  <link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Audiowide&family=Bungee+Inline&family=Lobster&family=Pangolin&family=Parisienne&family=Rye&family=Sacramento&family=Train+One&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Reggae+One&display=swap" rel="stylesheet">

<link href="http://fonts.googleapis.com/css?family=Lato:300,400,400italic,600,700|Raleway:300,400,500,600,700|Crete+Round:400italic" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="vendor/fontawesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="vendor/themify-icons/themify-icons.min.css">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
      background-color: rgb(60, 110, 151);
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 677px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color:rgb(164, 224, 252);
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: rgb(60, 110, 151);
      color: white;
      padding: 15px;
    }
    a:hover{
      color: rgb(119, 73, 3);
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
    }
  </style>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#" style="color: rgb(253, 249, 249); font-family: 'Reggae One', cursive; font-size: 22px;"><b>Online Doctor Consulatation</b></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="HomePage.html" style="color: rgb(253, 253, 253); font-family: 'Reggae One', cursive; font-size: 16px;">Home</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="Patientlogin.html"  style="color: rgb(253, 249, 249); font-family: 'Reggae One', cursive;font-size: 16px;"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
      </ul>
    </div>
  </div>
</nav>
  
<div class="container-fluid text-center"  style="background-image: url(./images/alt.jpg); background-size: 1700px 700px;">    
  <div class="row content">
    <div class="col-sm-2 sidenav"  style="background-color:rgb(164, 224, 252)">
        <div class="list-group rounded-0">
            <a href="#" class="list-group-item list-group-item-action active border-0 d-flex align-items-center">
              <span class="ml-2" style="color: rgb(253, 253, 253); font-family: 'Reggae One', cursive; font-size: 15px;">Patient Dashboard</span>
            </a>
            <a href="PatientDetails.jsp" class="list-group-item list-group-item-action border-0 align-items-center">
             
              <span class="ml-2"><b>My Profile</b></span>
            </a>
            <a href="DoctorsList.html" class="list-group-item list-group-item-action border-0 align-items-center">
              <span class="ml-2"><b>List of Doctors</b></span>
            </a>
            <a href="BookAppointment.html" class="list-group-item list-group-item-action border-0 align-items-center">
              <span class="ml-2"><b>Book Appointment</b></span>
            </a>
            <a href="payment.html" class="list-group-item list-group-item-action border-0 align-items-center">
              <span class="ml-2"><b>Payment</b></span>
            </a> 
            <a href="Rating.html" class="list-group-item list-group-item-action border-0 align-items-center">
              <span class="ml-2"><b>Feedback</b></span>
            </a> 
          </div>
    </div>
    
    <div class="container-fluid container-fullw bg-white" style="padding-top: 40px; padding-left: 40px;">
      <div class="row">
        <div class="col-sm-3">
          <div class="panel panel-white no-radius text-center">
            <div class="panel-body">
              <a href="PatientDetails.jsp">
              <span class="fa-stack fa-2x"> <i class="fa fa-square fa-stack-2x text-primary"></i> <i class="fa fa-user fa-stack-1x fa-inverse"></i> </span>
            </a>
            <h2 class="StepTitle" style="font-family: 'Parisienne', cursive;"><b>My Profile</b></h2>
              
              <p class="links cl-effect-1">
                <a href="PatientDetails.jsp">
                  View Profile
                </a>
              </p>
            </div>
          </div>
        </div>
        <div class="col-sm-3">
          <div class="panel panel-white no-radius text-center">
            <div class="panel-body">
              <a href="DoctorsList.html">
              <span class="fa-stack fa-2x"> <i class="fa fa-square fa-stack-2x text-primary"></i> <i class="fa fa-user-md fa-stack-1x fa-inverse"></i> </span>
            </a>
            <h2 class="StepTitle" style="font-family: 'Parisienne', cursive; color: black;"><b>List of Doctors</b></h2>
            <a href="DoctorsList.html">
              <p class="cl-effect-1">
                View Doctors List here
              </p>
            </a>  
            </div>
          </div>
        </div>
        
        <div class="col-sm-3">
          <div class="panel panel-white no-radius text-center">
            <div class="panel-body">
              <a href="BookAppointment.html">
              <span class="fa-stack fa-2x"> <i class="fa fa-square fa-stack-2x text-primary"></i> <i class="fa fa-calendar fa-stack-1x fa-inverse"></i> </span>
              </a>
              <h2 class="StepTitle" style="font-family: 'Parisienne', cursive;"><b>Book Appointment</b></h2>
            
              <p class="cl-effect-1">
                <a href="BookAppointment.html">
                  Book your appointment here
                </a>
              </p>
            </div>
          </div>
        </div>
        <div class="col-sm-3">
          <div class="panel panel-white no-radius text-center">
            <div class="panel-body">
              <a href="ViewPrescription.jsp">
              <span class="fa-stack fa-2x"> <i class="fa fa-square fa-stack-2x text-primary"></i> <i class="fa fa-eye fa-stack-1x fa-inverse"></i> </span>
              </a>
              <h2 class="StepTitle" style="font-family: 'Parisienne', cursive;"><b>View Prescription</b></h2>
            
              <p class="cl-effect-1">
                <a href="ViewPrescription.jsp">
                  View your Prescription here
                </a>
              </p>
            </div>
          </div>
        </div>
        <div class="col-sm-3">
          <div class="panel panel-white no-radius text-center">
            <div class="panel-body">
              <a href="payment.html">
              <span class="fa-stack fa-2x"> <i class="fa fa-square fa-stack-2x text-primary"></i> <i class="fa fa-money fa-stack-1x fa-inverse"></i> </span>
            </a>
            <h2 class="StepTitle" style="font-family: 'Parisienne', cursive;"><b>Payment</b></h2>
            
              <p class="cl-effect-1">
                <a href="payment.html">
                  Pay your Bills here
                </a>
              </p>
            </div>
          </div>
        </div>

        <div class="col-sm-3">
          <div class="panel panel-white no-radius text-center">
            <div class="panel-body">
              <a href="Rating.html">
              <span class="fa-stack fa-2x"> <i class="fa fa-square fa-stack-2x text-primary"></i> <i class="fa fa-star fa-stack-1x fa-inverse"></i> </span>
              </a>
              <h2 class="StepTitle" style="font-family: 'Parisienne', cursive;"><b>Feedback</b></h2>
            
              <p class="cl-effect-1">
                <a href="Rating.html">
                  Give your valuable Feedback here!!
                </a>
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!--<div class="col-sm-2 sidenav">
      <div class="well">
        <p>ADS</p>
      </div>
      <div class="well">
        <p>ADS</p>
      </div>
    </div>-->
  </div>
</div>

<footer class="container-fluid text-center">
  <p  style="color: rgb(253, 249, 249); font-family: 'Reggae One', cursive;">Seamless across Consults,Diagnostics, Procedures and Medicines</p>
</footer>

</body>
</html>
