package set.set.set.dao;

import set.set.set.bean.HomeBean;

public interface HomeDao {
	public HomeBean readData(HomeBean homeBean);
	public void insertData(HomeBean homeBean);
	public void deleteData(HomeBean homeBean);
	public void updateData(HomeBean homeBean);
}
