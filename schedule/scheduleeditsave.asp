<!--#include file="conn.asp"-->

<%

date1=request("date")
Set RSschedule_events = Server.CreateObject("ADODB.Recordset")
RSschedule_events.Open "schedule_events", Conn, 2, 2
RSschedule_events.Find "ID='" & request("ID") & "'"

RSschedule_events("Event_Name") = request("Event_Name")
RSschedule_events("Description") = request("Description")
RSschedule_events("Category") = request("Category")

eventDate = date1 + " " + request("Time_Hour") + ":" + request("Time_Minute") + " " + request("Time_AMPM")
RSschedule_events("Date") = eventDate

If (request("Location") = "") Then
	RSschedule_events("Location") = Null
Else
	RSschedule_events("Location") = request("Location")
End If

RSschedule_events.update
RSschedule_events.close
set RSschedule_events = nothing
Response.Redirect "main.asp?date1="&date1
%>
