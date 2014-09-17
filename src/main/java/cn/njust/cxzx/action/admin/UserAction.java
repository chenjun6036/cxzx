package cn.njust.cxzx.action.admin;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;

import cn.njust.cxzx.action.BaseAction;
import cn.njust.cxzx.pageModel.Json;
import cn.njust.cxzx.pageModel.SessionInfo;
import cn.njust.cxzx.pageModel.User;
import cn.njust.cxzx.service.IUserService;
import cn.njust.cxzx.utils.IpUtil;
import cn.njust.cxzx.utils.ResourceUtil;

import com.opensymphony.xwork2.ModelDriven;
@Namespace("/admin")
@Action("userAction")
public class UserAction extends BaseAction implements ModelDriven<User>{
	private User user = new User();
	@Resource
	private IUserService userService;
	@Override
	public User getModel() {
		// TODO Auto-generated method stub
		return user;
	}
	
	public void login(){
		Json j = new Json();
		User u = userService.login(user);
		if (u != null) {
			SessionInfo sessionInfo = new SessionInfo();
			sessionInfo.setUserId(u.getId());
			sessionInfo.setLoginName(user.getRealName());
			sessionInfo.setLoginPassword(user.getPassword());
			sessionInfo.setIp(IpUtil.getIpAddr(ServletActionContext.getRequest()));
			ServletActionContext.getRequest().getSession().setAttribute(ResourceUtil.getSessionInfoName(), sessionInfo);
			j.setObj(sessionInfo);
			j.setMsg("登录成功！");
			j.setSuccess(true);
		} else {
			j.setMsg("登录失败！用户名或密码错误！");
		}
		super.writeJson(j);
	}
	
	public void logout(){
		ServletActionContext.getRequest().getSession().invalidate();
		Json j = new Json();
		j.setSuccess(true);
		super.writeJson(j);
	}
	
	public void datagrid(){
		super.writeJson(userService.datagrid(user));
	}
	public void delete() {
		userService.delete(user.getIds());
		Json j=new Json();
		j.setSuccess(true);
		j.setMsg("删除成功");
		super.writeJson(j);
	}
	public void edit(){
		Json j=new Json();
		try {
			user=userService.update(user);		
			j.setSuccess(true);
			j.setMsg("编辑成功");
		} catch (Exception e) {
			e.printStackTrace();
		}
		super.writeJson(j);
	}
	// 注册
	public void reg() {
		Json j = new Json();
		try {
			user = userService.save(user);				
			j.setSuccess(true);
			j.setMsg("添加成功!");	
		} catch (Exception e) {
			e.printStackTrace();
		}
		super.writeJson(j);
	}
	public void rePwd(){
		Json j=new Json();
		try {
			user=userService.rePwd(user,((SessionInfo)ServletActionContext.getRequest().getSession().getAttribute(ResourceUtil.getSessionInfoName())).getLoginName());		
			j.setSuccess(true);
			j.setMsg("编辑成功");
		} catch (Exception e) {
			e.printStackTrace();
		}
		super.writeJson(j);
		
	}

}
