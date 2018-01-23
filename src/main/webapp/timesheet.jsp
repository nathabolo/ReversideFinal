<%@page contentType = "text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Timesheet Processing</title>
</head>
<body>

<h1>Process timesheet here</h1>

<%

String employeeNumber = request.getParameter("Employeenumber");
String firstName = request.getParameter("Name");
String lastName = request.getParameter("Surname");
String email = request.getParameter("Email");
String description = request.getParameter("Description");
String startDate = request.getParameter("startDate");
String clientName = request.getParameter("ClientName");
String totalHours = request.getParameter("StartDate");

%>
<table border="">
<tbody>
<tr>

<td>Employee Number: </td>
<td><%=employeeNumber %></td>
<td>Name: </td>
<td><%=firstName %></td>
<td>Surname: </td>
<td><%=lastName %></td>
<td>Email: </td>
<td><%=email %></td>
<td>Description: </td>
<td><%=description %></td>
<td>Start Date: </td>
<td><%=startDate %></td>
<td>Client Name: </td>
<td><%=clientName %></td>
<td>Total Hours: </td>
<td><%=totalHours %></td>
</tr>
</tbody>
</table>
</body>
</html>