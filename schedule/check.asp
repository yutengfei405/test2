<!--#include file="Conn.ASP" -->
<%
ename=replace(request("ename")," ","")
pwd=replace(request("pwd")," ","")

sql ="SELECT  * from schedule_member where ename='"&ename&"' and  "&"pwd='"&pwd&"'"
Set rs = Server.CreateObject("ADODB.Recordset") 
rs.Open sql,Conn,1,1

if not rs.EOF then
session("ename")=ename

if session("path")="" then
Response.Redirect "main.asp"
else
response.redirect session("path")
end if

else
Response.Redirect  "login.asp?ename="&ename
end if
%>
