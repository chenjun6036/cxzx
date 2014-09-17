package cn.njust.cxzx.service;

import cn.njust.cxzx.pageModel.DataGrid;
import cn.njust.cxzx.pageModel.MultiPurposePage;

public interface IMultiPurposeService {

	void save(MultiPurposePage multiPurposePage);

	void getUniqueByType(MultiPurposePage multiPurposePage);

	void setUniqueByType(MultiPurposePage multiPurposePage);

	DataGrid getMultiListByType(MultiPurposePage multiPurposePage);

	void getMulti(MultiPurposePage multiPurposePage);

	void updateMulti(MultiPurposePage multiPurposePage);

	void deleteMulti(MultiPurposePage multiPurposePage);

}
