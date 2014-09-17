package cn.njust.cxzx.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;

@SuppressWarnings("serial")
@Namespace("/test")
@Action(value="testAction",results={@Result(name="test",location="/indexEnglish.jsp")})
public class TestAction extends BaseAction {
	public String execute(){
		
		return "test";
	}
}
