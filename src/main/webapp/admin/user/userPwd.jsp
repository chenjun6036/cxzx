<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../inc.jsp"></jsp:include>
<jsp:include page="../kindeditor_inc.jsp"></jsp:include>
<script type="text/javascript">
	function check(){
		$('#admin_user_addForm').form('submit',{
			url:sy.bp() + '/admin/userAction!rePwd.action',success : function(r) {
			var obj = jQuery.parseJSON(r);
			console.info(obj);
			if (obj.success) {	
				$.messager.show({
					title : '提示',
					msg : obj.msg
				});
			}
			
		}});
		
	}
</script>
<body>
<div id="admin_user_PWD_layout" class="easyui-layout" data-options="fit:true,border: false" style="overflow:hidden;">
		<div data-options="region:'center',fit:true,border: false">			
		<form id="admin_user_addForm" method="post">
			<table>
			<tr>
				<th>原密码</th>
				<td>
					<input name="repassword" type="password" class="easyui-validatebox" data-options="required:'true',missingMessage:'请填写登录密码', validType:'safepass'" />
				</td>
			</tr>
			<tr>
				<th>密码</th>
				<td>
					<input name="password" type="password" class="easyui-validatebox" data-options="required:'true',missingMessage:'请填写登录密码', validType:'safepass'" />
				</td>
			</tr>
			<tr>
				<th>重复密码</th>
				<td>
					<input type="password" class="easyui-validatebox" data-options="required:'true',missingMessage:'请再次填写密码',validType:'eqPassword[\'#admin_user_addForm input[name=password]\']'" />
				</td>
			</tr>
			<tr>
				<th></th>
				<td><input type="button" value="修改" onclick="check()" /></td>
			</tr>
		</table>
		</form>
</div>
		</div>
</body>
</html>