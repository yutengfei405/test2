<!--#include file="conn.asp"-->
<%

id=replace(request("id")," ","")
date1=request("date1")
delete="DELETE FROM schedule_events where id="&replace(id,","," or id=")
conn.Execute delete
Response.Redirect "main.asp?date1="&date1%>