<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@page import ="java.util.*"%>
<%@ include file="connect.jsp" %>
    <%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
    <%@ page import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream" %>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
 <%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>DO_View_Files</title>
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
.style2 {font-size: 24px}
.style5 {color: #FFFFFF}
.style7 {color: #FF0000; font-weight: bold; }
-->
</style>

<script language="javascript" type='text/javascript'>
function loadFileAsText()
{
	var fileToLoad = document.getElementById("file").files[0];

	var fileReader = new FileReader();
	fileReader.onload = function(fileLoadedEvent) 
	{
		var textFromFileLoaded = fileLoadedEvent.target.result;
		document.getElementById("textarea").value = textFromFileLoaded;
	};
	fileReader.readAsText(fileToLoad, "UTF-8");
}

</script>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo">
        <h1><a href="index.html" class="style2">Secure Phrase Search for Intelligent Processing of<br /> 
        Encrypted Data in Cloud Based IoT</a></h1>
      </div>
      <div class="menu_nav">
        <ul>
          <li class="active"><a href="DO_Main.jsp"><span>Home </span></a></li>
          <li><a href="DO_Login.jsp">Logout</a></li>
          <li><a href="#"><span> </span></a></li>
          <li><a href="#"><span> </span></a></li>
          <li><a href="#"><span></span></a></li>
          <li><a href="#"><span> </span></a></li>
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
          <h2><span>View All File </span>Details !!! </h2>
          <p>&nbsp;</p>
           <table width="591" border="1" align="center">
                <tr>
                  <td width="86" height="30" bgcolor="#FF0000"><div align="center" class="style5 style21"><strong><span class="style23">Owner  ID </span></strong></div></td>
                  <td width="168" bgcolor="#FF0000"><div align="center" class="style5 style21"><strong><span class="style23">File Name </span></strong></div></td>
                  <td width="176" bgcolor="#FF0000"><div align="center" class="style5 style21"><strong><span class="style23">Data Owner </span></strong></div></td>
                  <td width="176" bgcolor="#FF0000"><div align="center" class="style5 style21"><strong><span class="style23">Date &amp; Time </span></strong></div></td>
                  <%	  
			  
			  
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int i=0,j=0,k=0;
	String downer=(String)application.getAttribute("doname");
	
	
try 
	{
        	String stat="No";
			String timestat="Yes";
      		String query="Select * from cloudserver"; 
            Statement st=connection.createStatement();
            ResultSet rs=st.executeQuery(query);
			while ( rs.next() )
			{
					i=rs.getInt(1); // id
					s2=rs.getString(2); // fname
					s4=rs.getString(7); //dt
					s3=rs.getString(8); // owner
					 

					
					String keys = "ef50a0ef2c3e3a5f";
					byte[] keyValue = keys.getBytes();
					Key key = new SecretKeySpec(keyValue, "AES");
					Cipher c = Cipher.getInstance("AES");
					c.init(Cipher.DECRYPT_MODE, key);
					String dt = new String(Base64.decode(s4.getBytes()));
		
						%>
                </tr>
                <tr>
                  <td height="28"><div align="center" class="style7"><%=i%></div></td>
                  <td><div align="center" class="style7"><a href="DO_View_File_Details.jsp?fname=<%=s2%> & id=<%=i%>"><%=s2%></a></div></td>
                  <td><div align="center" class="style7"><%=s3%></div></td>
                  <td><div align="center" class="style7"><%=dt%></div></td>
                  <%
			 		
	  		}
           connection.close();
	  }
	 
	  catch(Exception e)
	  {
		out.println(e.getMessage());
	  }
%>
                </tr>
          </table>
           <p>&nbsp;</p>
            <a href="DO_Main.jsp">Back</a><br />
           <div class="clr"></div>
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
                <li><a href="DO_Main.jsp">Home</a></li>
                <li><a href="DO_Login.jsp">Logout</a></li>
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
