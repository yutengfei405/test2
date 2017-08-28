<%
dim RSBODY
dim SQLBODY
Set RSBODY = Server.CreateObject("ADODB.Recordset")
SQLBODY = "SELECT * from schedule_schedule_Settings"
RSBODY.Open SQLBODY, Conn, 1, 3
%>