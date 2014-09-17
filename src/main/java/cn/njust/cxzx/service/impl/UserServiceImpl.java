package cn.njust.cxzx.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;


import cn.njust.cxzx.dao.IBaseDao;
import cn.njust.cxzx.model.Systemuser;
import cn.njust.cxzx.pageModel.DataGrid;
import cn.njust.cxzx.pageModel.User;
import cn.njust.cxzx.service.IUserService;
import cn.njust.cxzx.utils.Encrypt;

@Service("userService")
public class UserServiceImpl implements IUserService {
	@Resource(name="baseDao")
	private IBaseDao<Systemuser> userDao;
	@Override
	public User login(User user) {
		String hql = "FROM Systemuser WHERE userName = :username and password = :password";
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("username", user.getUserName());
		params.put("password", Encrypt.e(user.getPassword()));
		
		Systemuser t = userDao.get(hql, params);
		
		if (t != null) {
			BeanUtils.copyProperties(t, user, new String[] { "password" });
			return user;
		}

		return null;
	}

	@Override
	public User save(User user) {
		Systemuser t=new Systemuser();
		t.setRealName(user.getRealName());
		t.setUserName(user.getUserName());
		t.setPassword(Encrypt.e(user.getPassword()));
		userDao.save(t);
		BeanUtils.copyProperties(t, user, new String[]{"id"});
		return user;
	}

	@Override
	public DataGrid datagrid(User user) {
		DataGrid dg=new DataGrid();
		String hql="FROM Systemuser";
		String totalhql="select count(*) "+hql;	
		List<Systemuser> l=userDao.find(hql,user.getPage(),user.getRows());
		List<User> nl=new ArrayList<User>();
		changeModel(l, nl);
		dg.setTotal(userDao.count(totalhql));
		dg.setRows(nl);
		return dg;
	}
	private void changeModel(List<Systemuser> l, List<User> nl) {
		if (l != null && l.size()>0) {
			for(Systemuser t:l){
				User u= new User();
				BeanUtils.copyProperties(t, u);
				nl.add(u);
			}
		}
	}

	@Override
	public User update(User user) {
		String hql = "FROM Systemuser t WHERE t.id in ("+user.getId()+")";
		Systemuser t = userDao.get(hql);
		t.setRealName(user.getRealName());
		t.setUserName(user.getUserName());
		t.setPassword(Encrypt.e(user.getPassword()));
		userDao.save(t);
		BeanUtils.copyProperties(t, user);
		return user;
		
	}

	@Override
	public void delete(String ids) {
		String[] nids=ids.split(",");
		String hql="delete Systemuser t where t.id in(";
		for(int i=0;i<nids.length;i++){
			if (i>0) {
				hql +=",";
			}
			hql +="'"+nids[i]+"'";
		}
		hql +=")";
		userDao.executeUpdate(hql);
	}

	@Override
	public User rePwd(User user, String userName) {
		String hql = "FROM Systemuser t WHERE t.userName ='"+userName+"'";		
		Systemuser t = userDao.get(hql);
		if(t.getPassword()==Encrypt.e(user.getRepassword())){
			t.setPassword(Encrypt.e(user.getPassword()));
			userDao.save(t);
			BeanUtils.copyProperties(t, user);
			return user;
		}
		else{
			return null;
		}
	}

}
