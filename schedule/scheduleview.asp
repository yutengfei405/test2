<!--#include file="conn.asp"-->

<html>
<head>
<title>�ճ̰�����ϸ����</title>

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
		alert("�������ճ̱���.");
		return false;
			} else if (
				(document.frmUser.Time_Hour.value == "Blank") ||
				(document.frmUser.Time_Minute.value == "Blank") ||
				(document.frmUser.Time_AMPM.value == "Blank")) {
		alert("����ѡ���ճ�ʱ��.");
		return false;
	} else if (document.frmUser.Category.value == "") {
		alert("��ѡ���ճ�����.");
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
  ��ǰλ��&gt;�ճ̰���&gt;��ϸ���� <br>
  <br>
  <table border="1" cellpadding="0" cellspacing="1" style="border-collapse: collapse" bordercolor="#C0C0C0"  id="AutoNumber3" height="20" width="429">
    <tr> 
      <td bgcolor="#E6EEFF" height="24" width="20%"> 
        <div align="center">�ճ̱���</div>
      </td>
      <td bgcolor="#FFFFFF" height="24"> �� <%=RSFORM("Event_Name")%> </td>
    </tr>
    <tr> 
      <td bgcolor="#E6EEFF" height="24" width="20%"> 
        <div align="center">�ճ�����</div>
      </td>
      <td bgcolor="#FFFFFF" height="24"> �� <%=year(RSFORM("date"))%>��<%=month(RSFORM("date"))%>��<%=day(RSFORM("date"))%>��</td>
    </tr>
    <tr> 
      <td bgcolor="#E6EEFF" height="24" width="20%"> 
        <div align="center">�ճ�ʱ��</div>
      </td>
      <td bgcolor="#FFFFFF" height="24"> �� <%=hour(RSFORM("date"))%> �� <%=CInt(Minute(RSFORM("Date")))%> 
        �� 
        <%If (AMPMSelected <= 11) Then%>
        0 �� AM 
        <%End If%>
        <%If (AMPMSelected >= 12) Then%>
        PM 
        <%End If%>
    </tr>
    <tr> 
      <td bgcolor="#E6EEFF" height="24" width="20%"> 
        <div align="center">�ճ̷���</div>
      </td>
      <td bgcolor="#FFFFFF" height="24"> �� <%=RSFORM("Category")%> </td>
    </tr>
    <tr> 
      <td bgcolor="#E6EEFF" height="18" width="20%"> 
        <div align="center">�ճ̵ص�</div>
      </td>
      <td bgcolor="#FFFFFF" height="24"> �� <%=RSFORM("Location")%> </td>
    </tr>
    <tr> 
      <td bgcolor="#E6EEFF" width="20%"> 
        <div align="center">�������</div>
      </td>
      <td bgcolor="#FFFFFF" align="center"> �� 
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
