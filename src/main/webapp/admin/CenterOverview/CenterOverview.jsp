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
			url : sy.bp() + '/admin/multiPurposeAction!setUnique.action',
			// form表单提交之后，后台给前台的数据
			success : function(data) {
				var obj = jQuery.parseJSON(data);
				if(!obj.success) {
					// 这是为了解决IE无法获取焦点的解决方案
					window.setTimeout(function() {
						$('.saveForm input[name=content]').focus();
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
			$('.saveForm input[name=content]').focus();
		}, 0); // 延迟0ms后就执行方法
	});
</script>
</head>
<body class="easyui-layout" data-options="fit:true">
	<!-- 中间面板，用于显示数据 -->
	<div data-options="region:'center', border:false" style="overflow: hidden;">
		<form class="saveForm" method="POST">
			<!-- 隐藏域表明新闻类型 -->
			<input type="hidden" value="${request.type}" name="type"/>
			<table class="tableForm" style="width: 100%;height: 100%;">
				<tr>
					<s:if test="#request.type==11">
					<th>中心概况</th>
					<input type="hidden" value="中心概况" name="title"/>
					</s:if>
					<s:elseif test="#request.type==12">
					<th>理事会</th>
					<input type="hidden" value="理事会" name="title"/>
					</s:elseif>
					<s:elseif test="#request.type==13">
					<th>学术委员会</th>
					<input type="hidden" value="学术委员会" name="title"/>
					</s:elseif>
					<s:elseif test="#request.type==14">
					<th>中心行政管理机构</th>
					<input type="hidden" value="中心行政管理机构" name="title"/>
					</s:elseif>
					<s:elseif test="#request.type==15">
					<th>研究部</th>
					<input type="hidden" value="研究部" name="title"/>
					</s:elseif>
					<s:elseif test="#request.type==16">
					<th>微纳米材料分析测试中心</th>
					<input type="hidden" value="微纳米材料分析测试中心" name="title"/>
					</s:elseif>
					<s:elseif test="#request.type==21">
					<th>微纳米金属结构材料研究部</th>
					<input type="hidden" value="微纳米金属结构材料研究部" name="title"/>
					</s:elseif>
					<s:elseif test="#request.type==22">
					<th>纳米功能材料研究部</th>
					<input type="hidden" value="纳米功能材料研究部" name="title"/>
					</s:elseif>
					<s:elseif test="#request.type==23">
					<th>微纳米材料加工装备研究部</th>
					<input type="hidden" value="微纳米材料加工装备研究部" name="title"/>
					</s:elseif>
					<td colspan="3"><textarea name="content"  cols="100" rows="8" style="width:970px;height:600px;visibility:hidden;"><%-- <%=htmlspecialchars(htmlData)%> --%>${content}</textarea> <!-- name="button"可以实现快捷键提交  --> <input id="submitButton" type="submit" value="提交内容" name="button" style="width: 100px;" /> (提交快捷键: Ctrl + Enter)</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>