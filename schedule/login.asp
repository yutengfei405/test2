<html>

<head>
<script language="javascript">

function VerifyData() 
{
	if (document.form.ename.value == "") 
	{
		alert("�������Ա�ʺţ�");
		return false;
}
				if (document.form.pwd.value == "") 
	{
		alert("�������Ա���룡");
		return false;
}
	
}
</script>
<title>�� Ա �� ¼</title> <style type="text/css"> 
<!-- 
--> 
</style>
<link rel="stylesheet" href="css/css1.css" type="text/css">
</head>

<body topmargin="3">
<div align="center">
  <table width=100% border=0 cellspacing=0 cellpadding=0>
    <tr> 
      <td height=22 class=a><font face="Arial"><b><font size="3" color="#FF6600">��</font><font size="3">��û�е�½�����½!</font></b></font></td>
      <td align=right><a href="../main.asp"><font color="#000000">������ҳ</font></a></td>
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
            align=center><legend><b> <font color="#EA5E00">��Ҫ��¼</font> </b></legend> 
          <table cellspacing=1 cellpadding=3 width="90%" align=center 
border=0 bgcolor="#FFF1E6">
            <tbody> 
            <tr> 
              <td align=center 
                  height=126><legend></legend> 
                <table width="80%" border="0" cellpadding="5">
                  <%if request("ename")<>"" then%>
                  <tr align="center"> 
                    <td colspan="2"> <font color="#EA5E00"><b>�û������������������µ�¼��</b></font></td>
                  </tr>
                  <%end if %>
                  <tr> 
                    <td width="40%">�������û�����</td>
                    <td width="60%"> 
                      <input type="text" name="ename" size="15" onBlur="this.className='inputnormal'" onFocus="this.className='inputedit';this.select()" class="inputnormal">
                    </td>
                  </tr>
                  <tr> 
                    <td width="40%">�������ܡ��룺</td>
                    <td width="60%"> 
                      <input type="password" name="pwd" size="15" onBlur="this.className='inputnormal'" onFocus="this.className='inputedit';this.select()" class="inputnormal">
                    </td>
                  </tr>
                  <tr> 
                    <td colspan="2" height="40"> 
                      <div align="center"> 
                        <input type="submit" name="Submit" value=" ȷ�� " class="s02">
                        �� 
                        <input type="reset" name="Submit2" value=" ȡ�� " class="s02">
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
