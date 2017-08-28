<!--#include file="conn.asp"-->

<html>
<head>
<title>日程安排详细内容</title>

<script language="javascript">

function open_Event_Name() {
  popupWin = window.open('help.asp?ID=Event_Name', 'remote', 'width=300,height=200')
}
function open_Event_Date() {
  popupWin = window.open('help.asp?ID=Event_Date', 'remote', 'width=300,height=200')
}
function open_Event_Time() {
  popupWin = window.open('help.asp?ID=Event_Time', 'remote', 'width=300,height=200')
}
function open_Event_Category() {
  popupWin = window.open('help.asp?ID=Event_Category', 'remote', 'width=300,height=200')
}
function open_Event_Location() {
  popupWin = window.open('help.asp?ID=Event_Location', 'remote', 'width=300,height=200')
}
function open_Event_Description() {
  popupWin = window.open('help.asp?ID=Event_Description', 'remote', 'width=300,height=200')
}

function VerifyData() {
	if (document.frmUser.Event_Name.value == "") {
		alert("请输入日程标题.");
		return false;
			} else if (
				(document.frmUser.Time_Hour.value == "Blank") ||
				(document.frmUser.Time_Minute.value == "Blank") ||
				(document.frmUser.Time_AMPM.value == "Blank")) {
		alert("请你选择日程时间.");
		return false;
	} else if (document.frmUser.Category.value == "") {
		alert("请选择日程类型.");
		return false;

	} else
		return true;
}
</script>
<!--#include file="style.asp"-->
<link rel="stylesheet" href="css/css1.css" type="text/css">
</head>
<body bgcolor="#FFFFFF" vlink="#48576C" link="#48576C" alink="#000000">
<%
dim RSFORM
Set RSFORM = Server.CreateObject("ADODB.Recordset")
RSFORM.Open "schedule_events", Conn, 2, 2

RSFORM.Find "ID='" & request("ID") & "'"
%>
<form action="scheduleeditsave.asp" name="frmUser" method="Post" onSubmit="return VerifyData()">
  当前位置&gt;日程安排&gt;详细内容 <br>
  <br>
  <table border="1" cellpadding="0" cellspacing="1" style="border-collapse: collapse" bordercolor="#C0C0C0"  id="AutoNumber3" height="20" width="429">
    <tr> 
      <td bgcolor="#E6EEFF" height="24" width="20%"> 
        <div align="center">日程标题</div>
      </td>
      <td bgcolor="#FFFFFF" height="24"> 　 <%=RSFORM("Event_Name")%> </td>
    </tr>
    <tr> 
      <td bgcolor="#E6EEFF" height="24" width="20%"> 
        <div align="center">日程日期</div>
      </td>
      <td bgcolor="#FFFFFF" height="24"> 　 <%=year(RSFORM("date"))%>年<%=month(RSFORM("date"))%>月<%=day(RSFORM("date"))%>日</td>
    </tr>
    <tr> 
      <td bgcolor="#E6EEFF" height="24" width="20%"> 
        <div align="center">日程时间</div>
      </td>
      <td bgcolor="#FFFFFF" height="24"> 　 <%=hour(RSFORM("date"))%> 点 <%=CInt(Minute(RSFORM("Date")))%> 
        分 
        <%If (AMPMSelected <= 11) Then%>
        0 秒 AM 
        <%End If%>
        <%If (AMPMSelected >= 12) Then%>
        PM 
        <%End If%>
    </tr>
    <tr> 
      <td bgcolor="#E6EEFF" height="24" width="20%"> 
        <div align="center">日程分类</div>
      </td>
      <td bgcolor="#FFFFFF" height="24"> 　 <%=RSFORM("Category")%> </td>
    </tr>
    <tr> 
      <td bgcolor="#E6EEFF" height="18" width="20%"> 
        <div align="center">日程地点</div>
      </td>
      <td bgcolor="#FFFFFF" height="24"> 　 <%=RSFORM("Location")%> </td>
    </tr>
    <tr> 
      <td bgcolor="#E6EEFF" width="20%"> 
        <div align="center">具体情况</div>
      </td>
      <td bgcolor="#FFFFFF" align="center"> 　 
        <table width="90%" border="0">
          <tr>
            <td><%=RSFORM("Description")%></td>
          </tr>
        </table>
        <div align="center"></div>
      </td>
    </tr>
  </table>
  <div align="center"></div>
</form>
<%
RSFORM.close
set RSFORM = nothing
%>
</body>
</html>
