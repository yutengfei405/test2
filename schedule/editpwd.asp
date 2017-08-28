<!--#include file="conn.asp"-->
<%
if replace(request("newpwd")," ","")<>"" then
'response.write replace(request("newpwd")," ","")
'response.end
sql="select * from schedule_member where ename='"& session("ename")&"'"
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,3,2
  if rs("pwd")<>replace(request("oldpwd")," ","") then
    response.redirect "editpwd.asp?error=wrong"
  else
    rs("pwd")=replace(request("newpwd")," ","")
    rs.update
    response.redirect "editpwd.asp?error=ok"
  end if
end if
%>
<html>

<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title></title>
<base target="_self">
<script language="javascript">
function submitit()
{
var myform=document.editpwd;
  if (myform.oldpwd.value=="")
  {
    alert("原有密码不能为空！");
    return false;
  }
  else
  {
    if (myform.newpwd.value=="")
    {
      alert("新密码不能为空不能为空！");
      return false;
    }
    else
    {
      if (myform.confirmpwd.value=="")
      {
      alert("验证密码不能为空！");
      return false;
      }
      else
      {
        if (myform.newpwd.value!=myform.confirmpwd.value)
        {
          alert("新设密码和验证密码不相符！");
          return false;
        }
        else
        {
          return true;
        }
      }
    }
  }
}
</script>
<link rel="stylesheet" href="css/css.css" type="text/css">
</head>

<body topmargin="0" leftmargin="0"  bgcolor="#FDCD68">
<form method="POST" name="editpwd" action="editpwd.asp" onsubmit="return submitit();">
  <div align="center">
    <center>
      <table border="0" cellpadding="2" style="border-collapse: collapse" bordercolor="#111111" id="AutoNumber1" cellspacing="1" bgcolor="#FFFFFF" width="100%">
        <tr bgcolor="FFDB91" align="center"> 
          <%
if request("error")="" then
%>
          <td height="24"> 
            <div align="center"><font color="#D95700">建议密码最好在6位以上</font></div>
          </td>
          <%
else 
  if request("error")="ok" then
%>
          <td colspan="2" height="24"> 
            <div align="center"><font color="#D95700">成功修改密码！</font></div>
          </td>
          <%
  else
%>
          <td colspan="2" height="24"> 
            <div align="center"><font color="#D95700">旧密码输入错误！</font></div>
          </td>
          <%
  end if
end if
%>
        </tr>
        <tr> 
          <td bgcolor="FFDB91" align="center"> 
            <div align="center">原有密码： 
              <input type="password" name="oldpwd" size="8" onblur="this.className='stedit'" onFocus="this.className='stedit';this.select()" class="stedit">
            </div>
          </td>
        </tr>
        <tr> 
          <td bgcolor="FFDB91" align="center"> 
            <div align="center">新设密码： 
              <input type="password" name="newpwd" size="8" onblur="this.className='stedit'" onFocus="this.className='stedit';this.select()" class="stedit">
            </div>
          </td>
        </tr>
        <tr> 
          <td bgcolor="FFDB91" align="center"> 
            <div align="center">验证密码： 
              <input type="password" name="confirmpwd" size="8" onblur="this.className='stedit'" onFocus="this.className='stedit';this.select()" class="stedit">
             
            </div>
          </td>
        </tr>
        <tr> 
          <td bgcolor="FFDB91" height="25" align="center"> 
            <p align="center"> 
              <input border="0" value="保 存" name="I1" type="submit" class="stbtm">
          </td>
        </tr>
      </table>
      </center>
  </div>
</form>

</body>

</html>
