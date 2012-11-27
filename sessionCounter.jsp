<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>The Photografic Album - Session Counter</title>
	<link href="home.css" rel="stylesheet" type="text/css" />
	<link rel="icon" href="icon.ico" type="image/ico" />
	<link rel="shortcut icon" href="icon.ico" />
</head>


<body>

	<div class="container">
		<div class="header">
			<a href="/project3/home.jsp"><img src="" name="logo" width= 128px height= 90px style="background-image: url(logo.png); display:block;" /></a> 
		</div>
		
		<div class="content">

			<center>
			<TABLE BORDER=0 class="stats">
			<jsp:useBean class="moreservlets.listeners.SessionCounter" id="sessionCounter" scope="application" />
				<tr>
				<td>Total Sessions: </td>
				<td><jsp:getProperty name="sessionCounter" property="totalSessionCount" /></td>
				</tr>
				<tr>
				<td>Current Sessions: </td>
				<td><jsp:getProperty name="sessionCounter" property="currentSessionCount" /></td>
				</tr>
				<tr>
				<td>Max Sessions: </td>
				<td><jsp:getProperty name="sessionCounter" property="maxSessionCount" /></td>
				</tr>
			</TABLE>
			<center>

		</div>
		
		<div class="footer">
    
		</div>
		
	</div>
</body>
</html>
