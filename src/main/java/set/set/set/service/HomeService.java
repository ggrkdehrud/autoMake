package set.set.set.service;

import set.set.set.bean.HomeBean;

public interface HomeService {
	public HomeBean readData(HomeBean homeBean);
	public void insertData(HomeBean homeBean);
	public void deleteData(HomeBean homeBean);
	public void updateData(HomeBean homeBean);
}
