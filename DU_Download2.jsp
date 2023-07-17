<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
<%@page import ="java.sql.*"%>
<%@page import ="java.io.*"%>
<%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page import="java.sql.*,java.util.Random"%>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@ include file="connect.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>DU_Download1</title>
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
.style11 {color: #FFFF00}
-->
</style>
<script type='text/javascript'>

function saveTextAsFile()
{
	var textToWrite = document.getElementById("textarea").value;
	var textFileAsBlob = new Blob([textToWrite], {type:'text/plain'});
	var fileNameToSaveAs = "File.txt";

	var downloadLink = document.createElement("a");
	downloadLink.download = fileNameToSaveAs;
	downloadLink.innerHTML = "Download File";
	if (window.webkitURL != null)
	{
		// Chrome allows the link to be clicked
		// without actually adding it to the DOM.
		downloadLink.href = window.webkitURL.createObjectURL(textFileAsBlob);
	}
	else
	{
		// Firefox requires the link to be added to the DOM
		// before it can be clicked.
		downloadLink.href = window.URL.createObjectURL(textFileAsBlob);
		downloadLink.onclick = destroyClickedElement;
		downloadLink.style.display = "none";
		document.body.appendChild(downloadLink);
	}

	downloadLink.click();
}

function destroyClickedElement(event)
{
	document.body.removeChild(event.target);
}



</script>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo">
        <h1><a href="index.html"><span>Secure Phrase Search for Intelligent Processing of Encrypted Data in Cloud Based IoT</span></a><a href="index.html"><span></span></a></h1>
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
          <h2><span>Download File !!! </span></h2>
          <p class="infopost">&nbsp;</p>
          <div class="clr"></div>
          <div class="article">
            <p>&nbsp;</p>
			
			
			<%
		  	
			try 
			{
		  		String file = request.getParameter("t1");
				String trapdoor=request.getParameter("t12");
				String sk=request.getParameter("t13");
				String ct="";
				String user=(String) application.getAttribute("uname");
				String strQuery1 = "select * from cloudserver where fname='"+file+"'";
				String strQuery2 = "select * from cloudserver where fname='"+file+"' and  trapdoor='"+trapdoor+"'";
			     String strQuery3 = "select * from cloudserver where fname='"+file+"' and sk='"+sk+"'";
				
				
				
					ResultSet rs1 = connection.createStatement().executeQuery(strQuery1);
					if(rs1.next()==true)
					{
							ResultSet rs2 = connection.createStatement().executeQuery(strQuery2);
							if(rs2.next()==true)
							{
								ct=rs2.getString(3);

									ResultSet rs3 = connection.createStatement().executeQuery(strQuery3);
									if(rs3.next()==true)
									{
									
								
									
										String rank=rs2.getString(6);
										
										int updaterank = Integer.parseInt(rank)+1;
										String strQuer = "update cloudserver set rank='"+updaterank+"' where fname='"+file+"'";
										connection.createStatement().executeUpdate(strQuer);
										
										SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
										SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
					
										Date now = new Date();
					
										String strDate = sdfDate.format(now);
										String strTime = sdfTime.format(now);
										String dt = strDate + "   " + strTime;	
										
										
										String task="Download";
										String Query2 = "insert into transaction(user,fname,sk,task,dt) values('"+user+"','"+file+"','"+sk+"','"+task+"','"+dt+"')";
										connection.createStatement().executeUpdate(Query2);
										
										
										String keys = "ef50a0ef2c3e3a5f";
										byte[] keyValue1 = keys.getBytes();
										Key key1 = new SecretKeySpec(keyValue1,"AES");
										Cipher c1 = Cipher.getInstance("AES");
										c1.init(Cipher.DECRYPT_MODE, key1);
										String decryptedValue = new String(Base64.decode(ct.getBytes()));
										%>
										</p>
										<p align="center" class="style4">File Contents</p>
										<label>
										<div align="center">
										<textarea name="text" id="textarea" cols="45" rows="17"><%=decryptedValue%></textarea>
										<br/>
										<br/>
										<td><button onclick="saveTextAsFile()">Download</button></td>
										</div>
										</label>
										<p align="center">&nbsp;</p>
										<p align="center"><a href="DU_Main.jsp">Back</a> </p>
										<p>
										<%	
									}
									else
									{
										SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
										SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
				
										Date now = new Date();
						
										String strDate = sdfDate.format(now);
										String strTime = sdfTime.format(now);
										String dt = strDate + "   " + strTime;
								
										String str="SecretKey";
										
										
										String strQuer1 = "insert into attacker(user,fname,sk,dt,attacktype) values('"+user+"','"+file+"','"+sk+"','"+dt+"','"+str+"')";
										connection.createStatement().executeUpdate(strQuer1);
								
										%>
										</p>
										<p> </p>
										<h1 class="style4">Secret Key Mismatch !!!</h1>
										</p>
										<br />
										<p><a href="DU_Main.jsp">Back</a></p>
										<%
									}
							}
							else
							{
								SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
								SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
		
								Date now = new Date();
				
								String strDate = sdfDate.format(now);
								String strTime = sdfTime.format(now);
								String dt = strDate + "   " + strTime;
						
								String type="Trapdoor";


								String strQuer2 = "insert into attacker(user,fname,sk,dt,attacktype) values('"+user+"','"+file+"','"+sk+"','"+dt+"','"+type+"')";
								connection.createStatement().executeUpdate(strQuer2);
						
								%>
								</p>
								<p> </p>
								<h1 class="style4">Trapdoor Mismatch !!!</h1>
								</p>
								<br />
								<p><a href="DU_Main.jsp">Back</a></p>
								<%
							}
					}
					else
					{
		
						%>
						</p>
						<p> </p>
						<h1 class="style4">File Doesn't Exist !!!</h1>
						</p>
						<br />
						<p><a href="DU_Main.jsp">Back</a></p>
						<%
					}
        	connection.close();
	  } 
	  catch(Exception e)
	  {
		out.println(e.getMessage());
	  }
%>
           
          </div>
          <div class="clr"></div>
        </div>
      </div>
      <div class="sidebar">
        <div class="searchform">
          <form id="formsearch" name="formsearch" method="post" action="#">
            <span>
            <input name="editbox_search" class="editbox_search" id="editbox_search" maxlength="80" value="Search :" type="text" />
            </span>
            <input name="button_search" src="images/search.gif" class="button_search" type="image" />
          </form>
        </div>
        <div class="clr"></div>
        <div class="g1">
          <div class="g2">
            <div class="gadget">
              <h2 class="star">Menu</h2>
              <div class="clr"></div>
              <ul class="sb_menu">
                <li><a href="DU_Main.jsp">Home</a></li>
               
                <li><a href="DU_Login.jsp">Logout</a></li>
              </ul>
            </div>
          </div>
        </div>
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
