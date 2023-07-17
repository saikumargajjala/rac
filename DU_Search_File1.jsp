<%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
<%@page import ="java.sql.*"%>
<%@page import ="java.io.*"%>
<%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page import="java.sql.*,java.util.Random"%>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@ include file="connect.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>DU_Search_File</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-titillium-250.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>
<style type="text/css">
<!--
.style6 {
	font-size: 24px;
	color: #FF0000;
}
.style9 {color: #FFFF00; font-weight: bold; }
.style11 {color: #FF0000; font-weight: bold; }
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo">
        <h1><span class="style6"><a href="index.html">Secure Phrase Search for Intelligent Processing of <br />
        Encrypted Data in Cloud Based IoT</a></span></h1>
      </div>
      <div class="menu_nav">
        <ul>
          <li class="active"><a href="DU_Main.jsp"><span>Home </span></a></li>
          <li><a href="DU_Login.jsp"><span>Logout</span></a></li>
          <li><a href="#"></a></li>
          <li><a href="#"></a></li>
          <li><a href="#"></a></li>
        </ul>
      </div>
      <div class="clr"></div>
      <div class="slider">
        <div id="coin-slider"><a href="#"><img src="images/slide1.jpg" width="935" height="307" alt="" /></a> <a href="#"><img src="images/slide2.jpg" width="935" height="307" alt="" /></a> <a href="#"><img src="images/slide3.jpg" width="935" height="307" alt="" /></a></div>
        <div class="clr"></div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
          <h2><span>Searched File</span></h2>
         
          <table width="594" border="1" align="center">
            <tr>
              <td width="86" height="29" bgcolor="#FF0000"><div align="center" class="style9"><span class="style15">File ID </span></div></td>
              <td width="204" bgcolor="#FF0000"><div align="center" class="style9"><span class="style15">File Name </span></div></td>
              <td width="97" bgcolor="#FF0000"><div align="center" class="style9"><span class="style15">Rank </span></div></td>
              <td width="210" bgcolor="#FF0000"><div align="center" class="style9"><span class="style15">Download</span></div></td>
              <%	  
			  
			  
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int i=0,j=0,k=0,count=0;
    String user=(String)application.getAttribute("uname");
try 
  {
        
            String keyword = request.getParameter("t14");
      		String keys = "ef50a0ef2c3e3a5f";
      		String h1="";
      	
      		
			SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
			SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");

			Date now = new Date();
		
			String strDate = sdfDate.format(now);
			String strTime = sdfTime.format(now);
			String dt = strDate + "   " + strTime;
			
      					
			String task1="Search";
			
			
			
			String strQuery22 ="insert into search(user,keyword,dt) values('"+user+"','"+keyword+"','"+dt+"')";
			connection.createStatement().executeUpdate(strQuery22);
				
				String query="select * from cloudserver"; 
				Statement st=connection.createStatement();
				ResultSet rs=st.executeQuery(query);
				while ( rs.next() )
				{count++;
					i=rs.getInt(1);
					s2=rs.getString(2);
					
					s4=rs.getString(3);
					String rank=rs.getString(6);
					
					byte[] keyValue = keys.getBytes();
      				Key key = new SecretKeySpec(keyValue, "AES");
      				Cipher c = Cipher.getInstance("AES");
					c.init(Cipher.DECRYPT_MODE,key);
					String decryptedValue = new String(Base64.decode(s4.getBytes()));
					
					
					
					if(decryptedValue.toLowerCase().contains(keyword.toLowerCase()))
					{
						
								
								int updaterank = Integer.parseInt(rank)+1;
								String strQuery2 = "update cloudserver set rank="+updaterank+" where fname='"+s2+"'";
								connection.createStatement().executeUpdate(strQuery2);
							
						%>
			</tr>
						<tr>
						<td height="28"><div align="center" class="style11"><%=i%></div></td>
						<td><div align="center" class="style11"><%=s2%></div></td>
						<td><div align="center" class="style11"><%=rank%></div></td>
						<td><div align="center" class="style11"><a href="DU_Search_Download.jsp?fname=<%=s2%>"> <%=s2%> </a></div></td>
						</tr>
						<%
					
					}
					else
					{ }
					
			    }
			
			if(count==0)
			{
			%>
									            <h2>No File Found !!!</h2>

					<%
			}
				
				%>
         
            <br />

            <%  
			
			
			
			
			connection.close();
	}
	catch(Exception e)
	{
	out.println(e.getMessage());
	}
%>
          </table>
		  
		  <p>&nbsp;</p>
		   <p>
		
          <a href="DU_Main.jsp"> Back</a></p>
        </div>
        <div class="clr"></div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="fbg"></div>
  <div class="footer"></div>
</div>
<div align=center></div>
</body>
</html>
