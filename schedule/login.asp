<html>

<head>
<script language="javascript">

function VerifyData() 
{
	if (document.form.ename.value == "") 
	{
		alert("请输入会员帐号！");
		return false;
}
				if (document.form.pwd.value == "") 
	{
		alert("请输入会员密码！");
		return false;
}
	
}
</script>
<title>会 员 登 录</title> <style type="text/css"> 
<!-- 
--> 
</style>
<link rel="stylesheet" href="css/css1.css" type="text/css">
</head>

<body topmargin="3">
<div align="center">
  <table width=100% border=0 cellspacing=0 cellpadding=0>
    <tr> 
      <td height=22 class=a><font face="Arial"><b><font size="3" color="#FF6600">您</font><font size="3">还没有登陆，请登陆!</font></b></font></td>
      <td align=right><a href="../main.asp"><font color="#000000">返回首页</font></a></td>
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
  <form action="check.asp" name="form" Method="Post" onSubmit="return VerifyData()">
    <br>
    <br>
    <br>
    <br>
    <br>
    <table cellspacing=0 cellpadding=0 width=65%>
      <tbody> 
      <tr> 
        <td> <fieldset 
            style="BORDER-RIGHT: #FFC59D 1px solid; BORDER-TOP: #FFC59D 1px solid; BORDER-LEFT: #FFC59D 1px solid; WIDTH: 90%; BORDER-BOTTOM: #FFC59D 1px solid" 
            align=center><legend><b> <font color="#EA5E00">我要登录</font> </b></legend> 
          <table cellspacing=1 cellpadding=3 width="90%" align=center 
border=0 bgcolor="#FFF1E6">
            <tbody> 
            <tr> 
              <td align=center 
                  height=126><legend></legend> 
                <table width="80%" border="0" cellpadding="5">
                  <%if request("ename")<>"" then%>
                  <tr align="center"> 
                    <td colspan="2"> <font color="#EA5E00"><b>用户名或密码有误，请重新登录！</b></font></td>
                  </tr>
                  <%end if %>
                  <tr> 
                    <td width="40%">　　　用户名：</td>
                    <td width="60%"> 
                      <input type="text" name="ename" size="15" onBlur="this.className='inputnormal'" onFocus="this.className='inputedit';this.select()" class="inputnormal">
                    </td>
                  </tr>
                  <tr> 
                    <td width="40%">　　　密　码：</td>
                    <td width="60%"> 
                      <input type="password" name="pwd" size="15" onBlur="this.className='inputnormal'" onFocus="this.className='inputedit';this.select()" class="inputnormal">
                    </td>
                  </tr>
                  <tr> 
                    <td colspan="2" height="40"> 
                      <div align="center"> 
                        <input type="submit" name="Submit" value=" 确认 " class="s02">
                        　 
                        <input type="reset" name="Submit2" value=" 取消 " class="s02">
                      </div>
                    </td>
                  </tr>
                </table>
                <div align="center"></div>
                <div align="center"></div>
              </td>
            </tr>
            </tbody> 
          </table>
          <br>
          </fieldset> </td>
      </tr>
      </tbody> 
    </table>
    <BR>
    <BR> <BR>
  </form><p>&nbsp;</p></div>
</body>
</html>
