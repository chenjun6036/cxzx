/**
 * 包含easyui的扩展和常用的方法
 * 
 * @author 陈俊
 * 
 * @version 20131019
 */

var sy = $.extend({}, sy);/* 定义全局对象，类似于命名空间或包的作用 */

/**
 * 
 * 取消easyui默认开启的parser
 * 
 * 在页面加载之前，先开启一个进度条
 * 
 * 然后在页面所有easyui组件渲染完毕后，关闭进度条
 * 
 * @author 陈俊
 * 
 * @requires jQuery,EasyUI
 * 
 */
$.parser.auto = false;
$(function() {
    $.messager.progress({
        text : '页面加载中....',
        interval : 100
    });
    $.parser.parse(window.document);
    window.setTimeout(function() {
    	$.messager.progress('close');
        if (self != parent) {
            window.setTimeout(function() {
                    try {
                            parent.$.messager.progress('close');
                    } catch (e) {
                    }
            }, 500);
        }
    }, 1);
    $.parser.auto = true;
});
/**
 * 使panel和datagrid在加载时提示
 * 
 * @author 陈俊
 * 
 * @requires jQuery,EasyUI
 * 
 */
$.fn.panel.defaults.loadingMessage = '加载中....';
$.fn.datagrid.defaults.loadMsg = '加载中....';


/**
 * @author 陈俊
 * 
 * @requires jQuery,EasyUI
 * 
 * 扩展validatebox，添加验证两次密码功能
 */
$.extend($.fn.validatebox.defaults.rules, {
	eqPassword : {
        validator : function(value, param) {
                return value == $(param[0]).val(); // param[0] = '#index_regForm
                // input[name=pwd]' -->
                // $('#index_regForm
                // input[name=pwd]')
        },
        message : '密码不一致'
    },
	mobile: {
	    validator : function (value, param) {
	    	var tel = /(^[0-9]{3,4}\-[0-9]{7,8}$)|(^[0-9]{7,8}$)|(^\([0-9]{3,4}\)[0-9]{3,8}$)|(^0{0,1}13[0-9]{9}$)|(13\d{9}$)|(15[0135-9]\d{8}$)|(18[2679]\d{8}$)/;
	    	return tel.exec(value);
	    },
	    message: '电话号码格式不正确'
	},
    safepass: {
        validator: function (value, param) {
            return safePassword(value);
        },
        message: '密码由字母和数字组成，至少6位'
    },
    minLength: {   
        validator: function(value, param){   
            return value.length >= param[0];   
        },   
        message: '用户名长度至少{0}位'  
    },
    number: {
        validator: function (value, param) {
            return /^\d+$/.test(value);
        },
        message: '请输入数字'
    }
});

/**
 * 密码由字母和数字组成，至少6位 
 */
var safePassword = function (value) {
    return !(/^(([A-Z]*|[a-z]*|\d*|[-_\~!@#\$%\^&\*\.\(\)\[\]\{\}<>\?\\\/\'\"]*)|.{0,5})$|\s/.test(value));
};

/**
 * @author 陈俊
 * 
 * @requires jQuery,EasyUI
 * 
 * 解析树形扁平的树形结构，转换成EasyUI可以识别的tree的JSON结构
 * @param data
 * @param parent
 */
$.fn.tree.defaults.loadFilter = function(data, parent) {
        var opt = $(this).data().tree.options;
        var idFiled, textFiled, parentField;
        if (opt.parentField) {
                idFiled = opt.idFiled || 'id';
                textFiled = opt.textFiled || 'text';
                parentField = opt.parentField;
                var i, l, treeData = [], tmpMap = [];
                for (i = 0, l = data.length; i < l; i++) {
                        tmpMap[data[i][idFiled]] = data[i];
                }
                for (i = 0, l = data.length; i < l; i++) {
                        if (tmpMap[data[i][parentField]] && data[i][idFiled] != data[i][parentField]) {
                                if (!tmpMap[data[i][parentField]]['children'])
                                        tmpMap[data[i][parentField]]['children'] = [];
                                data[i]['text'] = data[i][textFiled];
                                tmpMap[data[i][parentField]]['children'].push(data[i]);
                        } else {
                                data[i]['text'] = data[i][textFiled];
                                treeData.push(data[i]);
                        }
                }
                return treeData;
        }
        return data;
};


/**
 * @author 陈俊
 * 
 * @requires jQuery,EasyUI
 * 
 * 防止panel/window/dialog组件超出浏览器边界
 * @param left
 * @param top
 */
var easyuiPanelOnMove = function(left, top) {
	var l = left;
    var t = top;
    if (l < 1) {
            l = 1;
    }
    if (t < 1) {
            t = 1;
    }
    var width = parseInt($(this).parent().css('width')) + 14;
    var height = parseInt($(this).parent().css('height')) + 14;
    var right = l + width;
    var buttom = t + height;
    var browserWidth = $(window).width();
    var browserHeight = $(window).height();
    if (right > browserWidth) {
            l = browserWidth - width;
    }
    if (buttom > browserHeight) {
            t = browserHeight - height;
    }
    $(this).parent().css({/* 修正面板位置 */
            left : l,
            top : t
    });
};
$.fn.dialog.defaults.onMove = easyuiPanelOnMove;
$.fn.window.defaults.onMove = easyuiPanelOnMove;
$.fn.panel.defaults.onMove = easyuiPanelOnMove;


/**
 * @author 陈俊
 * 
 * @requires jQuery
 * 
 * 将form表单元素的值序列化成对象
 * 
 * @returns object
 */
serializeObject = function(form) {
        var o = {};
        $.each(form.serializeArray(), function(index) {
                if (o[this['name']]) {
                        o[this['name']] = o[this['name']] + "," + this['value'];
                } else {
                        o[this['name']] = this['value'];
                }
        });
        return o;
};

/**
 * @author 陈俊
 * 
 * @requires jQuery,EasyUI
 * 
 * 扩展datagrid的editor
 * 
 * 增加带复选框的下拉树
 * 
 * 增加日期时间组件editor
 * 
 * 增加多选combobox组件
 */
$.extend($.fn.datagrid.defaults.editors, {
	combocheckboxtree : {
		init : function(container, options) {
			var editor = $('<input />').appendTo(container);
			options.multiple = true;
			editor.combotree(options);
			return editor;
		},
		destroy : function(target) {
			$(target).combotree('destroy');
		},
		getValue : function(target) {
			return $(target).combotree('getValues').join(',');
		},
		setValue : function(target, value) {
			$(target).combotree('setValues', sy.getList(value));
		},
		resize : function(target, width) {
			$(target).combotree('resize', width);
		}
	},
	datetimebox : {
		init : function(container, options) {
			var editor = $('<input />').appendTo(container);
			editor.datetimebox(options);
			return editor;
		},
		destroy : function(target) {
			$(target).datetimebox('destroy');
		},
		getValue : function(target) {
			return $(target).datetimebox('getValue');
		},
		setValue : function(target, value) {
			$(target).datetimebox('setValue', value);
		},
		resize : function(target, width) {
			$(target).datetimebox('resize', width);
		}
	},
	multiplecombobox : {
		init : function(container, options) {
			var editor = $('<input />').appendTo(container);
			options.multiple = true;
			editor.combobox(options);
			return editor;
		},
		destroy : function(target) {
			$(target).combobox('destroy');
		},
		getValue : function(target) {
			return $(target).combobox('getValues').join(',');
		},
		setValue : function(target, value) {
			$(target).combobox('setValues', sy.getList(value));
		},
		resize : function(target, width) {
			$(target).combobox('resize', width);
		}
	}
});

/**
 * @author 陈俊
 * 
 * 接收一个以逗号分割的字符串，返回List，list里每一项都是一个字符串
 * 
 * @returns list
 */
sy.getList = function(value) {
	if (value != undefined && value != '') {
		var values = [];
		var t = value.split(',');
		for ( var i = 0; i < t.length; i++) {
			values.push('' + t[i]);/* 避免他将ID当成数字 */
		}
		return values;
	} else {
		return [];
	}
};

/**
 * @author 陈俊
 * 
 * @requires jQuery,EasyUI
 * 
 * panel关闭时回收内存
 */
$.fn.panel.defaults.onBeforeDestroy = function() {
	var frame = $('iframe', this);
	try {
		if (frame.length > 0) {
			for ( var i = 0; i < frame.length; i++) {
				frame[i].contentWindow.document.write('');
				frame[i].contentWindow.close();
			}
			frame.remove();
			if ($.browser.msie) {
				CollectGarbage();
			}
		}
	} catch (e) {
	}
};

/**
 * @author 陈俊
 * 
 * 获得项目根路径
 * 
 * 使用方法：sy.bp();
 * 
 * @returns 项目根路径
 */
sy.bp = function() {
        var curWwwPath = window.document.location.href;
        var pathName = window.document.location.pathname;
        var pos = curWwwPath.indexOf(pathName);
        var localhostPaht = curWwwPath.substring(0, pos);
        var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
        return (localhostPaht + projectName);
};


/**
 * @author 陈俊
 * 
 * 加载页面的效果
 * 
 * 使用方法：loadDataWithTime(时间间隔, 时间);
 * 
 */
function loadDataWithTime(timeInterval, totalTime) {
    $.messager.progress({
       	text : '页面加载中....',
        interval : timeInterval
    });
    window.setTimeout(function() {
        try {
        	$.messager.progress('close');
        } catch (e) {
        }
    }, totalTime);
};

/**
 * @author 陈俊
 * 
 * @requires jQuery,EasyUI
 * 
 * @param options
 */
sy.dialog = function(options) {
	var opts = $.extend({
		modal : true,
		onClose : function() {
			$(this).dialog('destroy');
		}
	}, options);
	return $('<div/>').dialog(opts);
};

/**
 * @author 陈俊
 * 
 * @requires jQuery,EasyUI
 */
sy.messagerShow = function(options) {
	return $.messager.show(options);
};

/**
 * @author 陈俊
 * 
 * 增加formatString功能
 * 
 * 使用方法：sy.fs('字符串{0}字符串{1}字符串','第一个变量','第二个变量');
 * 
 * @returns 格式化后的字符串
 */
sy.fs = function(str) {
	for ( var i = 0; i < arguments.length - 1; i++) {
		str = str.replace("{" + i + "}", arguments[i + 1]);
	}
	return str;
};

/**
 * @author 陈俊
 * 
 * @requires jQuery,EasyUI
 */
sy.messagerAlert = function(title, msg, icon, fn) {
	return $.messager.alert(title, msg, icon, fn);
};

/**
 * @author 陈俊
 * 
 * @requires jQuery,EasyUI
 * @param title 标题
 * @param msg 提示信息
 * @param fun 回调方法
 */
sy.messagerConfirm = function(title, msg, fn) {
	return $.messager.confirm(title, msg, fn);
};

/**
 * @author 陈俊
 * 
 * @requires jQuery
 * 
 * 判断浏览器是否是IE并且版本小于9
 * 
 * @returns true/false
 */
sy.isLessThanIe9 = function() {
	return ($.browser.msie && $.browser.version <= 9);
};
