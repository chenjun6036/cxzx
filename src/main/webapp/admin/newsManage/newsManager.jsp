<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../inc.jsp"></jsp:include>
<jsp:include page="../kindeditor_inc.jsp"></jsp:include>
<script type="text/javascript" charset="utf-8">
	var datagrid;
	$(function() {
		datagrid = $('#datagrid').datagrid({
			url : sy.bp() + '/admin/multiPurposeAction!getMultiList.action',
			title : '列表',
			iconCls : 'icon-save',
			pagination : true,
			pagePosition : 'bottom',
			pageSize : 10,
			pageList : [ 10, 20, 30, 40 ],
			fit : true,
			fitColumns : false,
			nowrap : false,
			border : false,
			idField : 'id',
			sortName : 'title',
			sortOrder : 'asc',
			checkOnSelect : false,
			selectOnCheck : true,
			frozenColumns : [ [ {
				title : '编号',
				field : 'id',
				width : 150,
				sortable : true,
				checkbox : true
			}, {
				title : '标题',
				field : 'title',
				width : 400,
				sortable : true
				
			} ] ],
			columns : [ [ {
				title : '创建时间',
				field : 'time',
				sortable : true,
				width : 200
			}] ],
			queryParams: {
				type: "${param.type}"
			},
			toolbar : [ {
				text : '删除',
				iconCls : 'icon-remove',
				handler : function() {
					remove();
				}
			}, '-', {
				text : '修改',
				iconCls : 'icon-edit',
				handler : function() {
					edit();
				}
			}, '-', {
				text : '取消选中',
				iconCls : 'icon-undo',
				handler : function() {
					// 跨页数据也支持
					datagrid.datagrid('clearSelections');
					datagrid.datagrid('clearChecked');
					// 下面只针对本页数据
					// datagrid.datagrid('uncheckAll');
					// datagrid.datagrid('unselectAll');
				}
			}, '-' ],
			onRowContextMenu : function(e, rowIndex, rowData) {
				// 阻止默认的右键事件，就是事件冒泡
				e.preventDefault();
				// $(this).datagrid('unselectAll');
				// 取消选中所有的（复选框）
				// $(this).datagrid('uncheckAll');
				// $(this).datagrid('selectRow', rowIndex);
				// 以复选框的形式选中当前行
				// $(this).datagrid('checkRow', rowIndex);
				$('#menu').menu('show', {
					left : e.pageX,
					top : e.pageY
				});
			},
			onClickRow : function(rowIndex, rowData) {
				var flag = true;
				var rows = datagrid.datagrid('getChecked');
				if (rows != undefined && rows != null && rows.length > 0) {
					for (var i = 0; i < rows.length; i++) {
						if (rows[i].id == rowData.id) {
							flag = false;
							break;
						}
					}
					if (flag == false) {
						datagrid.datagrid('unselectRow', rowIndex);
						datagrid.datagrid('uncheckRow', rowIndex);
					} else {
						datagrid.datagrid('selectRow', rowIndex);
						datagrid.datagrid('checkRow', rowIndex);
					}
				} else {
					datagrid.datagrid('checkRow', rowIndex);
				}
			}
		});
	});
	
	// 编辑新闻，不支持批量
	function edit() {
		var rows = datagrid.datagrid('getChecked');
		if (rows.length == 1) {
			parent.addTabs({
				id : 'nn1',
				text : '修改',
				checked : false,
				attributes : {
					// 这个不好加前缀信息
					url : '/admin/multiPurposeAction!MultiEditForward.action?id=' + rows[0].id
				}
			}, true);		
		} else if (rows.length > 1) {
			parent.sy.messagerAlert('提示', '同一时间只能编辑一条记录！', 'error');
		} else {
			parent.sy.messagerAlert('提示', '请选择要编辑的记录！', 'error');
		}
	}
	
	// 删除新闻，支持批量
	function remove() {
		var rows = datagrid.datagrid('getChecked');
		var ids = [];
		if (rows.length > 0) {
			parent.sy.messagerConfirm('请确认', '您要删除当前所选项目？', function(r) {
				if (r) {
					for ( var i = 0; i < rows.length; i++) {
						ids.push(rows[i].id);
					}
					$.ajax({
						url : sy.bp() + '/admin/multiPurposeAction!deleteMulti.action',
						data : {
							ids : ids.join(','),
							type : "${param.type}"
						},
						dataType : 'json',
						success : function(d) {
							datagrid.datagrid('load');
							datagrid.datagrid('unselectAll');
							parent.sy.messagerShow({
								title : '提示',
								msg : d.msg
							});
							/**
							 * 这步非常有必要
							 * 当成功完成删除时，需要清空已经被删除的选择
							 */
							datagrid.datagrid('clearSelections');
							datagrid.datagrid('clearChecked');
						}
					});
				}
			});
		} else {
			parent.sy.messagerAlert('提示', '请勾选要删除的记录！', 'error');
		}
	}
	
	function searchSth() {
		datagrid.datagrid('load', serializeObject($('#searchForm')));
	}
	function cleanSearch() {
		// load方法是可以携带参数的，这里为了增加重用性，没有写
		datagrid.datagrid('load', {
			type : "${param.type}"
		});
		$('#searchForm input').val('');
		// type的值必须永远存在
		$('#searchForm input[name=type]').val("${param.type}");
	}
</script>
</head>
<body class="easyui-layout" data-options="fit:true">
	<div data-options="region:'north',border:false,title:'过滤条件'" style="height: 110px;overflow: hidden;" align="left">
		<form id="searchForm">
			<!-- 隐藏域表明新闻类型 -->
			<input type="hidden" value="${param.type}" name="type"/>
			<table class="tableForm datagrid-toolbar" style="width: 100%;height: 100%;">
				<tr>
					<th>标题</th>
					<td><input name="title" style="width:317px;" /></td>
				</tr>
				<tr>
					<th>创建时间</th>
					<td>
						<input name="timeBegin" class="easyui-datetimebox" data-options="editable:false" style="width: 155px;" />至
						<input name="timeEnd" class="easyui-datetimebox" data-options="editable:false" style="width: 155px;" />
						<a href="javascript:void(0);" class="easyui-linkbutton" onclick="searchSth();">过滤</a>
						<a href="javascript:void(0);" class="easyui-linkbutton" onclick="cleanSearch();">取消</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div data-options="region:'center',border:false" style="overflow: hidden;">
		<table id="datagrid"></table>
	</div>

	<div id="menu" class="easyui-menu" style="width:120px;display: none;">
		<div onclick="remove();" data-options="iconCls:'icon-remove'">删除</div>
		<div onclick="edit();" data-options="iconCls:'icon-edit'">编辑</div>
	</div>
</body>
</html>