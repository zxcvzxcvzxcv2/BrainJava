<%@ page contentType="text/html;charset=euc-kr" %>
<HTML>
   <HEAD>
      <TITLE> �ű�ȸ�� ����ȭ��</TITLE>
   </HEAD>
<script language="JavaScript">
	var msg;
	function form_check()	
	{
		
		var form = document.form_name;
		msg = "== ���Խ� ���� ���� ==\n\n";
		
		if(form.name.value=="")
			msg += "ȸ�� ������ �Է��ϼ���.\n\n";
		
		if(form.uid.value=="")
			msg += "ȸ��ID�� �Է��ϼ���.\n\n";
		
		else if(form.uid.value.length < 5)
			msg += "ȸ��ID�� 5�� �̻� �Է��ϼž� �մϴ�.\n\n";
		
		else if(!a_or_d(form.uid.value))
			msg += "ȸ��ID�� �����̳� ���ڷ� �Է��ϼž� �մϴ�.\n\n";
		
		if(form.pwd.value=="")
			msg += "��й�ȣ�� �Է��ϼ���.\n\n";
		 
		else if(form.pwd.value.length < 5)
			msg += "��й�ȣ�� 4�� �̻� �Է��ϼž� �մϴ�.\n\n";
		
		else if(!a_or_d(form.pwd.value))
			msg += "��й�ȣ�� �����̳� ���ڷ� �Է��ϼž� �մϴ�.\n\n";
		
		if(form.pwd.value != form.repwd.value)
			msg += "��й�ȣ�� ��й�ȣȮ���� ���� ���� ���� �ʽ��ϴ�.\n\n";
		
		if(form.ssn1.value == "")
			msg += "�ֹε�Ϲ�ȣ�� �Է��ϼ���.\n\n";
	
		if(msg == "== ���Խ� ���� ���� ==\n\n") { 
			form.submit();
		} else {
			alert(msg);
			return;
		}
	}

	// ���ڿ� ���� �Է� üũ
	function a_or_d(str) {
		lower_str = str.toLowerCase();
		for(i=0; i<lower_str.length; i++) {
			ch = lower_str.charAt(i);
			if(((ch < 'a') || (ch > 'z')) && ((ch < '0') ||(ch > '9')))
				return 0;
		}
		return 1;
	}

	// ID ���� üũ
	function openuid_check() {
		 if (document.form_name.uid.value == "") {
			 alert("���̵� �Է��ϼ���");
			return;
		 }
		 url = "id_check.jsp?uid=" + 
		document.form_name.uid.value ;
		open(url, "id_repeat_check", "width=300, height=220");
	}
</script>
     
<BODY bgcolor="#EEEEE0">
	<br>
	<table border=1 width=550 height=30 bordercolor=black>
		<tr>
			<td align=center bgcolor=0063ce><font size=3 color=#FFFFFF><b>ȸ �� �� ��</b></td>
		</tr>
	</table>
	<br>
	<form name=form_name method=post action="insert.jsp">
	<table border=1 cellpadding=3 cellspacing=0 width=550 valign=top align=center>
		<tr>
			<td width=90 bgcolor=#ccffff> ȸ�� ����<font color=red> *</font></td>
			<td width=340 bgcolor=white>
				<input type=text name=name size=20 maxlength=20 value="">&nbsp������ ��ĭ���� �Է��ϼ���.
			</td>
		</tr>
		<tr>
			<td bgcolor=#ccffff> �ֹε�Ϲ�ȣ<font color=red> *</font></td>
			<td bgcolor=white>
				<input type=text name=ssn1 size=6 maxlength=6 value=""> - 
				<input type=text name=ssn2 size=7 maxlength=7 value="">
			</td>
		</tr>
		<tr>
			<td bgcolor=#ccffff> ȸ�� id<font color=red> *</font></td>
			<td bgcolor=white align=absmiddle>
				<input type=text name=uid size=10 maxlength=16 >
				<input type="button" name="id_chk" value="ID�ߺ� üũ" OnClick="openuid_check(document.form_name.uid.value)">
        &nbsp;	5�� �̻��� �����̳� ���ڷ� �Է��ϼ���.</td>
		</tr>
		<tr>
			<td bgcolor=#ccffff> ��й�ȣ<font color=red> *</font></td>
			<td bgcolor=white>
				<input type=password name=pwd size=8 maxlength=12">
				&nbsp;5�� �̻��� �����̳� ���ڷ� �Է��ϼ���.
			</td>
		</tr>
		<tr>
			<td bgcolor=#ccffff> ��й�ȣȮ��<font color=red> *</font></td>
			<td bgcolor=white><input type=password name=repwd size=8 maxlength=12 value="" style="width:80">&nbsp�ٽ� �ѹ� �Է��� �ּ���. </td>
		</tr>
		<tr>
			<td bgcolor=#ccffff> �����ȣ</td>
			<td bgcolor=white>
				<table cellspacing=0 cellpadding=0>
					<tr>
						<td><input type=text name=zip1 size=3 maxlength=3 > -
                  			<input type=text name=zip2 size=3 maxlength=3>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td bgcolor=#ccffff> �ּ�</td>
			<td bgcolor=white><input type=text name=addr size=50 maxlength=60 value=""></td>
		</tr>
		<tr>
			<td bgcolor=#ccffff> ��ȭ��ȣ</td>
			<td bgcolor=white>
				<input type=text name=tel1 size=4 maxlength=4 value=""> - 
				<input type=text name=tel2 size=4 maxlength=4 value=""> -
				<input type=text name=tel3 size=4 maxlength=4 value="">
			</td>
		</tr>
		<tr>
			<td bgcolor=#ccffff> e-mail</td>
			<td bgcolor=white valign=middle>
				<input type=text name=email size=30 maxlength=30 value=""></td>
		</tr>
		<tr>
			<td bgcolor=#ccffff> ����</td>
			<td bgcolor=white>
				<select name=job class="formbox">
 					<option value="0">�����ϼ��� ---
	 				<option value="�л�">�л�
 					<option value="����">����
 					<option value="ȸ���">ȸ���
 					<option value="������">������
 					<option value="�Ƿ���">�Ƿ���
	 				<option value="������">������
 					<option value="�ֺ�">�ֺ�
 					<option value="��Ÿ">��Ÿ
				</select>
			</td>                
		</tr>
		<tr bgcolor=#00FF00>
			<td colspan=3 align=left><font color=red> * </font><font color=black>ǥ���׸��� �ݵ�� �Է��Ͻʽÿ�.</font>&nbsp;&nbsp;
				<input type="button" name="formcheck" value="��   ��" OnClick="form_check()">
				<input type="reset" value="��  ��">
			</td>
		</tr>
	</table>
	</form>
	</center>
</BODY>
</HTML>