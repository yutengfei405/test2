<!--#include file="dsn.asp"-->

<html>
<head>
<title>无标题文档</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body
<%

navmonth = request.querystring("month")
navyear = request.querystring("year")

If navmonth = "" Then
	navmonth = Month(Date)
End If

If navyear = "" Then
	navyear = Year(Date)
End If

firstday = Weekday(CDate(navmonth & "/" & 1 & "/" & navyear))


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

Weekday_Font = RSBODY("Weekday_Font")
Weekday_Font_Size = RSBODY("Weekday_Font_Size")
Weekday_Font_Color = RSBODY("Weekday_Font_Color")
Weekday_Background_Color = RSBODY("Weekday_Background_Color")
Date_Font = RSBODY("Date_Font")
Date_Font_Size = RSBODY("Date_Font_Size")
Date_Font_Color = RSBODY("Date_Font_Color")
Date_Background_Color = RSBODY("Date_Background_Color")
Event_Font = RSBODY("Event_Font")
Event_Font_Size = RSBODY("Event_Font_Size")
Event_Font_Color = RSBODY("Event_Font_Color")
Cell_Width = RSBODY("Cell_Width")
Cell_Height = RSBODY("Cell_Height")
Cell_Background_Color = RSBODY("Cell_Background_Color")
Border_Size = RSBODY("Border_Size")
Border_Color = RSBODY("Border_Color")
%>
<%=RSBODY("Header")%>


<table border="0" cellpadding="0" cellspacing="0" align="center">
<tr>
<td align="center">

<table border="0" cellpadding="0" cellspacing="0" align="center">
<tr>
<td bgcolor="<%=Border_Color%>">

<table border="0" cellpadding="2" cellspacing="<%=Border_Size%>">
<tr>
<td align="center" bgcolor="<%=Weekday_Background_Color%>"><font face="<%=Weekday_Font%>" size="<%=Weekday_Font_Size%>" color="<%=Weekday_Font_Color%>"><b><%If (RSBODY("Abbreviate_Months") = True) Then%><%=MonthName(Month(request("date")), true)%><%Else%><%=MonthName(Month(request("date")))%><%End If%>&nbsp;<%=Day(request("date"))%>,&nbsp;<%=Year(request("date"))%></b></font></td>
</tr>
<tr>
<td align="center" bgcolor="<%=Date_Background_Color%>">


<table border="0" cellpadding="0" cellspacing="2">
<%
eventEmpty = True

Set RSEVENT = Server.CreateObject("ADODB.RecordSet")
RSEVENT.Open "SELECT * FROM schedule_events ORDER BY Date", Conn, 1, 3
Do while NOT RSEVENT.EOF
rsdate = RSEVENT("Date")
If (Day(rsdate) = Day(request("date"))) AND (Month(rsdate) = CInt(Month(request("date")))) AND (Year(rsdate) = CInt(Year(request("date")))) Then
eventEmpty = False
%>

<tr>
                      <td colspan="3"><b><%=FormatDateTime(rsdate, vbLongTime)%></b>&nbsp;&nbsp;<%=RSEVENT("Event_Name")%></td>
</tr>

<%
If (NOT isNull(RSEVENT("Location"))) Then
%>
<tr>
<td><img src="../im/clear.gif" height="1" width="10"></td>
<td><font face="<%=Event_Font%>" size="<%=Event_Font_Size%>" color="<%=RSBODY("Link_Color")%>"><b>Location</b></font></td>
                      <td><%=RSEVENT("Location")%></td>
</tr>
<%End If%>

<tr>
<td><img src="../im/clear.gif" height="1" width="10"></td>
<td><font face="<%=Event_Font%>" size="<%=Event_Font_Size%>" color="<%=RSBODY("Link_Color")%>"><b>Description</b></font></td>
                      <td><%=RSEVENT("Description")%></td>
</tr>

<% End If
RSEVENT.movenext
Loop
RSEVENT.close
%>
</table>

                  <%
If (eventEmpty = True) Then%>
                  There are currently no schedule_events scheduled for this day.
                  <%End If%>
                </td>
</tr>
</table>

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


<%=RSBODY("Footer")%> 
</body>
</html>
