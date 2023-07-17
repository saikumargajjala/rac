<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
	<%@page import ="java.util.*"%>
<%@ include file="connect.jsp" %>
<%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream" %>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
<html><style type="text/css">
<!--
body {
	background-color: #FFFFFF;
}
-->
</style>
<body>
<%
int uid = Integer.parseInt(request.getParameter("usid"));
String fname = request.getParameter("fname");

String downer=(String)application.getAttribute("doname");
try {
		String msg="";
		
			String task="Delete";
			String pk="Not Predicted";
			
			SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
			SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
			Date now = new Date();

			String strDate = sdfDate.format(now);
			String strTime = sdfTime.format(now);
			String dt = strDate + "   " + strTime;
			
			 Statement st=connection.createStatement();
		String strQuery2 = "insert into transaction(user,fname,sk,task,dt) values('"+downer+"','"+fname+"','"+pk+"','"+task+"','"+dt+"')";
				st.executeUpdate(strQuery2);
				
				
				
		String quer="delete from cloudserver where id='"+uid+"'";
		Statement st3=connection.createStatement();
		int rs3=st3.executeUpdate(quer);
		response.sendRedirect("DO_Delete_File.jsp");
		if(rs3==1)
		{
			msg="File Deleted Sucessfully";
			response.sendRedirect("DO_Delete_File.jsp");
			application.setAttribute("msg",msg);

		}
		
	 
	}
	catch(Exception e)
	{
		out.println(e.getMessage());
	}
%></body></html>
