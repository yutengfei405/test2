<!--#include file="conn.asp"-->
<html>

<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>ף����</title>
<link rel="stylesheet" href="css/css1.css" type="text/css">
</head>

<body topmargin="3">
<table width=100% border=0 cellspacing=0 cellpadding=0>
  <tr> 
    <td height=22 class=a><font face="Arial"><b><font size="3" color="#FF6600">��</font><font size="3">��û�е�½�����½!</font></b></font></td>
    <td align=right><a href="main.asp"><font color="#000000">������ҳ</font></a></td>
  </tr>
  <tr> 
    <td  colspan=2></td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td align=center background="images/v.gif"></td>
  </tr>
</table>

<%
ename=replace(request("ename")," ","")
pwd=replace(request("pwd")," ","")

set rsname=server.CreateObject("adodb.recordset")
sql= "select * from schedule_member where ename='"&ename&"'"
rsname.Open sql,conn,1,3

if not rsname.EOF then
%> <script language="vbscript">
<!--
           msgbox "���ʺ��Ѿ�����,�뷵�������",,"ϵͳ��ʾ"
           window.history.back 
 -->
 </script> <%
rsname.Close  
response.end
end if
rsname.Close 
set rsname=nothing


sql="select * from schedule_member"
set rs=server.CreateObject("adodb.recordset")
rs.Open sql,conn,1,3

rs.AddNew 
rs("ename")=ename
rs("pwd") =pwd
rs.Update
rs.Close
set rs=nothing
conn.close
set conn=nothing

%>
<p>��</p>
<div align="center">
  <center>
    <table border="1" cellpadding="0" cellspacing="1" style="border-collapse: collapse" bordercolor="#A1A1A1"  id="AutoNumber3" width="448" >
      <tr>
        <td width="100%" height="25" bgcolor="#95B8FF"><b>&nbsp;<font color="#FFFFFF">�������ɹ�</font></b></td>
    </tr>
    <tr>
      <td width="100%" height="160" bgcolor="#EFEFEF">
          <p align="center"><font size="2">ף����ע��ɹ���</font></p>
          <p align="center">&nbsp; 
        </td>
    </tr>
    <tr>
        <td width="100%" height="25" bgcolor="#95B8FF"> 
          <p align="center">
      <input type="button" value=" �� �� " name="B3" class="s02" onclick="window.location='main.asp'">
        </td>
    </tr>
  </table>
  </center>
</div>

</body>

</html>
