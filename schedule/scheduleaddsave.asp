
<!--#include file="conn.asp"-->

<%

date1=request("date")
Set RSEVENTS = Server.CreateObject("ADODB.Recordset")
RSEVENTS.Open "schedule_Events", Conn, 2, 2
RSEVENTS.addnew

RSEVENTS("Event_Name") = request("Event_Name")
RSEVENTS("Description") = request("Description")
RSEVENTS("Category") = request("Category")
RSEVENTS("ename")=session("ename")

eventDate = date1 + " " + request("Time_Hour") + ":" + request("Time_Minute") + ":00 " + request("Time_AMPM")
RSEVENTS("Date") = eventDate

If (request("Location") = "") Then
	RSEVENTS("Location") = Null
Else
	RSEVENTS("Location") = request("Location")
End If

RSEVENTS.update

RSEVENTS.close
set RSEVENTS = nothing


Response.Redirect "main.asp?date1="&date1
%>
