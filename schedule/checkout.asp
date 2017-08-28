<%
'！！！！！！！！！！！！！！登僅喘薩頁倦鞠遜！！！！！！！！！！！！！！
if session("ename")="" then
   session("path")=Request.ServerVariables("script_name")
   response.redirect "login.asp"
end if
%>