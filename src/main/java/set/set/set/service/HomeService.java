package set.set.set.service;

import java.util.ArrayList;

import set.set.set.bean.HomeBean;

public interface HomeService {
	public ArrayList<HomeBean> readAllData();
	public HomeBean readData(String primaryKey);
	public void insertData(HomeBean homeBean);
	public void deleteData(HomeBean homeBean);
	public void updateData(HomeBean homeBean);
}
