package cn.njust.cxzx.service;

import cn.njust.cxzx.pageModel.DataGrid;
import cn.njust.cxzx.pageModel.User;


public interface IUserService {
	public User login(User user);

	public User save(User user);

	public DataGrid datagrid(User user);

	public void delete(String integer);

	public User update(User user);

	public User rePwd(User user, String userName);
}
