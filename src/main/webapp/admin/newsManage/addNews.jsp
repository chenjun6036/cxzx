<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../inc.jsp"></jsp:include>
<jsp:include page="../kindeditor_inc.jsp"></jsp:include>
<script type="text/javascript" charset="utf-8">
	$(function() {
		$('.saveForm').form({
			url : sy.bp() + '/admin/multiPurposeAction!addMultiPurpose.action',
			// form表单提交之后，后台给前台的数据
			success : function(data) {
				var obj = jQuery.parseJSON(data);
				if(!obj.success) {
					// 这是为了解决IE无法获取焦点的解决方案
					window.setTimeout(function() {
						$('.saveForm input[name=title]').focus();
					}, 0); // 延迟0ms后就执行方法
				}
				parent.$.messager.show({
					title : '提示',
					msg : obj.msg
				});
			}
		});
		
		/* 这里不需要给submit绑定提交事件，否则会出现一次点击两次提交
		$("#submitButton").on("click", function() {
			$('.saveForm').submit();
		});
		*/
		
		// 清空选中的文件
		$("#clearfile").on("click", function() {
			$("#url1").val("");
		});
		
		KindEditor.ready(function(K) {
			/**
			 * 图片上传
			 */
			var editor = K.editor({
				uploadJson : sy.bp() + '/jslib/kindeditor-4.1.7/jsp/upload_json.jsp',
				fileManagerJson : sy.bp() + '/jslib/kindeditor-4.1.7/jsp/file_manager_json.jsp',
				allowFileManager : true
			});
			
			/**
			 * 增加封面图片
			 */
			K('#image1').click(function() {
				editor.loadPlugin('image', function() {
					editor.plugin.imageDialog({
						imageUrl : K('#url1').val(),
						clickFn : function(url, title, width, height, border, align) {
							K('#url1').val(url);
							editor.hideDialog();
						}
					});
				});
			});
			
			var editor1 = K.create('textarea[name="content"]', {
				// autoHeightMode : true,
				cssPath : sy.bp() + '/jslib/kindeditor-4.1.7/plugins/code/prettify.css',
				uploadJson : sy.bp() + '/jslib/kindeditor-4.1.7/jsp/upload_json.jsp',
				fileManagerJson : sy.bp() + '/jslib/kindeditor-4.1.7/jsp/file_manager_json.jsp',
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					// this.loadPlugin('autoheight');
					K.ctrl(document, 13, function() {
						self.sync();
						$('.saveForm').submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						$('.saveForm').submit();
					});
				}
			});
			prettyPrint();
		});
		
		window.setTimeout(function() {
			$('.saveForm input[name=title]').focus();
		}, 0); // 延迟0ms后就执行方法
	});
</script>
</head>
<body class="easyui-layout" data-options="fit:true">
	<!-- 中间面板，用于显示数据 -->
	<div data-options="region:'center', border:false" style="overflow: hidden;">
		<form class="saveForm" method="POST">
			<!-- 隐藏域表明新闻类型 -->
			<input type="hidden" value="${param.type}" name="type"/>
			<table class="tableForm" style="width: 100%;height: 100%;">
				<tr>
					<th>标题</th>
					<td><input name="title" class="easyui-validatebox" data-options="required:'true',missingMessage:'请填写标题'" style="width:317px;" />
					</td>					
				</tr>
				<!-- <tr>
					<th>封面图片</th>
					<td colspan="3">
						<input type="text" id="url1" name="url" value="" style="width: 200px;" readonly/> 
						<input type="button" id="image1" value="选择图片" style="width: 150px;" />
						<input style="width: 150px;" type="button" id="clearfile" value="清空选择" />
					</td>
				</tr> -->
				<tr>
					<th>内容</th>
					<td colspan="3"><textarea name="content" cols="100" rows="8" style="width:970px;height:400px;visibility:hidden;"></textarea> <!-- name="button"可以实现快捷键提交  --> <input id="submitButton" type="submit" value="提交内容" name="button" style="width: 100px;" /> (提交快捷键: Ctrl + Enter)</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
