<%
'�����������������������������ж��û��Ƿ��½����������������������������
if session("ename")="" then
   session("path")=Request.ServerVariables("script_name")
   response.redirect "login.asp"
end if
%>