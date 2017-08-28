<!--#include file="checkout.asp"-->
<!--#include file="conn.asp"-->
<html>
<head>
<title>无标题文档</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="javascript">
function editit(id,date)
{ 
  page="scheduleview.asp?id="+id+"&date="+date
  window.open (page,'查看编辑题目','width=450,height=300')
}

function CheckAll(form)
{
for (var i=0;i<form.elements.length;i++)
  {
  var e = form.elements[i];
  if (e.name != 'chkall')
     e.checked = form.chkall.checked;
  }
}


function addit(myform)
{
  if (confirm("您要添加一条日程？"))
  {
    myform.action="scheduleadd.asp";
    myform.submit();
  }
}




function delit(myform)
{
  if (confirm("是否从日程库中删除所选项？"))
  {
    myform.action="scheduledel.asp";
    myform.submit();
  }
}

</script>
<link rel="stylesheet" href="css/css1.css" type="text/css">
</head>
<body topmargin="3">
<table width=100% border=0 cellspacing=0 cellpadding=0>
  <tr> 
    <td height=22 class=a><font face="Arial"><b><font size="3">欢迎<font color="#FF6600"><%=session("ename")%></font>登录日程安排系统</font></b></font></td>
    <td align=right><a href="main.asp" ><font color="#000000">返回首页</font></a></td>
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
<table width="100%" border="0">
  <tr>
    <td width="73%" align="right" valign="top"> 
      <table cellspacing=0 cellpadding=0 width="100%" align=right border=0 height="20">
        <tbody> 
        <tr> 
            
          <td align=middle width="100%" bgcolor="#95B8FF" height="20"> &nbsp; 
            <%
			
date1=request("date1")

if request("day")<>"" and request("month") and request("year")<>"" then
date1=request("month")&"/"&request("day")&"/"&request("year")
end if


if date1="" then
date1=month(now())&"/"&day(now())&"/"&year(now())
end if

%>
            <%=year(date1)%>年<%=month(date1)%>月<%=day(date1)%>日&nbsp; 日程安排 </td>
            
          <td bgcolor="#95B8FF"><img height=1 src="ShowDay.files/c.gif" width=50><br>
          </td>
          </tr>
          </tbody> 
        </table>
      <br><br>
        
          <form name="form2" method="post" action="">
        <input type="hidden" name="date1" value="<%=date1%>">
        <input type="checkbox" name="chkall" value="on" onClick="CheckAll(this.form)" style="font-size: 9pt; color: #000000">
        全部选择/取消 
        <input type="submit" value="删除所选项" name="I32" onClick="delit(this.form)" class="s02">
        <input type="submit" value="添加日程" name="I322" onClick="addit(this.form)" class="s02">
        <table border="0" cellpadding="0" cellspacing="0" align="center" width="100%">
          <tr> 
            <td align="center"> 
              <table width="100%" cellspacing="0" border="0">
                <tr> 
                  <td align="center"> 
                    <table border="1" cellpadding="0" cellspacing="1" style="border-collapse: collapse" bordercolor="#C0C0C0" width="100%" id="AutoNumber3" height="20">
                      <tr bgcolor="#CEE7FF"> 
                        <td width="5%" height="20">&nbsp;</td>
                        <td width="6%" height="20" align="center"> 
                          <div align="center">序号</div>
                        </td>
                        <td width="11%" height="20"> 
                          <div align="center">时间</div>
                        </td>
                        <td width="21%" height="20"> 
                          <div align="center">地点</div>
                        </td>
                        <td width="50%" height="20"> 
                          <div align="center"> 日程标题</div>
                        </td>
                        <td height="20" width="7%"> 
                          <div align="center">操作</div>
                        </td>
                      </tr>
                      <%
eventEmpty = True
Set RSEVENT = Server.CreateObject("ADODB.RecordSet")
RSEVENT.Open "SELECT * FROM schedule_events where ename="&"'"&session("ename")&"'"&" ORDER BY date desc", Conn, 1, 3
i=0
Do while NOT RSEVENT.EOF
rsdate = RSEVENT("Date") 
If (Day(rsdate) =day(date1) ) AND (Month(rsdate) =month(date1) ) AND (Year(rsdate) =year(date1) ) Then
eventEmpty = False
%>
                      <tr> 
                        <td width="5%" height="21" bgcolor="#F3F3F3"> 
                          <input type="checkbox" name="id" value="<%=rsevent("id")%>">
                        </td>
                        <td width="6%" height="21" bgcolor="#F3F3F3" align="center">&nbsp;<%=i%> 
                        </td>
                        <td width="11%" height="21" bgcolor="#F3F3F3"> 
                          <div align="center"><%=FormatDateTime(rsdate, vblongTime)%></div>
                        </td>
                        <td width="21%" height="21" bgcolor="#F3F3F3" align="center"> 
                          <%=RSEVENT("location")%> </td>
                        <td width="50%" height="21" bgcolor="#F3F3F3">&nbsp;
						  <a href="javascript:editit(<%=rsevent("id")%>,<%=date1%>)"> <%=RSEVENT("Event_Name")%></a>
						  </td>
                        <td height="21" bgcolor="#F3F3F3" align="center" width="7%"> 
                          <div align="center"><a href="scheduleedit.asp?id=<%=rsevent("id")%>&date=<%=date1%>"><img src="images/cl06.gif" border="0"></a></div>
                        </td>
                      </tr>
                      <% End If
RSEVENT.movenext
i=i+1
Loop
RSEVENT.close
%>
                    </table>
                    <%if eventEmpty = True then%>
                    今天没有日程安排. 
                    <%end if%>
                    <br>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr> 
            <td align="center">&nbsp;</td>
          </tr>
        </table>
      </form>
    </td>
    <td width="35%" align="left" valign="top"> 
      <table border="0" cellpadding="0" cellspacing="0" align="center" width="100%" >
        <tr> 
          <td> 
            <table border="0" cellpadding="0" cellspacing="0" align="center" bgcolor="#FFFFFF" width="100%" >
              <tr> 
                <td align="center" width="100%" > 
                  <%
navday=request("day")
navmonth = request("month")
navyear = request("year")

If navmonth = "" Then
	navmonth = Month(Date)
End If

If navyear = "" Then
	navyear = Year(Date)
End If

If navday = "" Then
	navday = day(Date)
End If



firstday = Weekday(CDate(navmonth & "/" & 1 & "/" & navyear))

'——————————————————判断本月为多少天————————————————————————

leapTestNumbers = navyear / 4
leapTest = (leapTestNumbers) - Round(leapTestNumbers)
If navmonth = 2 Then
	If leapTest <> 0 Then
		lastDate = 28
	Else
		lastDate = 29
	End If
ElseIf ((navmonth = 4) OR (navmonth = 6) OR (navmonth = 9) OR (navmonth = 11)) Then
	lastDate = 30
Else
	lastDate = 31
End If

'——————————————————判断上一页，下一页————————————————————————
lastMonth = navmonth - 1
lastYear = navyear
If lastMonth < 1 Then
	lastMonth = 12
	lastYear = lastYear - 1
End If

nextMonth = navmonth + 1
nextYear = navyear
If nextMonth >12 Then
	nextMonth = 1
	nextYear = nextYear + 1
End If


dateCounter = 1
weekCount = 1

DateEnd = lastDate
DateBegin = firstDate


%>
                  <table border="1" cellpadding="0" cellspacing="1" style="border-collapse: collapse"  id="AutoNumber3"  width="100%" height="160" bordercolor="#666666"  >
                    <tr align="left" valign="top" bgcolor="#95B8FF"> 
                      <td height="17" colspan="7" > 
                        <table border="0" cellspacing="0" width="100%" height="10">
                          <tr valign="middle"> 
                            <td align="center" width="21%" height="15"> 
                              <div align="right"><font face="verdana" size="2"><b> 
                                <a href="main.asp?month=<%=lastMonth%>&year=<%=lastYear%>&day=<%=dateCounter%>&date=<%=lastmonth&"/"&dateCounter&"/"&lastyear%>""> 
                                <img src="images/cl03.gif" border=0> </a></b></font></div>
                            </td>
                            <td align="center" width="58%" height="15"> 
                              <div align="center"> <%=navyear%>年 <%=navMonth%>月<font face="verdana" size="4"><b> 
                                &nbsp;</b></font></div>
                            </td>
                            <td align="left" width="21%" height="15"> 
                              <div align="left"><font face="verdana" size="2"><b> 
                                <a href="main.asp?month=<%=nextMonth%>&year=<%=nextYear%>&day=<%=dateCounter%>&date=<%=nextMonth&"/"&dateCounter&"/"&nextYear%>""> 
                                <img src="images/cl04.gif" border=0> </a></b></font></div>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr align="center" valign="middle" bgcolor="#FFFFFF"> 
                      <td height="24" > 
                        <div align="center"><font color="#000000"><b><font size="2"> 
                          日 </font></b></font></div>
                      </td>
                      <td height="24" > 
                        <div align="center"><font color="#000000"><b><font size="2"> 
                          一 </font></b></font></div>
                      </td>
                      <td height="24" > 
                        <div align="center"><font color="#000000"><b><font size="2"> 
                          二 </font></b></font></div>
                      </td>
                      <td height="24" > 
                        <div align="center"><font color="#000000"><b><font size="2"> 
                          三 </font></b></font></div>
                      </td>
                      <td height="24" > 
                        <div align="center"><font color="#000000"><b><font size="2"> 
                          四 </font></b></font></div>
                      </td>
                      <td height="24" > 
                        <div align="center"><font color="#000000"><b><font size="2"> 
                          五 </font></b></font></div>
                      </td>
                      <td height="24" > 
                        <div align="center"><font color="#000000"><b><font size="2"> 
                          六 </font></b></font></div>
                      </td>
                    </tr>
                    <tr> 
                      <% Do while weekCount <= 7
dateSelect = navmonth & "/" & dateCounter & "/" & navyear %>
                      <% If (weekCount < firstDay) OR (dateCounter > lastDate) Then %>
                      <td bgcolor="#FFFFFF"><img src="im/clear.gif" height="1" width="1"></td>
                      <% else %>
                      <td bgcolor="#FFFFFF" valign="middle" align="center"> <a href="main.asp?year=<%=navyear%>&month=<%=navmonth%>&day=<%=dateCounter%>&date1=<%=dateSelect%>" > 
                        <%if clng(navyear)=year(date) and clng(navmonth)=month(date) and datecounter=day(date) then%>
                        <font color="#CC0000"><%=dateCounter%></font> 
                        <%elseif dateCounter=clng(navday) then%>
                        <font color="#0000FF"><%=dateCounter%></font> 
                        <%else%>
                        <font color="#000000"><%=dateCounter%></font> 
                        <%end if%>
                        <%
Set RSEVENT = Server.CreateObject("ADODB.RecordSet")
RSEVENT.Open "SELECT * FROM schedule_events where ename="&"'"&session("ename")&"'", Conn, 1, 3

Do while NOT RSEVENT.EOF
rsdate = RSEVENT("Date")
RSEVENT.movenext
Loop
RSEVENT.close
%>
                        </a></td>
                      <% 
dateCounter = dateCounter + 1
end if

weekCount = weekCount + 1
Loop
weekCount = 1
%>
                    </tr>
                    <% Do while dateCounter <= lastDate %>
                    <tr> 
                      <% Do while weekCount <= 7
dateSelect = navmonth & "/" & dateCounter & "/" & navyear %>
                      <% If dateCounter > lastDate Then %>
                      <td bgcolor="#FFFFFF"><img src="im/clear.gif" height="1" width="1"></td>
                      <% else %>
                      <td bgcolor="#FFFFFF" valign="middle" align="center"><a href="main.asp?year=<%=navyear%>&month=<%=navmonth%>&day=<%=dateCounter%>&date1=<%=dateSelect%>" > 
                        <%if clng(navyear)=year(date) and clng(navmonth)=month(date) and datecounter=day(date) then%>
                        <font color="#CC0000"><%=dateCounter%></font> 
                        <%else%>
                        <%if dateCounter=clng(navday) then%>
                        <font color="#0000FF"><%=dateCounter%></font> 
                        <%else%>
                        <font color="#000000"><%=dateCounter%></font> 
                        <%end if%>
                        <%end if%>
                        <%
Set RSEVENT = Server.CreateObject("ADODB.RecordSet")
RSEVENT.Open "SELECT * FROM schedule_events where ename="&"'"&session("ename")&"'", Conn, 1, 3
Do while NOT RSEVENT.EOF
rsdate = RSEVENT("Date")
If (Day(rsdate) = dateCounter) AND (Month(rsdate) = CInt(navmonth)) AND (Year(rsdate) = CInt(navyear)) Then%>
                        <% End If
RSEVENT.movenext
Loop
RSEVENT.close
%>
                        </a></td>
                      <% 
dateCounter = dateCounter + 1
end if

weekCount = weekCount + 1
Loop
weekCount = 1
%>
                    </tr>
                    <% Loop %>
                  </table>
                  <form name="form1" method="get" action="main.asp">
                    <div align="center"><font color="#F70000">■</font>今天　<font color="#0000FF">■</font>当前日<font color="#FF6600">　<font color="#F29200">■</font><font color="#000000">节日重要日子</font></font><br>
                      <br>
                    </div>
                    <div align="left">
                      <select name="year" class="stedit">
                        <option value="2001">2001</option>
                        <option value="2002">2002</option>
                        <option value="2003">2003</option>
                        <option value="2004">2004</option>
                        <option value="2005">2005</option>
                        <option value="2006">2006</option>
                        <option value="2007">2007</option>
                        <option value="2008">2008</option>
                        <option value="2009">2009</option>
                        <option value="2010">2010</option>
                      </select>
                      年 
                      <select name="month" class="stedit">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                        <option value="11">11</option>
                        <option value="12">12</option>
                      </select>
                      月 
                      <%If navmonth = 2 Then
	If leapTest <> 0 Then
		%>
                      <select name="day" class="stedit">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                        <option value="11">11</option>
                        <option value="12">12</option>
                        <option value="13">13</option>
                        <option value="14">14</option>
                        <option value="15">15</option>
                        <option value="16">16</option>
                        <option value="17">17</option>
                        <option value="18">18</option>
                        <option value="19">19</option>
                        <option value="20">20</option>
                        <option value="21">21</option>
                        <option value="22">22</option>
                        <option value="23">23</option>
                        <option value="24">24</option>
                        <option value="25">25</option>
                        <option value="26">26</option>
                        <option value="27">27</option>
                        <option value="28">28</option>
                      </select>
                      <%
	Else
		%>
                      <select name="day" class="stedit">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                        <option value="11">11</option>
                        <option value="12">12</option>
                        <option value="13">13</option>
                        <option value="14">14</option>
                        <option value="15">15</option>
                        <option value="16">16</option>
                        <option value="17">17</option>
                        <option value="18">18</option>
                        <option value="19">19</option>
                        <option value="20">20</option>
                        <option value="21">21</option>
                        <option value="22">22</option>
                        <option value="23">23</option>
                        <option value="24">24</option>
                        <option value="25">25</option>
                        <option value="26">26</option>
                        <option value="27">27</option>
                        <option value="28">28</option>
                        <option value="29">29</option>
                      </select>
                      <%
	End If
ElseIf ((navmonth = 4) OR (navmonth = 6) OR (navmonth = 9) OR (navmonth = 11)) Then
	%>
                      <select name="day" class="stedit">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                        <option value="11">11</option>
                        <option value="12">12</option>
                        <option value="13">13</option>
                        <option value="14">14</option>
                        <option value="15">15</option>
                        <option value="16">16</option>
                        <option value="17">17</option>
                        <option value="18">18</option>
                        <option value="19">19</option>
                        <option value="20">20</option>
                        <option value="21">21</option>
                        <option value="22">22</option>
                        <option value="23">23</option>
                        <option value="24">24</option>
                        <option value="25">25</option>
                        <option value="26">26</option>
                        <option value="27">27</option>
                        <option value="28">28</option>
                        <option value="29">29</option>
                        <option value="30">30</option>
                      </select>
                      <%
Else
	%>
                      <select name="day" class="stedit">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                        <option value="11">11</option>
                        <option value="12">12</option>
                        <option value="13">13</option>
                        <option value="14">14</option>
                        <option value="15">15</option>
                        <option value="16">16</option>
                        <option value="17">17</option>
                        <option value="18">18</option>
                        <option value="19">19</option>
                        <option value="20">20</option>
                        <option value="21">21</option>
                        <option value="22">22</option>
                        <option value="23">23</option>
                        <option value="24">24</option>
                        <option value="25">25</option>
                        <option value="26">26</option>
                        <option value="27">27</option>
                        <option value="28">28</option>
                        <option value="29">29</option>
                        <option value="30">30</option>
                        <option value="31">31</option>
                      </select>
                      <%
End If%>
                      日 --&gt; 
                      <input type="submit" name="Submit" value="搜索" class="s02">
                    </div>
                  </form>
                  <br>
                  <br>
                  <br>
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <!-- Begin Ocean12 Technologies Copyright Notice -->
        <!-- THIS CODE MUST NOT BE CHANGED -->
        <tr> 
          <td align="center">&nbsp;</td>
        </tr>
        <!-- End Ocean12 Technologies Copyright Notice -->
      </table>
      <div align="right"></div>
    </td>
  </tr>
</table>
<br>
<br>
</body>
</html>