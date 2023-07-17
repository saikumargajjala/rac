<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>DO_Upload</title>
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
.style4 {color: #FFFF00}
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
          <h2><span>Upload</span> Details !!! </h2>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
           <form id="form1" name="form1" method="post" action="DO_Upload1.jsp">
                        <p>&nbsp;</p>
                        <table width="553" border="0" align="center">
                          <tr>
                            <td width="286" bgcolor="#FF0000"><span class="odd style14 style28"><span class="style4 style16 style11 odd"><strong> Select File :</strong></span></span></td>
                            <td width="356"><input required="required" type="file" name="t42" id="file"  onchange="loadFileAsText()" /></td>
                          </tr>
                          
                          <tr>
                            <td bgcolor="#FF0000" class="odd style14 style28"><span class="style4 style16 style11 odd"><strong>File Name :</strong></span> </td>
                            <td><input required="required" name="tt" type="text" id="t42" size="49"/></td>
                          </tr>
                          <tr>
                            <td bgcolor="#FF0000">&nbsp;</td>
                            <td><textarea name="text" id="textarea" cols="50" rows="15"></textarea></td>
                          </tr>
                          <tr>
                            <td bgcolor="#FF0000"><span class="style4 style16 style11 odd"><strong>Trapdoor :</strong></span></td>
                            <td><input name="t4" type="text" id="t4" size="49" value="" readonly="readonly" /></td>
                          </tr>
                          <tr>
                            <td><div align="right"></div></td>
                            <td><input type="submit" name="Submit" value="Encrypt" /></td>
                          </tr>
             </table>
                        <p>&nbsp;</p>
                        <p><a href="DO_Main.jsp">Back</a></p>
          </form>
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
