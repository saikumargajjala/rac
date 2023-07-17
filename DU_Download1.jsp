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
			
			
			 <form action="DU_Download2.jsp" method="post" name="form1" id="form1">
        <p>
          <%
		  
		    	try 
				{
		  		String file = request.getParameter("t1");
				String trapdoor="";
				String sk="";
				String user=(String) application.getAttribute("uname");
				
				String strQuery = "select trapdoor,sk from cloudserver where fname='"+file+"'";
				ResultSet rs = connection.createStatement().executeQuery(strQuery);
				{
					if(rs.next()==true)
					{
						trapdoor=rs.getString(1);
						
						 sk=rs.getString(2);
						
							
					
									%>
        </p>
							<table width="478" border="0" align="center">
							  <tr>
								<td width="223" height="40" bgcolor="#FF0000"><span class="style11 style1"><strong>Enter File Name :-</strong></span></td>
								<td width="245"><label>
								  <input required="required" name="t1" type="text" value="<%=file%>" size="40" />
								</label></td>
							  </tr>
							  <tr>
								<td height="47" bgcolor="#FF0000"><span class="style11 style1"><strong>Trapdoor :-</strong></span></td>
								<td><input name="t12" type="text" value="<%=trapdoor%>" size="40" /></td>
							  </tr>
							  <tr>
								<td height="37" bgcolor="#FF0000"><span class="style11 style1"><strong>Secret Key :-</strong></span></td>
								<td><input name="t13" type="text" value="<%=sk%>" size="40" /></td>
							  </tr>
							  <tr>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
							  </tr>
							  <tr>
								<td><div align="right"></div></td>
								<td><label>
								  <input type="submit" name="Submit2" value="Decrypt and Download" />
								</label></td>
							  </tr>
			   </table>
							<p>
							  <%
						
					}
					else
					{
		
						%><br/><br/>
							<p><a href="UserMain.jsp">Back<strong></strong></a></p>
							<p><h1 class="style4">File   Doesn't   Exist !!!</h1></p><%
			%>
        </p>
        <p>
          <%
					}
				}
	 
           connection.close();
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
          }
%>
        </p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
      </form>
           
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
