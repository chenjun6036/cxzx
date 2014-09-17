package cn.njust.cxzx.action;

import javax.annotation.Resource;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;

import cn.njust.cxzx.action.BaseAction;
import cn.njust.cxzx.pageModel.DataGrid;
import cn.njust.cxzx.pageModel.MultiPurposePage;
import cn.njust.cxzx.service.IMultiPurposeService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;
@SuppressWarnings("serial")
@Namespace("/")
@Action(value="multiPurposeAction",
	results={
		@Result(name="Unique",location="/CenterOverview/CenterOverview.jsp",type="dispatcher"),
		@Result(name="noticeList",location="/notice/notice.jsp",type="dispatcher"),
		@Result(name="multiList",location="/MultiPurpose/MultiList.jsp",type="dispatcher"),
		@Result(name="MutilDetail",location="/MultiPurpose/MultiDetail.jsp",type="dispatcher")
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
	
	public String getUnique(){
		multiPurposeService.getUniqueByType(multiPurposePage);
		return "Unique";
	}
	
	public String getMultiList(){
		DataGrid dgs = multiPurposeService.getMultiListByType(multiPurposePage);
		int total = (int) (dgs.getTotal()/multiPurposePage.getRows() + (dgs.getTotal()%multiPurposePage.getRows()==0?0:1));
		int prior,next;
		ActionContext.getContext().put("list", dgs.getRows());
		ActionContext.getContext().put("total", total);
		prior = multiPurposePage.getPage() - 1;
		next = multiPurposePage.getPage() + 1;
		if(multiPurposePage.getPage() == 1){
			prior = multiPurposePage.getPage();
		}
		if(multiPurposePage.getPage() == total){
			next = multiPurposePage.getPage();
		}
		
		ActionContext.getContext().put("prior", prior);
		ActionContext.getContext().put("next", next);
		return "multiList";
	}
	
	public String getMultiDetail(){
		multiPurposeService.getMulti(multiPurposePage);
		return "MutilDetail";
	}
	public String getNoticeList(){
		DataGrid dgs = multiPurposeService.getMultiListByType(multiPurposePage);
		ActionContext.getContext().put("list", dgs.getRows());
		return "noticeList";
	}
	
	

}
