package cn.njust.cxzx.service.impl;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import cn.njust.cxzx.dao.IBaseDao;
import cn.njust.cxzx.model.Attachment;
import cn.njust.cxzx.model.Multipurpose;
import cn.njust.cxzx.pageModel.DataGrid;
import cn.njust.cxzx.pageModel.MultiPurposePage;
import cn.njust.cxzx.service.IMultiPurposeService;
@Service("multiPurposeService")
public class MultiPurposeServiceImpl implements IMultiPurposeService {
	@Resource(name="baseDao")
	private IBaseDao<Multipurpose> multiPurposeDao;
	@Resource(name="baseDao")
	private IBaseDao<Attachment> attachmentDao;
	@Override
	public void save(MultiPurposePage multiPurposePage) {
		Multipurpose multipurpose = new Multipurpose();
		BeanUtils.copyProperties(multiPurposePage, multipurpose);
		multipurpose.setCreateTime(new Timestamp(System.currentTimeMillis()));
		multiPurposeDao.save(multipurpose);
		if (multiPurposePage.getUrl() != null && !"".equals(multiPurposePage.getUrl())) {
			Attachment attachment = new Attachment();
			attachment.setFileName(multiPurposePage.getFileName());
			attachment.setMultipurpose(multipurpose);
			attachment.setUploadTime(new Timestamp(System.currentTimeMillis()));
			attachment.setUrl(multiPurposePage.getUrl());
			attachmentDao.save(attachment);
		}
	}
	@Override
	public void getUniqueByType(MultiPurposePage multiPurposePage) {
		String hql = "From Multipurpose where type = "+multiPurposePage.getType();
		Multipurpose multipurpose = multiPurposeDao.get(hql);
		if(multipurpose!=null)
			BeanUtils.copyProperties(multipurpose, multiPurposePage);
	}
	@Override
	public void setUniqueByType(MultiPurposePage multiPurposePage) {
		String hql = "From Multipurpose where type = "+multiPurposePage.getType();
		Multipurpose multipurpose = multiPurposeDao.get(hql);
		if(multipurpose==null){
			multipurpose = new Multipurpose();
			BeanUtils.copyProperties(multiPurposePage, multipurpose);
			multipurpose.setCreateTime(new Timestamp(System.currentTimeMillis()));
			multiPurposeDao.save(multipurpose);
		}else{
			BeanUtils.copyProperties(multiPurposePage, multipurpose,new String[]{"id"});
			multiPurposeDao.update(multipurpose);
		}
	}
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public DataGrid getMultiListByType(MultiPurposePage multiPurposePage) {
		String hql = "From Multipurpose where type = :type";
		Map params = new HashMap<String, Object>();
		params.put("type", multiPurposePage.getType());
		if(multiPurposePage.getTitle() !=null && !multiPurposePage.getTitle().equals("")){
			hql += " and title like :title";
			params.put("title","%"+ multiPurposePage.getTitle()+"%");
		}
		if(multiPurposePage.getTimeBegin()!=null){
			hql += " and createTime >= :timeBegin";
			params.put("timeBegin", multiPurposePage.getTimeBegin());
		}
		if(multiPurposePage.getTimeEnd()!=null){
			hql += " and createTime <= :timeEnd";
			params.put("timeEnd", multiPurposePage.getTimeEnd());
		}
		hql += " order by createTime desc";
		List<Multipurpose> multiList = multiPurposeDao.find(hql,params, multiPurposePage.getPage(), multiPurposePage.getRows());
		hql = "select count(*) " + hql;
		Long total = multiPurposeDao.count(hql,params);
		List<MultiPurposePage> list = new ArrayList<MultiPurposePage>();
		for (Multipurpose multipurpose : multiList) {
			MultiPurposePage page = new MultiPurposePage();
			BeanUtils.copyProperties(multipurpose, page, new String[]{"content"});
			page.setTime(SimpleDateFormat.getDateTimeInstance().format(multipurpose.getCreateTime()));
			list.add(page);
		}
		DataGrid dataGrid = new DataGrid();
		dataGrid.setRows(list);
		dataGrid.setTotal(total);
		return dataGrid;
	}
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public void getMulti(MultiPurposePage multiPurposePage) {
		// TODO Auto-generated method stub
		String hql = "From Multipurpose where id = :id";
		Map params = new HashMap<String, Object>();
		params.put("id", multiPurposePage.getId());
		Multipurpose multipurpose = multiPurposeDao.get(hql,params);
		multiPurposePage.setContent(multipurpose.getContent());
		multiPurposePage.setTitle(multipurpose.getTitle());
		multiPurposePage.setType(multipurpose.getType());
		multiPurposePage.setTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(multipurpose.getCreateTime()));
	}
	@Override
	public void updateMulti(MultiPurposePage multiPurposePage) {
		Multipurpose t = multiPurposeDao.get(Multipurpose.class, multiPurposePage.getId());
		t.setContent(multiPurposePage.getContent());
		t.setTitle(multiPurposePage.getTitle());
		multiPurposeDao.update(t);
	}
	@Override
	public void deleteMulti(MultiPurposePage multiPurposePage) {
		String ids[] = multiPurposePage.getIds().split(",");
		StringBuffer hql = new StringBuffer("delete from Multipurpose m where m.id in(");
		for(int i=0; i<ids.length ;i++){
			if(i > 0){
				hql.append(',');
			}
			hql.append(ids[i]);
		}
		hql.append(")");
		multiPurposeDao.executeUpdate(hql.toString());
	}

}
