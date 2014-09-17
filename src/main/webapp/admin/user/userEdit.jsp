<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div style="padding: 5px;overflow: hidden;">
	<form id="admin_user_user_userEdit" method="POST">
		<input name="id" type="hidden" />
		<table class="tableForm">
			<tr>
				<th style="width: 55px;">登录名</th>
				<td>
					<input name="userName" class="easyui-validatebox" data-options="required:'true',missingMessage:'请填写登录名称', validType:'minLength[5]'" />
				</td>
				<th style="width: 55px;">真实姓名</th>
				<td>
					<input name="realName" />
				</td>
			</tr>
			<tr>
				<th>密码</th>
				<td>
					<input name="password" type="password" readonly="readonly" />
				</td>
				<td colspan="2" style="text-align: left; color: red;">无法修改</td>
			</tr>
			<tr>
				<th style="width: 55px;">联系方式</th>
				<td>
					<input name="telephone" class="easyui-validatebox" data-options="validType: 'mobile'" />
				</td>
				<th style="width: 55px;">邮箱</th>
				<td>
					<input name="email" class="easyui-validatebox" data-options="validType: 'email', invalidMessage: '邮箱格式不正确'" />
				</td>
			</tr>
		</table>
	</form>
</div>