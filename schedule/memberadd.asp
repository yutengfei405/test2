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
      <td align=right><a href="main.asp"><font color="#000000">������ҳ</font></a></td>
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
  <table cellspacing=1 cellpadding=0 width="100%" border=0>
    <tbody> 
    <tr> 
      <td valign=top bgcolor=#ffffff>
        <table border="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber2" height="25">
          <tr> 
            <td width="100%">��ǰλ�ã��ճ̰��� &gt; ��Աע��</td>
          </tr>
        </table>
        <form action="memberaddsave.asp" name="form" Method="Post" onSubmit="return VerifyData()">
          <div align="center"> 
            <table height=60% bordercolordark=#006633 width=100% 
align=center bordercolorlight=#ccffcc border=0>
              <tbody> 
              <tr> 
                <td height=140 bgcolor="#FFFFFF" valign="top"> 
                  <div align=center> 
                    <table border="1" cellpadding="0" cellspacing="1" style="border-collapse: collapse" bordercolor="#C0C0C0" width="100%" id="AutoNumber1">
                      <tr> 
                        <td class=lemon1 valign=center align=left width="32%" height="22" bgcolor="#CEE7FF"><b> 
                          </b> 
                          <div align="left"><b>���û��ʺ�:</b></div>
                        </td>
                        <td class=lemon1 height="22" width="68%"> �� 
                          <input name="ename" onBlur="this.className='inputnormal'" onFocus="this.className='inputedit';this.select()" class="inputnormal"��>
                          <font color="#ffffff" size="2"><font color="#FF0000">*</font></font> 
                        </td>
                      </tr>
                      <tbody> 
                      <tr> 
                        <td class=lemon1 valign=center align=left width="32%" height="19" bgcolor="#CEE7FF"><b> 
                          </b> 
                          <div align="left"><b>����������:</b></div>
                        </td>
                        <td class=lemon1 height="19" width="68%"> �� 
                          <input type="pwd" name=pwd onBlur="this.className='inputnormal'" onFocus="this.className='inputedit';this.select()" class="inputnormal">
                          <font color="#ffffff" size="2"><font color="#FF0000">*</font></font> 
                        </td>
                      </tr>
                      </tbody> 
                    </table>
                    <div align=center><br>
                      <p> 
                        <input  type="submit" value=" �� ��  "
name="cmdok" class="s02"  >
                        &nbsp; 
                        <input type="reset" name="ok" value=" ȡ ��  " onClick="javascript:history.go(-1)" class="s02">
                        <br>
                        <br>
                      </p>
                    </div>
                  </div>
                </td>
              </tr>
              </tbody> 
            </table>
          </div>
        </form>
        <p>&nbsp;</p>
      </td>
    </tr>
    </tbody> 
  </table>
</div>
