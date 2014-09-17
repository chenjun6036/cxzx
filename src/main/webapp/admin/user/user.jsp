<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../inc.jsp"></jsp:include>
<jsp:include page="../kindeditor_inc.jsp"></jsp:include>
<script type="text/javascript">
		$(function() {
			$('#admin_user_user_datagrid')
					.datagrid(
							{
								url : sy.bp() + '/admin/userAction!datagrid.action',
								fit : true,
								fitColumns : true,
								sortName:'name',								
								border : false,
								pagination : true,
								idField : 'id',
								frozenColumns : [ [] ],
								pagePosition : 'top',
								checkOnSelect : true,
								selectOnCheck : true,
								columns : [ [
										{
											field : 'userId',
											title : '登录名',
											width : 150,
											checkbox : true
										},
										{
											field : 'realName',
											title : '真实姓名',
											width : 150,
											sortable : true
										},
										{
											field : 'password',
											title : '登录密码',
											width : 150,
											formatter : function(value, row,
													index) {
												return '<span title="'+value+'">'
														+ value + '</span>';
											}
										}, {
											field : 'telephone',
											title : '联系方式',
											width : 150,
											sortable : true
										} , {
											field : 'email',
											title : '邮箱',
											width : 150,
											sortable : true
										}] ],
								toolbar : [ {
									text : '增加',
									iconCls : 'icon-add',
									handler : function() {
										append();
									}
								}, '-', {
									text : '删除',
									iconCls : 'icon-no',
									handler : function() {
										remove();
									}
								}, '-', {
									text : '修改',
									iconCls : 'icon-remove',
									handler : function() {
										editFun();
									}
								} ]
							});
		});
		function append() {
			$('#admin_user_user_userAdd input').val('');
			$('#admin_user_user_userAdd').dialog('open');
		}
		function remove() {
			var rows = $('#admin_user_user_datagrid').datagrid('getChecked');
			var ids = [];
			if (rows.length > 0) {
				$.messager
						.confirm(
								'询问',
								'您确定要删除當前的項目？',
								function(r) {
									if (r) {
										for ( var i = 0; i < rows.length; i++) {
											ids.push(rows[i].id);
										}
										$
												.ajax({
													url : sy.bp() + '/admin/userAction!delete.action',
													data : {
														ids : ids.join(',')
													},
													dataType : 'json',
													success : function(r) {
														$(
																'#admin_user_user_datagrid')
																.datagrid(
																		'load');
														$(
																'#admin_user_user_datagrid')
																.datagrid(
																		'unselectAll');
														parent.sy
																.messagerShow({
																	title : '提示',
																	msg : r.msg
																});
													}
												});
									}
								});

			}
		}
		function editFun() {
			var rows = $('#admin_user_user_datagrid').datagrid('getChecked');
			if (rows.length == 1) {
				var d = $('<div/>')
						.dialog(
								{
									width : 500,
									height : 200,
									href : sy.bp() +'/admin/user/userEdit.jsp',
									modal : true,
									title : '編輯用戶',
									buttons : [ {
										text : '編輯',
										handler : function() {
											$('#admin_user_user_userEdit')
													.form(
															'submit',
															{
																url : sy.bp() + '/admin/userAction!edit.action',
																success : function(
																		r) {
																	var obj = $
																			.parseJSON(r);
																	if (obj.success) {
																		d
																				.dialog('close');
																		$(
																				'#admin_user_user_datagrid')
																				.datagrid(
																						'updateRow',
																						{
																							index : $(
																									'#admin_user_user_datagrid')
																									.datagrid(
																											'getRowIndex',
																											rows[0].id),
																							row : obj.obj
																						});
																	}
																	$(
																	'#admin_user_user_datagrid')
																	.datagrid(
																			'load');
																	$.messager
																			.show({
																				title : '提示',
																				msg : obj.msg
																			});
																}
															});
										}
									} ],
									onClose : function() {
										$(this).dialog('destroy');
									},
									onLoad : function() {
										$('#admin_user_user_userEdit').form('load',
												rows[0]);
									}
									
								});
			} else {
				$.messager.alert('提示', '请选择一条用户进行编辑');
			}
		}
	</script>
	<body>
	<div id="admin_user_user_layout" class="easyui-layout" data-options="fit:true,border: false" style="overflow:hidden;">
		<div data-options="region:'center',fit:true,border: false">
			<table id="admin_user_user_datagrid"></table>
		</div>
	</div>
	<div id="admin_user_user_userAdd" class="easyui-dialog"
		data-options="closed:true,modal:true,title:'添加用戶',buttons:[{
					text:'添加',
					iconCls:'icon-add',
					handler:function(){
						$('#admin_user_addForm').form('submit',{
							url:sy.bp() + '/admin/userAction!reg.action',success : function(r) {
							var obj = jQuery.parseJSON(r);
							console.info(obj);
							if (obj.success) {								
								$('admin_user_user_userAdd').dialog('close');
								$('admin_user_user_datagrid').datagrid('insertRow',{
									index: 0,
									row: obj.obj
								});
							}
							$.messager.show({
								title : '提示',
								msg : obj.msg
							});
						}});
						}
					}]"
		style="width:500px ;height: 500px">
		<form id="admin_user_addForm" method="post">
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
					<input name="password" type="password" class="easyui-validatebox" data-options="required:'true',missingMessage:'请填写登录密码', validType:'safepass'" />
				</td>
				<th>重复密码</th>
				<td>
					<input type="password" class="easyui-validatebox" data-options="required:'true',missingMessage:'请再次填写密码',validType:'eqPassword[\'#admin_user_addForm input[name=password]\']'" />
				</td>
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
</body>
</html>