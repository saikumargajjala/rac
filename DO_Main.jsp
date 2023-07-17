<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Data Owner Main</title>
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
.style1 {	color: #FF0000;
	font-weight: bold;
}
.style2 {font-size: 24px}
-->
</style>
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
          <h2><span>Welcome <%=application.getAttribute("doname")%>  </span></h2>
          <p class="infopost">&nbsp;</p>
          <div class="clr">
            <div class="img"><img src="images/img1.jpg" width="177" height="340" alt="" class="fl" /></div>
          </div>
          <div class="post_content">
            <p align="justify"><span class="style1">Phrase search allows retrieval of documents containing an exact phrase, which plays an important role in many machine learning applications for cloud-based IoT, such as intelligent medical data analytics. In order to protect sensitive information from being leaked by service providers, documents (e.g., clinic records) are usually encrypted by data owners before being outsourced to the cloud. This, however, makes the search operation an extremely challenging task. Existing searchable encryption schemes for multi-keyword search operations fail to perform phrase search, as they are unable to determine the location relationship of multiple keywords in a queried phrase over encrypted data on the cloud server side. In this paper, we propose P3, an efficient privacy-preserving phrase search scheme for intelligent encrypted data processing in cloud-based IoT. Our scheme exploits the homomorphic encryption and bilinear map to determine the location relationship of multiple queried keywords over encrypted data. It also utilizes a probabilistic trapdoor generation algorithm to protect users’ search patterns. Thorough security analysis demonstrates the security guarantees achieved by P3. We implement a prototype and conduct extensive experiments on real-world datasets. The evaluation results show that compared with existing multikeyword search schemes, P3 can greatly improve the search<br />
accuracy with moderate overheads.</span></p>
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
                <li><a href="DO_Main.jsp">Home</a></li>
				<li><a href="DO_Upload.jsp">Upload</a></li>
				
			    <li><a href="DO_View_Files.jsp">View Files</a></li>
				  <li><a href="DO_Delete_File.jsp">Delete Files</a></li>
				   <li><a href="DO_View_File_Transactions.jsp">View Your Transaction</a></li>
				
				
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
