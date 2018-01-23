<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.sql.* "%>
<%@ page import="java.util.Date"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>


<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
	
	<script type="jquery-1.11.2.js"></script>
	<script type="text/javascript">
	
	$(document).ready(function() {
		var jsonString = '{"result":"success","data":"{\"Email\":[\"stemko@gmail.com\"],\"Description\":[\"Software Developer\"],\"Start Date\":[\"18-01-2018\"],\"submit\":[\"\"],\"Employee number\":[\"400\"],\"Client Name\":[\"Discovery\"],\"Surname\":[\"Kobola\"],\"Total Hours\":[\"30\"],\"Name\":[\"Mpho\"]}"}'
		var timesheetJSON = JSON.parse(jsonString)
		$.each(timesheetJSON, function (i, item){
			
			var result = '';
			
			result += "Employee number - " + item.empNumber + "<br/>";
			result += "Name - " + item.name + "<br/>";
			result += "Surname - " + item.surname + "<br/>";
			result += "Email - " + item.email + "<br/>";
			result += "Description - " + item.description + "<br/>";
			result += "Start date - " + item.startDate + "<br/>";
			result += "Client name - " + item.clientName + "<br/>";
			result += "Total Hours - " + item.totalHours + "<br/><br/>";
			
			
		});	
		
		$("#resultDiv").html(result);
	});
	
	</script>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">

<title>Submit temesheet or leave form</title>



<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">

<style type="text/css">
body {
	margin: 0;
	padding: 0;
	/*  Background fallback in case of IE8 & down, or in case video doens't load, such as with slower connections  */
	background: #333;
	background-attachment: fixed;
	background-size: cover;
}

/* The only rule that matters */
#video-background {
	/*  making the video fullscreen  */
	position: fixed;
	right: 0;
	bottom: 0;
	min-width: 100%;
	min-height: 100%;
	width: auto;
	height: auto;
	z-index: -100;
}

/* These just style the content */
article {
	/*  just a fancy border  */
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	border: 10px solid rgba(255, 255, 255, 0.5);
	margin: 10px;
}

h1 {
	position: absolute;
	top: 60%;
	width: 100%;
	font-size: 50px;
	letter-spacing: 3px;
	color: #fff;
	font-family: Oswald, sans-serif;
	text-align: center;
}

p  button {
	font-size: 25px;
}

h1 marquee {
	margin-top: 5px;
}

h1 span {
	font-family: sans-serif;
	letter-spacing: 0;
	font-weight: 300;
	font-size: 16px;
	line-height: 24px;
}

h1 span a {
	color: #fff;
}

.logo {
	position: top;
}
</style>

</head>
<body>
	<div class="container-fluid">


		<!--  Video is muted & autoplays, placed after major DOM elements for performance & has an image fallback  -->
		<video autoplay loop id="video-background" muted plays-inline>
			<source
				src="https://player.vimeo.com/external/158148793.hd.mp4?s=8e8741dbee251d5c35a759718d4b0976fbf38b6f&profile_id=119&oauth2_token_id=57447761"
				type="video/mp4">
		</video>

		<c:if test="${pageContext.request.userPrincipal.name != null}">
			<form id="logoutForm" method="POST" action="${contextPath}/logout">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
			</form>
		</c:if>

		<nav class="navbar navbar-inverse" style="background-color: white;">
			<div class="navbar-header" style="margin-top: 15px">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="logo"><img class="img-responsive" src="/image.jpg"
					alt="Reverside" title="Logo"></a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar"
				style="margin-top: 15px">
				<ul class="nav navbar-nav">
					<li class="active"><a href="https://www.reverside.co.za/">Home</a></li>
					<li><a href="https://www.reverside.co.za/services">Services</a></li>
					<li><a href="https://www.reverside.co.za/clients">Clients</a></li>
					<li><a href="https://www.reverside.co.za/blog">Blog</a></li>
					<li><a href="https://www.reverside.co.za/careers">Careers</a></li>
					<li><a href="https://www.reverside.co.za/careers">News</a></li>
					<li><a href="https://www.reverside.co.za/">More</a></li>
				</ul>
				<div class="navbar-header navbar-right" style="margin-top: 15px">
					<ul class="nav navbar-nav">
						<li>
							<!-- Trigger the modal with a button -->
							<Button class="btn-link" type="image" data-toggle="modal"
								data-target="#myModal">
								<span class="glyphicon glyphicon-log-in"><a
									onclick="document.forms['logoutForm'].submit()">Logout</a></span>
							</Button>
						</li>
					</ul>

				</div>

			</div>
		</nav>


		<h1 align="center" style="color: #2196F3">
			<marquee direction="down" width="1500" height="300"
				behavior="alternate" style="border: transparent">
				<marquee behavior="alternate"> Welcome to Reverside
					${pageContext.request.userPrincipal.name} </marquee>
			</marquee>
		</h1>

		<div class="button-fluid" style="padding: 40px" align="center">

			<p style="align: center">
				<!-- Trigger the modal with a button -->
				<Button class="btn-link" type="submit" data-toggle="modal"
					data-target="#myModal2">
					<span class="glyphicon glyphicon-log-in" style="color: #2196F3">Fill
						in your timesheet here!!</span>
				</Button>
			</p>

			<p style="align: center">
				<!-- Trigger the modal with a button -->
				<Button class="btn-link" type="submit" data-toggle="modal"
					data-target="#myModal">
					<span class="glyphicon glyphicon-log-in" style="color: #2196F3">Fill
						in your leave form here!!</span>
				</Button>
			</p>

		</div>
				<!-- Leave form Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header" style="padding: 35px 50px;">
						<button type="button" class="send" data-dismiss="modal">&times;</button>
						<h4 align="center" style="color: #2196F3">
							<span class="glyphicon glyphicon-lock"></span>Leave form
						</h4>
					</div>
					<div class="modal-body" style="padding: 40px 50px;">
						<form role="form" id="timesheet" method="POST"
							action="https://script.google.com/macros/s/AKfycbxhA0A9Xw-q-NYvtaHP5TxYe0iTbrT6fFsnKL_-sHa5bgGtHxI/exec">
							<div class="form-group">
								<input type="text" class="form-control" id="empNumber"
									placeholder="Enter your employee number" required
									name="Employee number">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" id="name"
									placeholder="Enter name" required name="Name">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" id="surname"
									placeholder="Enter surname" required name="Surname">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" id="email"
									placeholder="Enter email address" required name="Email">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" id="startDay"
									placeholder="Enter start day" required name="Start Day">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" id="endDay"
									placeholder="Enter end day" required name="End day">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" id="numOfDays"
									placeholder="Enter number of days" required name="Number of days">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" id="reason"
									placeholder="Enter reason for taking leave" required
									name="Reason for taking leave">
							</div>
							
							<div class="form-group">
								<input type="text" class="form-control" id="department"
									placeholder="Enter department name" required
									name="Department name">
							</div>
					</div>
				</div>

				<div class="checkbox" style="color: white">
					<p>SELECT LEAVE TYPE</p>
					<p>
						<label><input type="checkbox" value="">Annual
							leave</label> <label><input type="checkbox" value="">Sick
							leave</label> <label><input type="checkbox" value="">Study
							leave</label> <label><input type="checkbox" value="">Maternity
							leave</label> <label><input type="checkbox" value="">Family
							Responsibility leave</label>
					</p>
				</div>

				<!-- Customise the Thankyou Message People See when they submit the form: -->
				<div style="display: none;" id="thankyou_message">
					<h2>
						<em>Thanks</em> for contacting us! We will get back to you soon!
					</h2>
				</div>
				<button type="submit" class="btn btn-success btn-block"
					name="submit">
					<span class="glyphicon glyphicon-on"></span>Submit leave form
				</button>
				</form>

			</div>
		</div>
		
		
		
		
		
		
		
		


		<!-- Timesheet Modal -->
		<div class="modal fade" id="myModal2" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header" style="padding: 35px 50px;">
						<button type="button" class="send" data-dismiss="modal">&times;</button>
						<h4 align="center" style="color: #2196F3">
							<span class="glyphicon glyphicon-lock"></span>Timesheet
						</h4>
					</div>
					<div class="modal-body" style="padding: 40px 50px;">
						<form role="form" id="timesheet" method="POST"
							
action="https://script.google.com/macros/s/AKfycbx5mBN5qvVD1SfKNWzD_-36FEUs-QgX8iuFuJeAT1vzAun8lRat/exec">
							<input type="hidden" name="submitted" value="true">
							<div class="form-group">
								<b><input type="text" class="form-control" id="empNumber"
									placeholder="Enter your employee number" required
									name="Employeenumber"></b>
							</div>
							<div class="form-group">
								<input type="text" class="form-control" id="name"
									placeholder="Enter name" required name="Name">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" id="surname"
									placeholder="Enter surname" required name="Surname">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" id="email"
									placeholder="Enter email address" required name="Email">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" id="descrption"
									placeholder="Enter description" required name="Description">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" id="clientName"
									placeholder="Enter cleint name" required name="ClientName">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" id="startDate"
									placeholder="Enter start date" required name="StartDate">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" id="totalHours"
									placeholder="Enter total hours worked" required
									name="Total Hours">
							</div>
					</div>
				</div>

				<div class="checkbox" style="color: white">
					<p>CHOOSE NORMAL, OVERTIME OR HALF DAY</p>
					<p>
						<label><input type="checkbox" value="">Normal
							week day</label> <label><input type="checkbox" value="">Overtime</label>
						<label><input type="checkbox" value="">Half day</label>
					</p>
				</div>

				<!-- Customise the Thankyou Message People See when they submit the form: -->
				<div style="display: none;" id="thankyou_message">
					<h2>
						<em>Thanks</em> for contacting us! We will get back to you soon!
					</h2>
				</div>
				<button type="submit" class="btn btn-success btn-block"
					name="submit">
					<span class="glyphicon glyphicon-on"></span>Submit time sheet
				</button>
				</form>

			</div>
		</div>


	</div>

	<!-- /container -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>

	<script>

var form = document.getElementById(timesheet);
form.onsubmit = function(e){
	e.preventDefault();
	console.log(form.empNumber);
};

</script>

	<script data-cfasync="false" type="text/javascript"
		src="https://cdn.rawgit.com/dwyl/html-form-send-email-via-google-script-without-server/master/form-submission-handler.js"></script>
		
		<div id="resultDiv"></div>

</body>
</html>
