package cn.njust.cxzx.action.admin;

import java.text.ParseException;
import javax.annotation.Resource;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;

import cn.njust.cxzx.action.BaseAction;
import cn.njust.cxzx.pageModel.DataGrid;
import cn.njust.cxzx.pageModel.Json;
import cn.njust.cxzx.pageModel.MultiPurposePage;
import cn.njust.cxzx.service.IMultiPurposeService;

import com.opensymphony.xwork2.ModelDriven;
@SuppressWarnings("serial")
@Namespace("/admin")
@Action(value="multiPurposeAction",
	results={
		@Result(name="overview",location="/admin/CenterOverview/CenterOverview.jsp",type="dispatcher"),
		@Result(name="editMulti",location="/admin/newsManage/editNews.jsp",type="dispatcher")
})
public class MultiPurposeAction extends BaseAction implements
		ModelDriven<MultiPurposePage> {
	private MultiPurposePage multiPurposePage = new MultiPurposePage();
	@Resource
	private IMultiPurposeService multiPurposeService;
	@Override
	public MultiPurposePage getModel() {
		// TODO Auto-generated method stub
		return multiPurposePage;
	}
	
	public void addMultiPurpose(){
		Json json = new Json();
		try {
			multiPurposeService.save(multiPurposePage);
			json.setSuccess(true);
			json.setMsg("添加成功！");
		} catch (Exception e) {
			json.setSuccess(false);
			json.setMsg("添加失败！");
		}finally{
			super.writeJson(json);
		}		
	}
	
	public void getMultiList() throws ParseException{		
		DataGrid dgs = multiPurposeService.getMultiListByType(multiPurposePage);
		super.writeJson(dgs);
	}
	public String getUnique(){
		multiPurposeService.getUniqueByType(multiPurposePage);
		return "overview";
	}
	
	public void MultiEdit(){
		Json json = new Json();
		try {
			multiPurposeService.updateMulti(multiPurposePage);
			json.setSuccess(true);
			json.setMsg("修改成功！");
		} catch (Exception e) {
			json.setSuccess(false);
			json.setMsg("修改失败！");
		}finally{
			super.writeJson(json);
		}		
	}
	
	public void deleteMulti(){
		Json json = new Json();
		try {
			multiPurposeService.deleteMulti(multiPurposePage);
			json.setSuccess(true);
			json.setMsg("删除成功！");
		} catch (Exception e) {
			json.setSuccess(false);
			json.setMsg("删除失败！");
		}finally{
			super.writeJson(json);
		}
	}
	
	public String MultiEditForward(){
		multiPurposeService.getMulti(multiPurposePage);
		return "editMulti";
	}
	/*public String getOverview(){
		getUnique();
		return "overview";
	}*/
	public void setUnique(){
		Json json = new Json();
		try {
			multiPurposeService.setUniqueByType(multiPurposePage);
			json.setSuccess(true);
			json.setMsg("添加成功！");
		} catch (Exception e) {
			json.setSuccess(false);
			json.setMsg("添加失败！");
		}finally{
			super.writeJson(json);
		}	
	}

}
