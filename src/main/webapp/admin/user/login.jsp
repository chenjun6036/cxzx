<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String userId = request.getParameter("username") != null ? request.getParameter("username").trim() : "";
	String password = request.getParameter("password") != null ? request.getParameter("password").trim() : "";
%>
<script type="text/javascript" charset="utf-8">
	var loginDialog;
	var loginInputForm;
	var sessionInfo;
	$(function() {

		var formParam = {
			url : sy.bp() + '/admin/userAction!login.action',
			success : function(data) {
				var d = $.parseJSON(data);
				if (d.success) {
					loginDialog.dialog('close');

					$('#sessionInfoDiv').html(sy.fs('[<strong>{0}</strong>]，欢迎你！您使用[<strong>{1}</strong>]IP登录！', d.obj.loginName, d.obj.ip));

					flashOnlineDatagrid();
				}
				$.messager.show({
					msg : d.msg,
					title : '提示'
				});
			}
		};

		loginInputForm = $('#loginInputForm').form(formParam);
		
		// 这步是用于自动提交的
		if ($('input[name=userId]').val() != "" && $('input[name=password]').val() != "") {
			loginInputForm.form('submit', formParam);
		}

		loginDialog = $('#loginDialog').show().dialog({
			closable : false,
			title : '登录',
			modal : true,
			buttons : [ {
				text : '登录',
				handler : function() {
					loginInputForm.submit();
				}
			} ],
			onOpen : function() {
				var t = $(this);
				window.setTimeout(function() {
					t.find('input[name=userId]').focus();
				}, 0);
			}
		});

		$('form input').bind('keyup', function(event) {/* 增加回车提交功能 */
			if (event.keyCode == '13') {
				$(this).submit();
			}
		});

		sessionInfo = {
			userId : '${sessionInfo.userId}',
			loginName : '${sessionInfo.loginName}',
			ip : '${sessionInfo.ip}'
		};
		
		if (sessionInfo.userId) {/*如果有userId说明已经登陆过了*/
			window.setTimeout(function() {
				$('div.validatebox-tip').remove();
			}, 500);
			loginDialog.dialog('close');
			//flashOnlineDatagrid();
		}

	});

	function flashOnlineDatagrid() {/*刷新在线列表*/
		window.setTimeout(function() {
			if ($('#onlineDatagrid').length > 0) {
				onlineDatagrid.datagrid({
					pagination : true,
					url : sy.bp() + '/admin/onlineAction!doNotNeedSession_onlineDatagrid.action'
				});
				var p = onlineDatagrid.datagrid('getPager');
				p.pagination({
					showPageList : false,
					showRefresh : false,
					beforePageText : '',
					afterPageText : '/{pages}',
					displayMsg : ''
				});
			}
		}, 3000);
	}
</script>
<div id="loginDialog" style="width:250px;height:210px;display: none;overflow: hidden;">
	<div id="loginTabs" data-options="fit:true,border:false">
		<div title="输入方式" style="overflow: hidden;">
			<div class="info">
				<div class="tip icon-tip"></div>
				<div>请输入用户名和密码</div>
			</div>
			<div align="center">
				<form id="loginInputForm" method="post">
					<table>
						<tr>
							<th style="text-align: right;">登录名</th>
							<td><input value="<%= userId %>" name="userName" class="easyui-validatebox" data-options="required:true,missingMessage:'请填写登录名称'" value="admin" /></td>
						</tr>
						<tr>
							<th style="text-align: right;">密码</th>
							<td><input value="<%= password %>" name="password" type="password" class="easyui-validatebox" data-options="required:true,missingMessage:'请填写登录密码'" value="admin"  /></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</div>