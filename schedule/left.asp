<html>
<head>
<script>
function switchSysBar1(){
if (switchPoint1.innerText==6){
switchPoint1.innerText=5
document.all("first").style.display="none"
}else{
switchPoint1.innerText=6
document.all("first").style.display=""
}}
function switchSysBar2(){
if (switchPoint2.innerText==6){
switchPoint2.innerText=5
document.all("second").style.display="none"
}else{
switchPoint2.innerText=6
document.all("second").style.display=""
}}
</script>
<meta http-equiv="content-type" content="text/html; charset=gb2312"> <title>我的日程安排</title> 
<!--
<link href=/styleMail.css rel=stylesheet type=text/css>
--> <style type=text/css>
<!-- -->
</style>
<link rel="stylesheet" href="css/css.css" type="text/css">
</head>
<body bgcolor=#FDCD68 topmargin=0 marginheight=0>
<div align="center"><br>
  <b><font size="3">日程安排</font></b><br>
  <br>
</div>
<TABLE BORDER="0" WIDTH="100%" CELLSPACING="1" CELLPADDING="2" ALIGN="center" BGCOLOR="#FFFFFF" BORDERCOLOR="#000000">
  <TR> 
    <TD WIDTH="100%" ALIGN="center" BGCOLOR="#FF9900" HEIGHT="22"><FONT COLOR="#FFFFFF"><B>·日程安排·</B></FONT></TD>
  </TR>
  <TR> 
    <TD WIDTH="100%" ALIGN="center" BGCOLOR="FFDB91" HEIGHT="20"><A HREF="main.asp" TARGET="mainFrame">日程安排</A></TD>
  </TR>
  <TR> 
    <TD WIDTH="100%" ALIGN="center" BGCOLOR="FFDB91" HEIGHT="20"><a href="memberadd.asp" TARGET="mainFrame">我要注册</a></TD>
  
  <TR>
    <TD WIDTH="100%" ALIGN="center" BGCOLOR="FFDB91" HEIGHT="20"><a href="login.asp" target="mainFrame">我要登录</a></TD>
  
  <TR> 
    <TD WIDTH="100%" ALIGN="center" BGCOLOR="FFDB91" HEIGHT="20"><A HREF="../default1.asp" TARGET="_parent">返回首页</A></TD>
</TABLE>
<span class="areanormal"><span class="inputedit"><span class="inputnormal"></span></span></span> 
<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber1">
  <tr> 
    <td> 
      <table border="0" cellpadding="0" cellspacing="1" style="border-collapse: collapse" bordercolor="#111111" width="100%" bgcolor="#FFFFFF" height="24">
        <tr bgcolor="#FF9900"> 
          <td onClick="switchSysBar2()" style="height: 100%" width="83%" height="22" align="center">&nbsp;<b><font color="#FFFFFF"><b>·</b>修改密码<b>·</b></font></b></td>
          <td onClick="switchSysBar2()" style="height: 100%" bgcolor="#FF9900" align="center" width="17%" height="20"> 
            <p align="center"> <font style="color: #6699cc; cursor: hand; font-family: Webdings; font-size: 9pt"> 
              <span id="switchPoint2">6</span></font> 
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr> 
    <td id="second"> <iframe name="testinfo" scrolling="no" target="main" height="140" width="100%" border="0" frameborder="0" src="editpwd.asp"> 
      </iframe></td>
  </tr>
</table>
<div align="center"><font color="#FFFFFF"><font color="#000000">高处不胜寒版权所有</font></font><br>
</div>
<div align="center"><br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
</div>
</body></html>        
