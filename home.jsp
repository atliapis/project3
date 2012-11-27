<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>The Photografic Album</title>
	<link href="home.css" rel="stylesheet" type="text/css" />
	<link rel="icon" href="icon.ico" type="image/ico" />
	<link rel="shortcut icon" href="icon.ico" />
</head>


<body>

	<div class="container">
		<div class="header">
			<a href="#"><img src="" name="logo" width= 128px height= 90px style="background-image: url(logo.png); display:block;" /></a> 
		</div>
		
		<div class="content">
			<form action="upload" method="POST" enctype="multipart/form-data">
			
			<center>
			<table border="0">
			<tr>
				<td align="right"><b>Image Caption:</td>
				<td ><input type="text" name="caption"></td>
			</tr>
			<tr>
				<td align="right"><b>Choose Image:</td>
				<td>
					<input name="file" type="file" id="file">
				<td>
			</tr>
			<tr>
				<td align="right">
					<input type="submit" name="submit" value="Submit"/>
				</td>
				<td align="left">
					<input type="reset" name="Reset" value="Reset"/>
				</td>
			</tr>
			</table>

			<a href="/project3/sessionCounter.jsp">Press here to see site statistics</a>
			
			<div id="mainImg">
			<iframe src="files/images/BurjKhalifaMarch2012.jpeg" width="100%" height="300" scrolling="auto" seamless="1" frameborder="0" name="imgFrame"></iframe>
			</div>

			<div class="thumbs">
				<%@ taglib uri="taglib.tld" prefix="im" %> 
				<im:imagesGrid dir="files/images/" col="4" space="5" showNames="false" width="140" height="80" target="imgFrame"/>
			</div>
    
			</center>

		</div>
		
		<div class="footer">
    
		</div>
		
	</div>
</body>
</html>
