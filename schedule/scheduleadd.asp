<!--#include file="conn.asp"-->

<html>
<head>
<title>Ocean12 ASP Calendar Manager</title>
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
<body vlink="#48576C" link="#48576C" alink="#000000" bgcolor="#FFFFFF" topmargin="3">
<table width=100% border=0 cellspacing=0 cellpadding=0>
  <tr> 
    <td height=22 class=a><font face="Arial"><b><font size="3">欢迎<font color="#FF6600"><%=session("ename")%></font>登录日程安排系统</font></b></font></td>
    <td align=right><a href="main.asp"><font color="#000000">返回首页</font></a></td>
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
<br>
当前位置：日程安排 &gt; 添加日程<br>
<br>
<table border="0" cellspacing="0" width="100%">
  <tr> 
    <td width="100%"> <font  size="1"> 
      <form action="scheduleaddsave.asp" name="frmUser" method="Post" onSubmit="return VerifyData()">
        <table border="1" cellpadding="0" cellspacing="1" style="border-collapse: collapse" bordercolor="#C0C0C0" width="100%" id="AutoNumber1" height="20">
          <tr> 
            <td bgcolor="#E6EEFF" width="88" height="24"><font color="#000000">　日程标题</font></td>
            <td bgcolor="#FFFFFF" width="534" height="24"> 　 
              <input type="text" name="Event_Name" onBlur="this.className='inputnormal'" onFocus="this.className='inputedit';this.select()" class="inputnormal" size="30" maxlength="255">
            </td>
          </tr>
          <tr> 
            <td bgcolor="#E6EEFF" width="88" height="24"><font color="#000000">　日程日期</font></td>
            <td bgcolor="#FFFFFF" width="534" height="24"> 　 
              <%date1=request("date1")%>
              <%=year(date1)%>年<%=month(date1)%>月<%=day(date1)%>日 
              <input type="hidden" name="date" value="<%=date1%>">
            </td>
          </tr>
          <tr> 
            <td bgcolor="#E6EEFF" width="88" height="24"><font color="#000000">　日程时间</font></td>
            <td bgcolor="#FFFFFF" width="534" height="24"> 　 
              <select name="Time_Hour" class="stbtm">
                <option value="Blank" SELECTED>--选择小时--</option>
                <% 
hourCounter = 1
Do WHILE hourCounter <= 12 %>
                <option value="<%=hourCounter%>"><%=hourCounter%></option>
                <% hourCounter = hourCounter + 1
Loop
%>
              </select>
              　 
              <select name="Time_Minute" class="stbtm">
                <option value="Blank" SELECTED>--选择分钟--</option>
                <% 
minuteCounter = 0
Do WHILE minuteCounter <= 55%>
                <option value="<%=minuteCounter%>"> 
                <%If (minuteCounter < 10) Then%>
                0 
                <%End If%>
                <%=minuteCounter%></option>
                <% minuteCounter = minuteCounter + 5
Loop
%>
              </select>
              　 
              <select name="Time_AMPM" class="stbtm">
                <option value="Blank" SELECTED>--选择AM/PM--</option>
                <option value="AM">AM</option>
                <option value="PM">PM</option>
              </select>
            </td>
          </tr>
          <tr> 
            <td bgcolor="#E6EEFF" width="88" height="24"><font color="#000000">　日程分类</font></td>
            <td bgcolor="#FFFFFF" width="534" height="24"> 　 
              <select name="Category" class="stedit">
                <option value="" SELECTED>--选择分类--</option>
                <%
Set RSCATEGORY = Server.CreateObject("ADODB.Recordset")
RSCATEGORY.Open "schedule_Categories", Conn, 2, 2

Do While Not RSCATEGORY.eof
%>
                <option value="<%=RSCATEGORY("Category")%>"><%=RSCATEGORY("Category")%></option>
                <%
RSCATEGORY.movenext
Loop
RSCATEGORY.close
set RSCATEGORY = nothing
%>
              </select>
            </td>
          </tr>
          <tr> 
            <td bgcolor="#E6EEFF" width="88" height="24"><font color="#000000">　日程地点<br>
              </font></td>
            <td bgcolor="#FFFFFF" width="534" height="24"> 　 
              <input type="text" name="Location" onBlur="this.className='inputnormal'" onFocus="this.className='inputedit';this.select()" class="inputnormal" size="30" maxlength="255">
            </td>
          </tr>
          <tr> 
            <td bgcolor="#E6EEFF" width="88"><font color="#000000">　具体情况</font></td>
            <td bgcolor="#FFFFFF" width="534"> 　 
              <textarea name="Description" onBlur="this.className='inputnormal'" onFocus="this.className='inputedit';this.select()" class="inputnormal" cols="45" rows="5"></textarea>
            </td>
          </tr>
          <tr> 
            <td align="right" valign="bottom" width="88" bgcolor="#E6EEFF"><br>
            </td>
            <td valign="bottom" width="534" bgcolor="#FFFFFF"><br>
              　 
              <input type="submit" name="Submit" value=" 增加日程 " class="s02">
              　　 
              <input type="reset" name="Reset" value=" 取消 " class="s02">
              <br>
              <br>
            </td>
          </tr>
        </table>
      </form>
      </font></td>
  </tr>
</table>
</body>
</html>
